package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.Point;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewAnimationUtils;
import android.view.ViewGroup;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.LinearInterpolator;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.cardview.widget.CardView;
import androidx.core.content.ContextCompat;
import androidx.core.content.res.ResourcesCompat;
import androidx.fragment.app.Fragment;


import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.Model.Model;
import com.example.altin_hilal.R;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Bolum1_AltBolumA_AltB extends Fragment {
    private Context contex;
    private List<Model> modelListLeft, modellistRight;
    private int widthButton,widthButtonAs, heightButton,heightButtonAs;
    private LinearLayout containerLeft, containerRight;
    private static final int duration = 400;
    private static final int duration_kaybol = 300;
    private static final int duration_ekle_Button = 700;
    private Button selectButtonLeft = null;
    private Button selectButtonRight = null;
    private TextView GameAbout;
    private boolean butonabasmaaktifmi = true;
    private int x, y;// x ve ye koordinatları
    private int silinenButonSayisi;
    private int list_boyut;
    private ImageButton btnInfo;
    private String selectedLanguage = "English"; // Varsayılan değer
    DatabaseHelper dbHelper = new DatabaseHelper(contex);

    // YENİ TANIMLAMALAR: Buton boşluk (margin) ve iç boşluk (padding) değerleri
    private static final int BUTTON_MARGIN_DP = 8; // Butonlar arası boşluk (8dp)
    private static final int PADDING_HORIZONTAL_DP = 10; // Yatay (sol/sağ) iç boşluk
    private static final int PADDING_VERTICAL_DP = 5; // Dikey (üst/alt) iç boşluk

    private View.OnTouchListener touchlistener = new View.OnTouchListener() {
        @Override
        public boolean onTouch(View v, MotionEvent event) {
            x = (int) event.getX();
            y = (int) event.getY();
            return false;
        }
    };

    private View.OnClickListener clicklistenerLeft = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (!butonabasmaaktifmi)
                return;
            if (selectButtonRight != null) {

                selectButtonLeft = (Button) v;
                butonabasmaaktifmi = false;
                if (selectButtonLeft.getId() == selectButtonRight.getId()) {
                    eslestiEfect();
                } else {
                    eslesmediEfect();
                }
            } else { //Sola Basıp tekrar sol seçilirse
                if (selectButtonLeft != null) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        // Yuvarlatılmış default arka plana dön
                        selectButtonLeft.setBackgroundResource(R.drawable.rounded_button_defaultaab);
                    }
                }
                selectButtonLeft = (Button) v;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    // Yuvarlatılmış seçili arka planı ayarla
                    selectButtonLeft.setBackgroundResource(R.drawable.rounded_button_selectedaab);
                }

            }
        }
    };

    private View.OnClickListener clicklistenerRight = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (!butonabasmaaktifmi)
                return;
            if (selectButtonLeft != null) {

                selectButtonRight = (Button) v;
                butonabasmaaktifmi = false;
                if (selectButtonLeft.getId() == selectButtonRight.getId()) {
                    eslestiEfect();
                } else {
                    eslesmediEfect();
                }
            } else { //Sağa Basıp tekrar sağ seçilirse
                if (selectButtonRight != null) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        // Yuvarlatılmış default arka plana dön
                        selectButtonRight.setBackgroundResource(R.drawable.rounded_button_defaultaab);
                    }
                }
                selectButtonRight = (Button) v;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    // Yuvarlatılmış seçili arka planı ayarla
                    selectButtonRight.setBackgroundResource(R.drawable.rounded_button_selectedaab);
                }
            }
        }
    };

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.yazifragment, container, false);
    }

    @Override
    public void onAttach(@NonNull Context context) {
        super.onAttach(context);
        this.contex = context;
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        setRetainInstance(true);
        //initialize
        modelListLeft = new ArrayList<>();
        modellistRight = new ArrayList<>();
        // Sadece ilk kez açıldığında çalışsın
        if (savedInstanceState == null) {
            showInfoDialog();
        }
        btnInfo = ((AppCompatActivity) contex).findViewById(R.id.btnInfob1a);
        GameAbout = ((AppCompatActivity) contex).findViewById(R.id.GameAbout1a);
        btnInfo.setOnClickListener(v -> {
            showInfoDialog();
        });
        GameAbout.setOnClickListener(v -> {
            showInfoDialog();
        });
        //Direk ulaşılmıyor o yüzden contex ekliyoruz
        containerLeft = ((AppCompatActivity) contex).findViewById(R.id.containerleft);
        containerRight = ((AppCompatActivity) contex).findViewById(R.id.containerright);

        Spinner spinnerLanguage = ((AppCompatActivity) contex).findViewById(R.id.spinnerLanguage);

        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                contex,
                R.array.language_array,
                R.layout.spinner_item_1b // sadece baştaki görünüm
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
                    GameAbout.setText("About the Game");
                } else if (selectedLanguage.equals("Türkçe")) {
                    // Türkçe için işlem
                    GameAbout.setText("Oyun Hakkında");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
                // Seçim yapılmadığında yapılacaklar
            }
        });


        //buton genişlik ve yükseliklerin hesaplanması
        Display display = getActivity().getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);

        // DP değerini piksel (px) cinsine çevirme (Boşluk ayarı için gerekli)
        final int marginPx = (int) (BUTTON_MARGIN_DP * getResources().getDisplayMetrics().density);
        // Padding değerlerini piksel cinsine çevirme
        final int paddingHorizontalPx = (int) (PADDING_HORIZONTAL_DP * getResources().getDisplayMetrics().density);
        final int paddingVerticalPx = (int) (PADDING_VERTICAL_DP * getResources().getDisplayMetrics().density);

        // DEĞİŞİKLİK: Genişlik aynı kaldı, yükseklik biraz daha arttırıldı (7.0)
        widthButtonAs = (int) ((size.x) / (2 + 0.5));
        widthButton = (int) ((size.x) / (2 + 0.5));
        heightButtonAs = (int) ((size.y) / (5));
        heightButton = (int) ((size.y) / (7.0));


        modelListLeft.add(new Model("2.'si olmayan 1", "Allah (c.c)", 0));
        modelListLeft.add(new Model("3.'sü olmayan 2", "Gece Gündüz", 1));
        modelListLeft.add(new Model("4.'sü olmayan 3", "3 Talak", 2));
        modelListLeft.add(new Model("5.'si olmayan 4", "4 Kutsal Kitap", 3));
        modelListLeft.add(new Model("6.'sı olmayan 5", "5 Vakit Namaz", 4));
        modelListLeft.add(new Model("7.'si olmayan 6", "Dünyanın 6 Günde Yaratılması", 5));
        modelListLeft.add(new Model("8.'si olmayan 7", "7 kat Sema", 6));
        modelListLeft.add(new Model("9.'su olmayan 8", "Arşı Taşıyan Sekiz Melek", 7));
        modelListLeft.add(new Model("10.'su olmayan 9", "9 Aylık Gebelik", 8));
        modelListLeft.add(new Model("11.'si olmayan 10", "Musa(a.s)'ın Şuayb(a.s)'a Çobanlık süresi", 9));
        modelListLeft.add(new Model("12.'si olmayan 11", "Yusuf(a.s)'ın Kardeşleri", 10));

        //Model listemizi kopyalayıp ekliyoruz
        for (Model model : modelListLeft) {
            modellistRight.add(model);
        }
        list_boyut = modelListLeft.size();


        //Karıştır
        Collections.shuffle(modelListLeft);
        Collections.shuffle(modellistRight);

        //Soldaki butonlar koyteynıra dolduruluyor
        for (int i = 0; i < 6; i++) {
            Button button_AnaL = new Button(contex);

            // Layout Parametrelerini oluşturma ve MARGIN ekleme
            LinearLayout.LayoutParams layoutParamsL = new LinearLayout.LayoutParams(
                    widthButton,
                    heightButtonAs
            );
            // Alttan boşluk ekleme (8dp)
            layoutParamsL.setMargins(0, 0, 0, marginPx);
            button_AnaL.setLayoutParams(layoutParamsL); // Parametreleri butona uygula

            // YENİ: Butonun İç Boşluğunu (Padding) Ayarlama
            button_AnaL.setPadding(paddingHorizontalPx, paddingVerticalPx, paddingHorizontalPx, paddingVerticalPx);


            button_AnaL.setTextColor(getResources().getColor(R.color.Brown));

            // Yuvarlatılmış arka planı kullan
            button_AnaL.setBackgroundResource(R.drawable.rounded_button_defaultaab);

            // Yazıyı tamamen büyük yapmak için:
            button_AnaL.setAllCaps(false);
            // Yazı boyutu
            button_AnaL.setTextSize(heightButton / 25);
            // Kalın font (bold) ayarı
            Typeface typeface = ResourcesCompat.getFont(contex, R.font.yazi_3);
            button_AnaL.setTypeface(typeface, Typeface.BOLD);

            button_AnaL.setId(modelListLeft.get(0).getId());
            button_AnaL.setText(modelListLeft.get(0).getKelime());

            button_AnaL.setOnTouchListener(touchlistener);
            button_AnaL.setOnClickListener(clicklistenerLeft);
            containerLeft.addView(button_AnaL);

            modelListLeft.remove(0); // Ekledikten sonra ilki çıkarılır, diğerine sıra gelir

        }
        for (int i = 0; i < 6; i++) {
            Button button_AnaR = new Button(contex);

            // Layout Parametrelerini oluşturma ve MARGIN ekleme
            LinearLayout.LayoutParams layoutParamsR = new LinearLayout.LayoutParams(
                    widthButton,
                    heightButtonAs
            );
            // Alttan boşluk ekleme (8dp)
            layoutParamsR.setMargins(0, 0, 0, marginPx);
            button_AnaR.setLayoutParams(layoutParamsR); // Parametreleri butona uygula

            // YENİ: Butonun İç Boşluğunu (Padding) Ayarlama
            button_AnaR.setPadding(paddingHorizontalPx, paddingVerticalPx, paddingHorizontalPx, paddingVerticalPx);

            button_AnaR.setTextColor(getResources().getColor(R.color.Brown));

            // Yuvarlatılmış arka planı kullan
            button_AnaR.setBackgroundResource(R.drawable.rounded_button_defaultaab);

            // DEĞİŞİKLİK: Metin boyutu daha da küçültülerek sığması sağlandı (26)
            button_AnaR.setTextSize(heightButton / 25);
            button_AnaR.setId(modellistRight.get(0).getId());
            button_AnaR.setText(modellistRight.get(0).getAnlami());
            Typeface typeface = ResourcesCompat.getFont(contex, R.font.yazi_3);
            button_AnaR.setTypeface(typeface, Typeface.BOLD);
            button_AnaR.setOnTouchListener(touchlistener);
            button_AnaR.setAllCaps(false);
            button_AnaR.setOnClickListener(clicklistenerRight);
            containerRight.addView(button_AnaR);
            modellistRight.remove(0);//Ekledikten sonra ilki çıkarılır diğerine sıra gelir
        }
        girianimasyonu();
    }

    private void showInfoDialog() {
        LayoutInflater inflater = LayoutInflater.from(contex);
        View view = inflater.inflate(R.layout.info_b1_buttona, null);

        TextView dialogTitle = view.findViewById(R.id.dialogTitle);
        TextView dialogMessage = view.findViewById(R.id.dialogMessage);

        //dbHelper.updateTamamlandiByAd("Bolum1_AltBolumA_AltA");

        if (selectedLanguage.equals("English")) {
            dialogTitle.setText("📢 About the Game");
            dialogMessage.setText("🎯 Goal: Match the words on the left with their meanings on the right.\n\n🧠 When matched correctly, buttons disappear.\n\n🎮 When all matches are completed, you proceed to the next level.");
        } else {
            dialogTitle.setText("📢 Oyun Hakkında");
            dialogMessage.setText("🎯 Amaç: Soldaki kelimeler ile sağdaki anlamlarını eşleştir.\n\n🧠 Doğru eşleşmede butonlar kaybolur.\n\n🎮 Tüm eşleşmeler tamamlandığında yeni bölüme geçilir.");
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(contex);
        builder.setView(view);
        builder.setPositiveButton(selectedLanguage.equals("English") ? "OK" : "Anladım", (dialog, id) -> dialog.dismiss());
        AlertDialog dialog = builder.create();
        dialog.show();

        dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                .setTextColor(ContextCompat.getColor(contex, R.color.teal_700));

        dialog.getWindow().setBackgroundDrawable(
                new ColorDrawable(ContextCompat.getColor(contex, R.color.LightBlue))
        );
    }


    private void girianimasyonu() {
        int leftCount = containerLeft.getChildCount();
        int rightCount = containerRight.getChildCount();

        // Soldaki butonlar için animasyon
        for (int i = 0; i < leftCount; i++) {
            Button button = (Button) containerLeft.getChildAt(leftCount - 1 - i); // ters index
            ObjectAnimator animator = ObjectAnimator.ofFloat(button, "translationX", -widthButton * 1.5f, 0);
            animator.setInterpolator(new AccelerateDecelerateInterpolator());
            animator.setDuration(duration + i * 70);
            animator.start();
        }

        // Sağdaki butonlar için animasyon
        for (int i = 0; i < rightCount; i++) {
            Button button = (Button) containerRight.getChildAt(rightCount - 1 - i); // ters index
            ObjectAnimator animator = ObjectAnimator.ofFloat(button, "translationX", widthButton * 1.5f, 0);
            animator.setInterpolator(new AccelerateDecelerateInterpolator());
            animator.setDuration(duration + i * 70);
            animator.start();
        }
    }


    private void eslesmediEfect() {
        int finalRadius = Math.max(widthButton, heightButtonAs);
        Animator animRight =
                ViewAnimationUtils.createCircularReveal(selectButtonRight, x, y, 0, finalRadius);
        Animator animLeft =
                ViewAnimationUtils.createCircularReveal(selectButtonLeft, x, y, 0, finalRadius);

        // Yanlış eşleşme arka planını ayarla
        selectButtonLeft.setBackgroundResource(R.drawable.rounded_button_mismatchaab);
        selectButtonRight.setBackgroundResource(R.drawable.rounded_button_mismatchaab);

        animLeft.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);//Animasyon bitti -- Renkler eski haline gelir

                // Tekrar varsayılan arka plana dön
                selectButtonLeft.setBackgroundResource(R.drawable.rounded_button_defaultaab);
                selectButtonRight.setBackgroundResource(R.drawable.rounded_button_defaultaab);

                selectButtonLeft = null;
                selectButtonRight = null;
                butonabasmaaktifmi = true;
            }
        });
        animLeft.setDuration(duration);
        animRight.setDuration(duration);
        animLeft.start();
        animRight.start();
    }

    private void eslestiEfect() {
        int finalRadius = Math.max(widthButton, heightButtonAs);
        Animator animRight =
                ViewAnimationUtils.createCircularReveal(selectButtonRight, x, y, 0, finalRadius);
        Animator animLeft =
                ViewAnimationUtils.createCircularReveal(selectButtonLeft, x, y, 0, finalRadius);

        // Doğru eşleşme arka planını ayarla
        selectButtonLeft.setBackgroundResource(R.drawable.rounded_button_matchaab);
        selectButtonRight.setBackgroundResource(R.drawable.rounded_button_matchaab);

        animLeft.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);//Animasyon bitti -- Renkler eski haline gelir

                kaybol();
            }
        });
        animLeft.setDuration(duration);
        animRight.setDuration(duration);
        animLeft.start();
        animRight.start();
    }

    private void kaybol() {

        ObjectAnimator animatorLeft = ObjectAnimator.ofFloat(selectButtonLeft, "TranslationX", 0, -widthButton * 1.5f);
        ObjectAnimator animatorRight = ObjectAnimator.ofFloat(selectButtonRight, "TranslationX", 0, widthButton * 1.5f);
        AnimatorSet set = new AnimatorSet();
        set.playTogether(animatorLeft, animatorRight);//Beraber
        set.setDuration(duration_kaybol);
        set.setInterpolator(new LinearInterpolator());
        set.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);

                selectButtonLeft.setVisibility(View.GONE);
                selectButtonRight.setVisibility(View.GONE);
                selectButtonLeft = null;
                selectButtonRight = null;
                butonabasmaaktifmi = true;
                silinenButonSayisi++;

                //Yeni Buton eklenmesi Silindikten Sonra
                if (modelListLeft.size() == 0 && modellistRight.size() == 0) {
                    //eklenecek button kalmadı
                    if (silinenButonSayisi == list_boyut) {
                        Dialog dialog = new Dialog(contex, R.style.CustomDialog);
                        LayoutInflater layoutInflater = LayoutInflater.from(contex);
                        CardView view = (CardView) layoutInflater.inflate(R.layout.dialog, null);
                        dialog.setContentView(view);
                        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));//ARKASI SAYDAM YAPILDI

                        dialog.show();
                        // Tebrik mesajı gösterildikten 3 saniye sonra yeni activity'yi başlat
                        new Handler().postDelayed(new Runnable() {
                            @Override
                            public void run() {
                                // Realm veritabanında bölümün bittiğini söyleyen yapı
                                DatabaseHelper dbHelper = new DatabaseHelper(contex);
                                dbHelper.updateTamamlandiByAd("Bolum1_AltBolumA_AltA");

                                // Yeni activity'yi başlat
                                Intent intent = new Intent(getActivity(), Bolum1_AltBolumA_AltAna.class);
                                startActivity(intent);
                                getActivity().finish(); // mevcut fragment'i ve activity'yi kapatır
                                // Dialogu kapat
                                dialog.dismiss();
                            }
                        }, 3000); // 3000 milisaniye = 3 saniye
                    }
                } else {
                    butonekle();
                }
            }

        });
        set.start();
    }

    private void butonekle() {
        // DP değerini piksel (px) cinsine çevirme
        final int marginPx = (int) (BUTTON_MARGIN_DP * getResources().getDisplayMetrics().density);
        // Padding değerlerini piksel cinsine çevirme
        final int paddingHorizontalPx = (int) (PADDING_HORIZONTAL_DP * getResources().getDisplayMetrics().density);
        final int paddingVerticalPx = (int) (PADDING_VERTICAL_DP * getResources().getDisplayMetrics().density);

        // Sol Buton
        Button buttonL = new Button(contex);

        // Layout Parametrelerini oluşturma ve MARGIN ekleme
        LinearLayout.LayoutParams layoutParamsL = new LinearLayout.LayoutParams(
                widthButton,
                heightButtonAs
        );
        layoutParamsL.setMargins(0, 0, 0, marginPx); // Alttan boşluk ekleme
        buttonL.setLayoutParams(layoutParamsL); // Parametreleri butona uygula

        // YENİ: Butonun İç Boşluğunu (Padding) Ayarlama
        buttonL.setPadding(paddingHorizontalPx, paddingVerticalPx, paddingHorizontalPx, paddingVerticalPx);

        buttonL.setTextColor(getResources().getColor(R.color.Brown));

        // Yuvarlatılmış default arka planı kullan
        buttonL.setBackgroundResource(R.drawable.rounded_button_defaultaab);

        buttonL.setAllCaps(false);
        buttonL.setTextSize(heightButton / 25); // Metin boyutu optimize edildi.
        buttonL.setId(modelListLeft.get(0).getId());
        buttonL.setText(modelListLeft.get(0).getKelime());
        buttonL.setOnTouchListener(touchlistener);
        buttonL.setOnClickListener(clicklistenerLeft);
        Typeface typeface2 = ResourcesCompat.getFont(contex, R.font.yazi_3);
        buttonL.setTypeface(typeface2, Typeface.BOLD);
        containerLeft.addView(buttonL, 0);
        modelListLeft.remove(0);
        ObjectAnimator animatorLeft = ObjectAnimator.ofFloat(buttonL, "TranslationX", -widthButton * 1.5f, 0);
        animatorLeft.setInterpolator(new AccelerateDecelerateInterpolator());
        animatorLeft.setDuration(duration_ekle_Button);
        animatorLeft.start();

        // Sağ Buton
        Button buttonR = new Button(contex);

        // Layout Parametrelerini oluşturma ve MARGIN ekleme
        LinearLayout.LayoutParams layoutParamsR = new LinearLayout.LayoutParams(
                widthButton,
                heightButtonAs
        );
        layoutParamsR.setMargins(0, 0, 0, marginPx); // Alttan boşluk ekleme
        buttonR.setLayoutParams(layoutParamsR); // Parametreleri butona uygula

        // YENİ: Butonun İç Boşluğunu (Padding) Ayarlama
        buttonR.setPadding(paddingHorizontalPx, paddingVerticalPx, paddingHorizontalPx, paddingVerticalPx);

        buttonR.setTextColor(getResources().getColor(R.color.Brown));

        // Yuvarlatılmış default arka planı kullan
        buttonR.setBackgroundResource(R.drawable.rounded_button_defaultaab);

        buttonR.setAllCaps(false);
        buttonR.setTextSize(heightButton / 25); // Metin boyutu optimize edildi.
        buttonR.setId(modellistRight.get(0).getId());
        buttonR.setText(modellistRight.get(0).getAnlami());
        buttonR.setOnTouchListener(touchlistener);
        buttonR.setOnClickListener(clicklistenerRight);
        buttonR.setTypeface(typeface2, Typeface.BOLD);
        containerRight.addView(buttonR, 0);
        modellistRight.remove(0);
        ObjectAnimator animatorRight = ObjectAnimator.ofFloat(buttonR, "TranslationX", widthButton * 1.5f, 0);
        animatorRight.setInterpolator(new AccelerateDecelerateInterpolator());
        animatorRight.setDuration(duration_ekle_Button);
        animatorRight.start();
    }
}