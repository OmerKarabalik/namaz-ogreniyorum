package com.example.altin_hilal.AnaEkran.Bolum2;

import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.graphics.drawable.ColorDrawable;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.view.animation.DecelerateInterpolator;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;

import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.Model.Model;
import com.example.altin_hilal.R;
import com.google.android.flexbox.FlexboxLayout;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Bolum2_AltBolumA_AltB   extends AppCompatActivity {

    private Context contex;
    private List<Model> modelList; // Kelime listesi için liste oluşturuluyor
    private List<TextView> wordTextViews; // Kelime gösterim alanı için liste oluşturuluyor
    private FlexboxLayout wordContainer; // Kelime gösterim alanı için layout
    private int remainingAttempts; // Kalan deneme hakkı sayısı
    private int currentWordIndex; // Şu anki kelime index'i

    private int dogruCevap = 0, yanlisCevap = 0; // Doğru ve yanlış cevap sayıları
    private int skore_puan_text = 0;
    private ImageView dogru_bolum2, yanlis_bolum2; // Doğru ve yanlış görselleri
    private ImageView can_icon1, can_icon2, can_icon3; // Can göstergeleri için görseller
    private TextView ilerleme_tv_bolum2, ilerleme_tv_yan_bolum2; // İlerleme metin alanları
    private TextView skore_puan;
    ImageButton btnInfob3;
    private TextView GameAbout1c;
    private String selectedLanguage = "English"; // Varsayılan değer

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bolum2_alt_bolum_aalt_b);
        wordContainer = findViewById(R.id.wordContainer); // Kelime gösterim alanı
        dogru_bolum2 = findViewById(R.id.dogru_bolum2); // Doğru cevap görseli
        yanlis_bolum2 = findViewById(R.id.yanlis_bolum2); // Yanlış cevap görseli
        ilerleme_tv_bolum2 = findViewById(R.id.ilerleme_tv_bolum2); // Doğru cevap sayısı metni
        ilerleme_tv_yan_bolum2 = findViewById(R.id.ilerleme_tv_yan_bolum2); // Yanlış cevap sayısı metni
        can_icon1 = findViewById(R.id.can_icon1); // Can göstergesi 1
        can_icon2 = findViewById(R.id.can_icon2); // Can göstergesi 2
        can_icon3 = findViewById(R.id.can_icon3); // Can göstergesi 3
        skore_puan = findViewById(R.id.skore_puan);
        btnInfob3 = findViewById(R.id.btnInfob3);
        contex = this;

        // Sadece ilk kez açıldığında çalışsın
        if (savedInstanceState == null) {
            showInfoDialog();
        } // İlk açılışta bilgi dialogunu gösteren satırı buradan kaldırdık, sadece butona basınca gösterilecek.
        // Bilgi butonuna tıklama dinleyicisi ekleyelim
        if (btnInfob3 != null) {
            btnInfob3.setOnClickListener(v -> showInfoDialog());
        }
        GameAbout1c = findViewById(R.id.GameAbout1c);

        GameAbout1c.setOnClickListener(v -> {
            showInfoDialog();
        });

        Spinner spinnerLanguage = ((AppCompatActivity) contex).findViewById(R.id.spinnerLanguage);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                contex,
                R.array.language_array,
                R.layout.spinner_item_2ba // sadece baştaki görünüm
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
                    GameAbout1c.setText("About the Game");
                } else if (selectedLanguage.equals("Türkçe")) {
                    // Türkçe için işlem
                    GameAbout1c.setText("Oyun Hakkında");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // Seçim yapılmadığında yapılacaklar
            }
        });

        // Kelime listesi ve anlamlarını oluştur
        initializeWordsAndMeanings();
        // Kelime gösterim alanı için liste oluşturuluyor ve başlatılıyor
        wordTextViews = new ArrayList<>();
        initializeWordLayout();
        // İlk kelime için kalan deneme hakkı
        remainingAttempts = 3;
        currentWordIndex = 0; // İlk kelimeye başlanıyor
    }

    // Kelime listesi ve anlamlarını oluşturma
    private void initializeWordsAndMeanings() {
        List<Model> tempModelList = new ArrayList<>();
        skore_puan.setText(String.valueOf(skore_puan_text));
        // Kelimeleri ve anlamlarını ekle
        tempModelList.add(new Model(
                "MKULTRA",
                "İnsan zihnini kimyasal ve psikolojik yöntemlerle kontrol etmeyi amaçlayan gizli proje nedir?",
                1
        ));

        tempModelList.add(new Model(
                "MEDYA",
                "Sürekli tekrar, korku dili ve hızlı içeriklerle bilinçaltını kim yönlendirir?",
                2
        ));

        tempModelList.add(new Model(
                "SUBLİMİNAL",
                "Bilinç eşiğinin altında verilen ve fark edilmeden davranışı etkileyen gizli mesajlara ne denir?",
                3
        ));

        tempModelList.add(new Model(
                "PROPAGANDA",
                "Büyük bir yalanın sürekli tekrar edilerek gerçek gibi kabul ettirilmesine ne denir?",
                4
        ));

        tempModelList.add(new Model(
                "IŞIK",
                "Mesajın zihne yerleşmesini ve fark edilmeden kabul edilmesini sağlayan yöntemlerden biri nedir?",
                5
        ));

        tempModelList.add(new Model(
                "PİRAMİT",
                "Katmanlı yapıdan oluşur; altta halkı, üstte elit güç yapısını temsil eden sembol nedir?",
                6
        ));

        tempModelList.add(new Model(
                "NATÜRALİZM",
                "Kanıtlanmadan kabul edilen bir ön kabuldür; sadece gözlemlenebilir ve ölçülebilir alanı esas alan inanç sistemi nedir?",
                7
        ));

        tempModelList.add(new Model(
                "BİLİMSEL METOT",
                "Genellikle natüralist varsayımla çalışan, gözlem ve deneye dayalı yöntem nedir?",
                8
        ));

        tempModelList.add(new Model(
                "FARKINDALIK",
                "Medya hipnozundan çıkmanın ilk adımı nedir?",
                9
        ));

        tempModelList.add(new Model(
                "RESİM",
                "Beyinde metinden daha hızlı işlenen ve duygusal tepkiyi doğrudan tetikleyen unsur nedir?",
                10
        ));
        // Model listesini karıştır
        Collections.shuffle(tempModelList, new Random(System.currentTimeMillis()));

        // modelList'i oluştur ve güncelle
        modelList = new ArrayList<>(tempModelList.size());
        modelList.addAll(tempModelList);
    }

    public void guessLetter(View view) {
        Button clickedButton = (Button) view;
        String guessedLetter = clickedButton.getText().toString().toUpperCase();

        Model currentModel = modelList.get(currentWordIndex);
        String kelime = currentModel.getKelime();

        boolean correctGuess = false;

        for (int i = 0; i < kelime.length(); i++) {
            if (kelime.charAt(i) == guessedLetter.charAt(0)) {
                if (wordTextViews.get(i).getText().toString().equals("_")) {
                    wordTextViews.get(i).setText(String.valueOf(guessedLetter.charAt(0)));
                    //  animateLetterAppearance(wordTextViews.get(i));
                    correctGuess = true;

                    dogruCevap++;

                    skore_puan_text += 20;
                    skore_puan.setText(String.valueOf(skore_puan_text));
                    ilerleme_tv_bolum2.setText(String.valueOf(dogruCevap));
                }
            }
        }

        if (!correctGuess) {
            remainingAttempts--;
            if (remainingAttempts == 2) {
                can_icon3.setVisibility(View.INVISIBLE);
            } else if (remainingAttempts == 1) {
                can_icon2.setVisibility(View.INVISIBLE);
            } else if (remainingAttempts == 0) {
                can_icon1.setVisibility(View.INVISIBLE);
            }

            yanlisCevap++;
            skore_puan_text -= 20;
            if (skore_puan_text < 0) skore_puan_text = 0;
            skore_puan.setText(String.valueOf(skore_puan_text));
            ilerleme_tv_yan_bolum2.setText(String.valueOf(yanlisCevap));
            //   Toast.makeText(this, "Yanlış tahmin. Kalan hakkınız: " + remainingAttempts, Toast.LENGTH_SHORT).show();
            MediaPlayer mediaPlayerFinal = MediaPlayer.create(this, R.raw.wrong_sound);
            mediaPlayerFinal.setOnCompletionListener(MediaPlayer::release);
            mediaPlayerFinal.start();

            if (remainingAttempts == 0) {
                // Hakkı kalmadıysa özel bir dialog göster
                showGameOverDialog(); // Yeni metodumuzu çağırıyoruz
                revealWord(); // Kelimeyi göster
            }
        } else {
            MediaPlayer mediaPlayerFinal = MediaPlayer.create(this, R.raw.true_sound);
            mediaPlayerFinal.setOnCompletionListener(MediaPlayer::release);
            mediaPlayerFinal.start();
            if (wordGuessed()) {
                // animateWordCompletion();
                new Handler().postDelayed(() -> {
                    revealWord();
                    moveToNextWord();
                }, 2000);
            }
        }

        clickedButton.setEnabled(false); // Butonu devre dışı bırak
    }

    // Kelime gösterim alanını başlatma
    private void initializeWordLayout() {
        wordTextViews.clear(); // <-- önce temizle
        wordContainer.removeAllViews();
        Model currentModel = modelList.get(currentWordIndex);
        for (int i = 0; i < currentModel.getKelime().length(); i++) {
            TextView letterTextView = new TextView(this);
            letterTextView.setText("_");
            letterTextView.setTextSize(24); // Metin boyutunu ayarlama
            letterTextView.setTextColor(getResources().getColor(R.color.black)); // Metin rengini ayarlama
            letterTextView.setPadding(15, 15, 15, 15); // Kenar boşluklarını artırma
            // Genişlik ve yükseklik ayarları
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    LinearLayout.LayoutParams.WRAP_CONTENT,
                    LinearLayout.LayoutParams.WRAP_CONTENT
            );
            params.setMargins(8, 8, 8, 8); // Margin ekleyerek harfler arasındaki boşluğu artırma
            letterTextView.setLayoutParams(params);
            // İsteğe bağlı olarak, arka plan veya stil ayarlayın
            letterTextView.setBackgroundResource(R.drawable.textview_background_b2a); // Drawable kaynağınız varsa

            wordTextViews.add(letterTextView);
            wordContainer.addView(letterTextView);
        }
        remainingAttempts = 3; // Yeni kelime için deneme hakkını sıfırla
        resetKeyboard(); // Klavye butonlarını sıfırla
        can_icon1.setVisibility(View.VISIBLE);
        can_icon2.setVisibility(View.VISIBLE);
        can_icon3.setVisibility(View.VISIBLE);
        // Açıklama metnini güncelle
        TextView sentenceTextView = findViewById(R.id.sentenceTextView);
        sentenceTextView.setText(currentModel.getAnlami());
    }

    // Kelimenin tamamının doğru tahmin edilip edilmediğini kontrol etme
    private boolean wordGuessed() {
        for (TextView tv : wordTextViews) {
            if (tv.getText().toString().equals("_")) {
                return false;
            }
        }
        return true;
    }

    // Kelimenin tamamını göster (örneğin hakkı kalmadığında)
    private void revealWord() {
        Model currentModel = modelList.get(currentWordIndex);
        String kelime = currentModel.getKelime();
        for (int i = 0; i < kelime.length(); i++) {
            wordTextViews.get(i).setText(String.valueOf(kelime.charAt(i)));
        }
    }

    private void showFeedbackDialog(String message, String colorHex, Runnable onDismiss) {
        // Bu metot artık can hakkı bitince çağrılmayacak, onun yerine showGameOverDialog() kullanılacak.
        // Ancak başka yerlerde kullanılıyorsa, burada bırakabiliriz.
        Dialog dialog = new Dialog(this);
        LayoutInflater inflater = LayoutInflater.from(this);
        CardView view = (CardView) inflater.inflate(R.layout.dialog_feedback_b2_a, null);

        TextView txtDialogFeedback = view.findViewById(R.id.txtDialogFeedback);
        ImageView imgDialogIcon = view.findViewById(R.id.imgDialogIcon);

        // Mesaj ve renk ayarı
        txtDialogFeedback.setText(message);
        txtDialogFeedback.setTextColor(Color.parseColor(colorHex));

        // İkona göre setImageResource ve renk ayarı
        boolean isCorrect = message.contains("✔");
        imgDialogIcon.setImageResource(isCorrect ? R.drawable.ic_success : R.drawable.ic_error);
        imgDialogIcon.setColorFilter(Color.parseColor(colorHex), PorterDuff.Mode.SRC_IN);

        dialog.setContentView(view);
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        dialog.setCancelable(false);
        dialog.show();
        Window window = dialog.getWindow();
        if (window != null) {
            window.setLayout((int) (getResources().getDisplayMetrics().widthPixels * 0.85), WindowManager.LayoutParams.WRAP_CONTENT);
        }
        // 1.5 saniye sonra dialogu kapat ve işlem yap
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            dialog.dismiss();
            if (onDismiss != null) {
                onDismiss.run();
            }
        }, 1500);
    }


    // Oyun bittiğinde gösterilecek özel diyalog
    private void showGameOverDialog() {
        Dialog gameOverDialog = new Dialog(this);
        gameOverDialog.setContentView(R.layout.dialog_game_over); // Yeni bir layout dosyası kullanacağız
        gameOverDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        gameOverDialog.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        gameOverDialog.getWindow().getAttributes().gravity = Gravity.CENTER;
        gameOverDialog.setCancelable(false); // Kullanıcı geri tuşuyla kapatamaz

        TextView tvGameOverTitle = gameOverDialog.findViewById(R.id.tvGameOverTitle);
        TextView tvGameOverMessage = gameOverDialog.findViewById(R.id.tvGameOverMessage);
        Button btnPlayAgain = gameOverDialog.findViewById(R.id.btnPlayAgain);
        Button btnExit = gameOverDialog.findViewById(R.id.btnExitikie);

        tvGameOverTitle.setText("Oyun Bitti!");
        tvGameOverMessage.setText("Maalesef, bu kelimeyi tahmin edemedin. Tüm can hakların tükendi.");

        // "Tekrar Dene" butonu
        btnPlayAgain.setOnClickListener(v -> {
            gameOverDialog.dismiss();
            resetGame(); // Oyunu baştan başlat
        });

        // "Çıkış" butonu
        btnExit.setOnClickListener(v -> {
            gameOverDialog.dismiss();
            Intent intent = new Intent(getApplicationContext(), Bolum2_AltBolumA_AltA.class);
            startActivity(intent);
            finish(); // Mevcut aktiviteyi kapat
        });

        gameOverDialog.show();
    }


    // Dialog oluşturma
    private void showCongratulationsDialog() {

        Dialog dialog = new Dialog(Bolum2_AltBolumA_AltB.this, R.style.CustomDialog);
        LayoutInflater layoutInflater = LayoutInflater.from(Bolum2_AltBolumA_AltB.this);
        CardView view = (CardView) layoutInflater.inflate(R.layout.tebrik, null);
        dialog.setContentView(view);
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT)); // Arkası saydam yapıldı
        dialog.show();
        // Dialog'u belirli bir süre sonra kapatma
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                dialog.dismiss();
            }
        }, 2000); // 2 saniye sonra dialog otomatik olarak kapatılacak (isteğe bağlı olarak süreyi değiştirebilirsiniz)
    }

    // Kelimenin tamamının doğru tahmin edilmesi sonrası animasyon uygulama


    // Sonraki kelimeye geçme
    // ... (Diğer kodlar)

    // Sonraki kelimeye geçme
    private void moveToNextWord() {
        currentWordIndex++;
        if (currentWordIndex == modelList.size()) {
            // Toast.makeText(Bolum1_AltBolumA_AltC.this, "Tebrikler! Tüm kelimeleri bildiniz.", Toast.LENGTH_SHORT).show(); // Bu satırı kaldırdık
            showGameCompletionDialog(); // Yeni metodumuzu çağırıyoruz

            // Realm veritabanında bölümün bittiğini söyleyen yapı
            DatabaseHelper dbHelper = new DatabaseHelper(contex);
            dbHelper.updateTamamlandiByAd("Bolum1_AltBolumA_AltC");

            // Yeni activity'yi başlat (Biraz gecikmeli başlatmak daha iyi olabilir)
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                Intent intent = new Intent(Bolum2_AltBolumA_AltB.this, Bolum2_AltBolumA_AltAna.class);
                startActivity(intent);
                finish(); // mevcut fragment'i ve activity'yi kapatır
            }, 2500); // Diyaloğun görünür kalma süresine göre ayarlanabilir

        } else {
            if (remainingAttempts > 0) {
                showCongratulationsDialog(); // Tek kelime bittiğinde çıkan tebrik dialogu
                MediaPlayer mediaPlayerFinal = MediaPlayer.create(this, R.raw.letter_true_sound);
                mediaPlayerFinal.setOnCompletionListener(MediaPlayer::release);
                mediaPlayerFinal.start();
            }
            wordTextViews.clear();
            initializeWordLayout();
        }
    }

// ... (Bolum1_AltBolumA_AltC sınıfınızın içinde bir yere ekleyin)

    private void showGameCompletionDialog() {
        final Dialog completionDialog = new Dialog(this);
        completionDialog.setContentView(R.layout.dialog_game_completion_2ba); // Yeni layout dosyamız
        completionDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT)); // Arka planı şeffaf yapar
        completionDialog.getWindow().setLayout(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        completionDialog.getWindow().getAttributes().gravity = Gravity.CENTER; // Dialogu ekranın ortasına hizalar
        completionDialog.setCancelable(false); // Kullanıcının dışarı tıklayarak veya geri tuşuyla kapatmasını engelle

        TextView dialogTitle = completionDialog.findViewById(R.id.tvCompletionTitle);
        TextView dialogMessage = completionDialog.findViewById(R.id.tvCompletionMessage);
        ImageView imgCompletionIcon = completionDialog.findViewById(R.id.imgCompletionIcon); // Opsiyonel ikon

        dialogTitle.setText("Tebrikler!");
        dialogMessage.setText("Harikasın! Tüm kelimeleri başarıyla tamamladın!");
        imgCompletionIcon.setImageResource(R.drawable.baseline_check_circle_24); // Örnek bir başarı ikonu

        // Opsiyonel: İkona basit bir animasyon ekleyebiliriz
        ObjectAnimator scaleX = ObjectAnimator.ofFloat(imgCompletionIcon, "scaleX", 0.5f, 1f);
        ObjectAnimator scaleY = ObjectAnimator.ofFloat(imgCompletionIcon, "scaleY", 0.5f, 1f);
        ObjectAnimator alpha = ObjectAnimator.ofFloat(imgCompletionIcon, "alpha", 0f, 1f);
        AnimatorSet animatorSet = new AnimatorSet();
        animatorSet.playTogether(scaleX, scaleY, alpha);
        animatorSet.setDuration(500);
        animatorSet.setInterpolator(new DecelerateInterpolator());
        animatorSet.start();

        // Diyaloğu belirli bir süre sonra otomatik kapat
        new Handler(Looper.getMainLooper()).postDelayed(completionDialog::dismiss, 2000); // 2 saniye sonra kapanır

        completionDialog.show();
    }

// ... (Diğer kodlar)

    // Oyunu sıfırlama
    private void resetGame() {
        dogruCevap = 0; // Doğru cevap sayacını sıfırla
        yanlisCevap = 0; // Yanlış cevap sayacını sıfırla
        skore_puan_text = 0; // Skoru sıfırla
        skore_puan.setText("0"); // UI'daki skoru güncelle
        ilerleme_tv_bolum2.setText("0"); // UI'daki doğru sayısını güncelle
        ilerleme_tv_yan_bolum2.setText("0"); // UI'daki yanlış sayısını güncelle

        currentWordIndex = 0;
        // Kelimeleri tekrar karıştırarak yeni bir oyun başlat
        initializeWordsAndMeanings();
        remainingAttempts = 3;
        wordTextViews.clear();
        initializeWordLayout(); // UI'ı yeni kelime ile güncelle
    }

    // Klavye butonlarını sıfırlama
    private void resetKeyboard() {
        int[] buttonIds = new int[]{
                R.id.buttonQ, R.id.buttonW, R.id.buttonE, R.id.buttonR, R.id.buttonT, R.id.buttonR,
                R.id.buttonA, R.id.buttonS, R.id.buttonD, R.id.buttonF, R.id.buttonG, R.id.buttonH,
                R.id.buttonZ, R.id.buttonX, R.id.buttonC, R.id.buttonV, R.id.buttonB, R.id.buttonN,
                R.id.buttonU, R.id.buttonI, R.id.buttonO, R.id.buttonP, R.id.buttonĞ, R.id.buttonÜ,
                R.id.buttonJ, R.id.buttonK, R.id.buttonL, R.id.buttonŞ, R.id.buttonİ, R.id.buttonM,
                R.id.buttonÖ, R.id.buttonÇ,
                // Tüm butonların ID'lerini buraya ekleyin
        };

        for (int id : buttonIds) {
            Button button = findViewById(id);
            if (button != null) {
                button.setEnabled(true);
            }
        }
    }

    // Harf gösteriminin animasyonunu uygulama
    private void animateLetterAppearance(TextView textView) {
        Animation animation = AnimationUtils.loadAnimation(this, R.anim.scale_and_fade_in);
        textView.startAnimation(animation);
    }

    // Klavye butonları için animasyon uygulama
    public void animateButton(View view) {
        Button button = (Button) view;
        Animation animation = AnimationUtils.loadAnimation(this, R.anim.scale_and_fade_in);
        button.startAnimation(animation);
    }

    private void showInfoDialog() {
        final Dialog infoDialog = new Dialog(this);
        infoDialog.setContentView(R.layout.info_b1_buttonb2a);
        infoDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
        infoDialog.getWindow().setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        infoDialog.getWindow().getAttributes().gravity = Gravity.CENTER;

        TextView dialogTitle = infoDialog.findViewById(R.id.dialog_title);
        TextView dialogMessage = infoDialog.findViewById(R.id.dialog_message);
        Button btnOk = infoDialog.findViewById(R.id.btn_ok);

        if (selectedLanguage.equals("English")) {
            // İngilizce metinler
            dialogTitle.setText("How to Play?");
            dialogMessage.setText("In this exciting word guessing game, your goal is to find the hidden English word using the given clue! Use the letters on the keyboard to guess the word. You earn points for each correct letter and lose a life for wrong guesses. You have 3 lives in total. Guess all words correctly to score the highest!");
            btnOk.setText("OK");
        } else {
            // Varsayılan olarak Türkçe metinler
            dialogTitle.setText("Nasıl Oynanır?");
            dialogMessage.setText("Bu heyecanlı kelime tahmin oyununda amacın, sana verilen ipucundan yola çıkarak gizli İngilizce kelimeyi bulmak! Klavyedeki harfleri kullanarak kelimeyi tahmin et. Her doğru harf için puan kazanır, yanlış tahminlerde ise can kaybedersin. Toplam 3 can hakkın var. Tüm kelimeleri doğru tahmin ederek en yüksek puanı topla!");
            btnOk.setText("Tamam");
        }

        btnOk.setOnClickListener(v -> infoDialog.dismiss());

        infoDialog.show();
    }

}