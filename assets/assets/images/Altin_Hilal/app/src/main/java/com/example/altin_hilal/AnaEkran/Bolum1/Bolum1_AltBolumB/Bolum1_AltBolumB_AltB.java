package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumB;

import android.app.Dialog;
import android.content.ClipData;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.view.DragEvent;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal. R;

public class Bolum1_AltBolumB_AltB extends AppCompatActivity {

    int eslesmeSayisi = 0;
    int score = 0;
    final int toplamSoru = 10;

    private LinearLayout maddiArea, manaArea;
    private TextView scoreTextView;
    TextView GameAbout1e;
    ImageButton btnInfob5;

    private String selectedLanguage = "English";
    private LinearLayout originalWordList;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_bolum1_alt_bolum_balt_b);

        maddiArea = findViewById(R.id.maddi_area);
        manaArea = findViewById(R.id.mana_area);
        scoreTextView = findViewById(R.id.score);
        GameAbout1e = findViewById(R.id.GameAbout1e);
        btnInfob5 = findViewById(R.id.btnInfob5);

        originalWordList = findViewById(R.id.word_list);

        if (savedInstanceState == null) {
            showInfoDialog();
        }

        GameAbout1e.setOnClickListener(v -> showInfoDialog());
        btnInfob5.setOnClickListener(v -> showInfoDialog());

        setupLanguageSpinner();
        setupImageDragListeners();
        setupDropListeners();
        updateScoreText();
    }

    private void setupLanguageSpinner() {
        Spinner spinnerLanguage = findViewById(R.id.spinnerLanguage);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                this,
                R.array.language_array,
                R.layout.spinner_item_1a
        );

        adapter.setDropDownViewResource(R.layout.spinner_item_dropdown_1a);
        spinnerLanguage.setAdapter(adapter);

        spinnerLanguage.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                selectedLanguage = parent.getItemAtPosition(position).toString();

                if (selectedLanguage.equals("English")) {
                    GameAbout1e.setText("About the Game");
                    scoreTextView.setText("Score:");
                } else {
                    GameAbout1e.setText("Oyun Hakkında");
                    scoreTextView.setText("Skor:");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {}
        });
    }

    private void setupImageDragListeners() {

        for (int i = 0; i < originalWordList.getChildCount(); i++) {
            LinearLayout row = (LinearLayout) originalWordList.getChildAt(i);

            for (int j = 0; j < row.getChildCount(); j++) {
                View child = row.getChildAt(j);

                if (child instanceof ImageView) {

                    child.setOnTouchListener((v, event) -> {
                        if (event.getAction() == MotionEvent.ACTION_DOWN) {

                            ClipData data = ClipData.newPlainText("", "");
                            View.DragShadowBuilder shadow = new View.DragShadowBuilder(v);

                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                                v.startDragAndDrop(data, shadow, v, 0);
                            } else {
                                v.startDrag(data, shadow, v, 0);
                            }
                            return true;
                        }
                        return false;
                    });
                }
            }
        }
    }

    private void setupDropListeners() {
        maddiArea.setOnDragListener(this::handleDropEvent);
        manaArea.setOnDragListener(this::handleDropEvent);
    }

    // HANDLE DROP - ✨ SON VERSİYON (Boyut ve Margin Ayarı Eklendi)
    private boolean handleDropEvent(View target, DragEvent event) {

        if (event.getAction() == DragEvent.ACTION_DROP) {

            View draggedView = (View) event.getLocalState();

            // 1. View'ı Parent'tan ÇIKAR (Parent hatasını engeller)
            ViewGroup parent = (ViewGroup) draggedView.getParent();
            if (parent != null) parent.removeView(draggedView);

            boolean isCorrect =
                    (target.getId() == R.id.maddi_area && isMaddiWord(draggedView)) ||
                            (target.getId() == R.id.mana_area && isManaWord(draggedView));

            if (isCorrect) {
                score += 10;
                eslesmeSayisi++;

                // 2. YENİ DÜZELTME: View'ın boyut ve margin ayarlarını yap
                LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                        LinearLayout.LayoutParams.MATCH_PARENT,
                        (int) getResources().getDimension(R.dimen.default_image_height)
                );
                // Üst ve Alt marginleri ekle
                int margin = (int) getResources().getDimension(R.dimen.default_margin);
                params.setMargins(0, margin, 0, margin);

                draggedView.setLayoutParams(params);

                // 3. Doğru alana ekle
                ((LinearLayout) target).addView(draggedView);
                draggedView.setVisibility(View.VISIBLE);

            } else {
                score -= 10;
                // Yanlışsa orijinal yerine geri koy
                resetPosition(draggedView);
            }

            updateScoreText();

            if (eslesmeSayisi == toplamSoru)
                showResultDialog();

            return true;
        }

        return true;
    }

    // RESET FONKSIYONU – GÜVENLİ VERSİYON
    private void resetPosition(View view) {

        view.setVisibility(View.VISIBLE);

        // Hangi kelimenin hangi sıraya ait olduğunu bul
        int index = 0;
        String tagValue = view.getTag().toString();

        // XML taglerine göre manuel index eşlemesi
        if (tagValue.equals("Kalp")) index = 0;
        else if (tagValue.equals("Ruh")) index = 1;
        else if (tagValue.equals("Hafi")) index = 2;
        else if (tagValue.equals("Su")) index = 3;
        else if (tagValue.equals("Sır")) index = 4;
        else if (tagValue.equals("Toprak")) index = 5;
        else if (tagValue.equals("Ateş")) index = 6;
        else if (tagValue.equals("Ahfa")) index = 7;
        else if (tagValue.equals("Hava")) index = 8;
        else if (tagValue.equals("Nefis")) index = 9;

        // Orijinal satırı bul (Her satırda 2 View olduğu için index/2)
        LinearLayout row = (LinearLayout) originalWordList.getChildAt(index / 2);

        // View'ı tekrar orijinal satırına ekle
        row.addView(view);
    }

    private boolean isMaddiWord(View view) {
        String tag = (String) view.getTag();
        return tag.contains("Hava") || tag.contains("Su") ||
                tag.contains("Toprak") || tag.contains("Ateş") ||
                tag.contains("Kalp");
    }

    private boolean isManaWord(View view) {
        String tag = (String) view.getTag();
        return tag.contains("Nefis") || tag.contains("Ahfa") ||
                tag.contains("Sır") || tag.contains("Ruh") ||
                tag.contains("Hafi");
    }

    private void updateScoreText() {
        scoreTextView.setText("Score: " + score);
    }

    // Bolum1_AltBolumB_AltB.java dosyasındaki metot:

    private void showInfoDialog() {

        LayoutInflater inflater = LayoutInflater.from(Bolum1_AltBolumB_AltB.this);

        // Paylaştığınız XML'in adı `info_b1_button1b.xml` olmalı
        View view = inflater.inflate(R.layout.info_b1_button1b, null);

        TextView dialogTitle = view.findViewById(R.id.dialogTitle1e);
        TextView dialogMessage = view.findViewById(R.id.dialogMessage1e);

        // Dil Ayarı (Mevcut kodunuzdaki gibi)
        if (selectedLanguage.equals("English")) {
            dialogTitle.setText("🎮 About the Game");
            dialogMessage.setText(
                    "🎯 Goal: Match images by dragging them to the correct area.\n\n" +
                            "✔ Correct = +10\n❌ Wrong = -10\n\n🏁 Complete all to finish."
            );
        } else {
            dialogTitle.setText("🎮 Oyun Hakkında");
            dialogMessage.setText(
                    "🎯 Amaç: İmgeleri doğru alana sürükle.\n\n" +
                            "✔ Doğru = +10\n❌ Yanlış = -10\n\n🏁 Tümü bitince sonuç ekranı açılır."
            );
        }

        androidx.appcompat.app.AlertDialog.Builder builder = new androidx.appcompat.app.AlertDialog.Builder(this);
        builder.setView(view);
        builder.setPositiveButton(selectedLanguage.equals("English") ? "OK" : "Anladım", (dialog, id) -> dialog.dismiss());
        androidx.appcompat.app.AlertDialog dialog = builder.create();
        dialog.show();

// Buton rengi
        dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                .setTextColor(ContextCompat.getColor(Bolum1_AltBolumB_AltB.this, R.color.colorButtonRed));
        // Arka plan rengi (bütün kutuya)
        dialog.getWindow().setBackgroundDrawable(
                ContextCompat.getDrawable(Bolum1_AltBolumB_AltB.this, R.drawable.bg_dialog_gradient_b1b)
        );

    }

    private void showResultDialog() {

        Dialog dialog = new Dialog(this);
        dialog.setContentView(R.layout.dialog_result_b1b);
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));

        TextView resultText = dialog.findViewById(R.id.result_text);
        TextView scoreText = dialog.findViewById(R.id.dialog_score);
        TextView option1 = dialog.findViewById(R.id.option1);
        TextView option2 = dialog.findViewById(R.id.option2);

        scoreText.setText("Skorunuz: " + score);

        if (score >= (toplamSoru * 10) / 2) {

            DatabaseHelper dbHelper = new DatabaseHelper(this);
            dbHelper.updateTamamlandiByAd("BolumB");
            dbHelper.updateTamamlandiByAd("Bolum1_AltBolumB_AltB");

            resultText.setText("Tebrikler! Başarıyla tamamladınız.");
            option1.setText("Sonraki Seviye");
            option2.setText("Anasayfa");

        } else {
            resultText.setText("Üzgünüz, başarısız oldunuz.");
            option1.setText("Yeniden Başlat");
            option2.setText("Anasayfa");
        }

        option1.setOnClickListener(v -> {
            dialog.dismiss();

            if (score >= (toplamSoru * 10) / 2) {
                startActivity(new Intent(this, Bolum1_AltBolumB_AltAna.class));
                finish();
            } else {
                recreate();
            }
        });

        option2.setOnClickListener(v -> {
            dialog.dismiss();
            startActivity(new Intent(this, Bolum1_AltBolumB_AltAna.class));
            finish();
        });
        dialog.show();
    }
}