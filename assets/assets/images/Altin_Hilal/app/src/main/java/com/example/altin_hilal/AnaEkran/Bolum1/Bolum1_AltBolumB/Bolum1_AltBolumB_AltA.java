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
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.R;

public class Bolum1_AltBolumB_AltA extends AppCompatActivity {
    int eslesmeSayisi = 0;
    int score = 0;
    final int toplamSoru = 10;

    private LinearLayout maddiArea, manaArea;
    private TextView scoreTextView;
    TextView GameAbout1e;
    ImageButton btnInfob5;
    private String selectedLanguage = "English"; // Varsayılan değer

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bolum1_alt_bolum_aalt_a);

        maddiArea = findViewById(R.id.maddi_area);
        manaArea = findViewById(R.id.mana_area);
        scoreTextView = findViewById(R.id.score);
        GameAbout1e = findViewById(R.id.GameAbout1e);
        btnInfob5 = findViewById(R.id.btnInfob5);

        if (savedInstanceState == null) {
            showInfoDialog();
        }

        GameAbout1e.setOnClickListener(v -> {
            showInfoDialog();
        });
        btnInfob5.setOnClickListener(v -> {
            showInfoDialog();
        });

        Spinner spinnerLanguage = findViewById(R.id.spinnerLanguage);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                this,
                R.array.language_array,
                R.layout.spinner_item_1a // sadece baştaki görünüm
        );

        adapter.setDropDownViewResource(R.layout.spinner_item_dropdown_1a); // açılır liste görünümü
        spinnerLanguage.setAdapter(adapter);


        spinnerLanguage.setAdapter(adapter);

        spinnerLanguage.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                selectedLanguage = parent.getItemAtPosition(position).toString();

                // Örnek: Seçilen dile göre işlem yapılabilir
                if (selectedLanguage.equals("English")) {
                    GameAbout1e.setText("About the Game");
                    scoreTextView.setText("Score:");
                } else if (selectedLanguage.equals("Türkçe")) {
                    // Türkçe için işlem
                    GameAbout1e.setText("Oyun Hakkında");
                    scoreTextView.setText("Skor:");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // Seçim yapılmadığında yapılacaklar
            }
        });

        setupWordDragListeners();
        setupDropListeners();

        updateScoreText();
    }

    private void setupWordDragListeners() {
        LinearLayout wordList = findViewById(R.id.word_list);
        for (int i = 0; i < wordList.getChildCount(); i++) {
            LinearLayout row = (LinearLayout) wordList.getChildAt(i);
            for (int j = 0; j < row.getChildCount(); j++) {
                View child = row.getChildAt(j);
                if (child instanceof TextView) {
                    TextView word = (TextView) child;
                    word.setOnTouchListener((v, event) -> {
                        if (event.getAction() == MotionEvent.ACTION_DOWN) {
                            ClipData data = ClipData.newPlainText("", "");
                            View.DragShadowBuilder shadowBuilder = new View.DragShadowBuilder(v);
                            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                                v.startDragAndDrop(data, shadowBuilder, v, 0);
                            } else {
                                v.startDrag(data, shadowBuilder, v, 0);
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
        maddiArea.setOnDragListener((view, event) -> handleDropEvent(view, event));
        manaArea.setOnDragListener((view, event) -> handleDropEvent(view, event));
    }

    private boolean handleDropEvent(View view, DragEvent event) {
        switch (event.getAction()) {
            case DragEvent.ACTION_DRAG_STARTED:
                return true;

            case DragEvent.ACTION_DRAG_ENTERED:
                return true;

            case DragEvent.ACTION_DRAG_EXITED:
                return true;

            case DragEvent.ACTION_DROP:
                View draggedView = (View) event.getLocalState();
                ViewGroup parent = (ViewGroup) draggedView.getParent();
                if (parent != null) {
                    parent.removeView(draggedView);
                }

                boolean isCorrect = (view.getId() == R.id.maddi_area && ismaddiWord(draggedView)) ||
                        (view.getId() == R.id.mana_area && ismanaWord(draggedView));

                if (isCorrect) {
                    score += 10;
                    eslesmeSayisi++;
                    LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
                            LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
                    layoutParams.setMargins(10, 10, 10, 10);
                    ((LinearLayout) view).addView(draggedView, layoutParams);
                    draggedView.setVisibility(View.VISIBLE);
                } else {
                    score -= 10;
                    resetPosition(draggedView);
                }
                updateScoreText();

                if (eslesmeSayisi == toplamSoru) {
                    showResultDialog();
                }

                return true;

            default:
                return false;
        }
    }

    private int getVisibleTextViewCount(LinearLayout area) {
        int count = 0;
        for (int i = 0; i < area.getChildCount(); i++) {
            View child = area.getChildAt(i);
            if (child instanceof TextView && child.getVisibility() == View.VISIBLE) {
                count++;
            }
        }
        return count;
    }

    private void updateScoreText() {
        scoreTextView.setText("Score: " + score);
    }

    private void resetPosition(View view) {
        view.setVisibility(View.VISIBLE);
        LinearLayout originalArea = findViewById(R.id.word_list);
        ViewGroup parent = (ViewGroup) view.getParent();
        if (parent != null) {
            parent.removeView(view);
        }

        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT);
        layoutParams.setMargins(16, 10, 16, 10);
        originalArea.addView(view, layoutParams);
    }

    private boolean ismaddiWord(View view) {
        if (view instanceof TextView) {
            String word = ((TextView) view).getText().toString();
            return word.equals("Hava") || word.equals("Su") || word.equals("Toprak") ||
                    word.equals("Ateş") || word.equals("Kalp");

        }
        return false;
    }

    private boolean ismanaWord(View view) {
        if (view instanceof TextView) {
            String word = ((TextView) view).getText().toString();
            return word.equals("Nefis") || word.equals("Ahfa") || word.equals("Sır") ||
                    word.equals("Ruh") || word.equals("Hafi");
        }
        return false;
    }

    private void showInfoDialog() {
        LayoutInflater inflater = LayoutInflater.from(Bolum1_AltBolumB_AltA.this);
        View view = inflater.inflate(R.layout.info_b1_button1b, null);
        TextView dialogTitle = view.findViewById(R.id.dialogTitle1e);
        TextView dialogMessage = view.findViewById(R.id.dialogMessage1e);


        if (selectedLanguage.equals("English")) {
            dialogTitle.setText("🎮 About the Game");
            dialogMessage.setText("🎯 Goal: Match the maddi and mana personality traits by dragging them to the correct area.\n\n" +
                    "✅ Correct match: +10 points\n" +
                    "❌ Incorrect match: -10 points\n\n" +
                    "🏁 When all words are placed, the result screen opens.\n" +
                    "💡 You can proceed to the next level if you score enough points!");
        } else {
            dialogTitle.setText("🎮 Oyun Hakkında");
            dialogMessage.setText("🎯 Amaç: İngilizce olumlu ve olumsuz kişilik özelliklerini doğru alana sürükleyerek eşleştir.\n\n" +
                    "✅ Doğru eşleşme: +10 puan\n" +
                    "❌ Yanlış eşleşme: -10 puan\n\n" +
                    "🏁 Tüm kelimeler yerleşince sonuç ekranı açılır.\n" +
                    "💡 Yeterli puanla bir sonraki bölüme geçebilirsiniz!");
        }

        androidx.appcompat.app.AlertDialog.Builder builder = new androidx.appcompat.app.AlertDialog.Builder(this);
        builder.setView(view);
        builder.setPositiveButton(selectedLanguage.equals("English") ? "OK" : "Anladım", (dialog, id) -> dialog.dismiss());
        androidx.appcompat.app.AlertDialog dialog = builder.create();
        dialog.show();

// Buton rengi
        dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                .setTextColor(ContextCompat.getColor(Bolum1_AltBolumB_AltA.this, R.color.colorButtonRed));
        // Arka plan rengi (bütün kutuya)
        dialog.getWindow().setBackgroundDrawable(
                ContextCompat.getDrawable(Bolum1_AltBolumB_AltA.this, R.drawable.bg_dialog_gradient_b1b)
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
            DatabaseHelper dbHelper = new DatabaseHelper(Bolum1_AltBolumB_AltA.this);
            dbHelper.updateTamamlandiByAd("BolumA");
            dbHelper.updateTamamlandiByAd("Bolum1_AltBolumA_AltE");
            resultText.setText("Tebrikler! Başarıyla tamamladınız.");
            option1.setText("Sonraki Seviye");
            option2.setText("Anasayfa");
        } else {
            resultText.setText("Üzgünüz, yeterli başarı sağlanamadı.");
            option1.setText("Yeniden Başlat");
            option2.setText("Anasayfa");
        }

        option1.setOnClickListener(v -> {
            dialog.dismiss();
            if (score >= (toplamSoru * 10) / 2) {
                Intent intent = new Intent(Bolum1_AltBolumB_AltA.this, Bolum1_AltBolumB_AltAna.class);
                startActivity(intent);
                finish();
            } else {
                recreate();
            }
        });

        option2.setOnClickListener(v -> {
            dialog.dismiss();
            Intent intent = new Intent(Bolum1_AltBolumB_AltA.this, Bolum1_AltBolumB_AltAna.class);
            startActivity(intent);
            finish();
        });

        dialog.show();
    }
}
