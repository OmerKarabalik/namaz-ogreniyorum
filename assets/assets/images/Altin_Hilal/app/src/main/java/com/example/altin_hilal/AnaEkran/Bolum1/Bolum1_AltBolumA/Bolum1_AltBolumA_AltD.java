package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Gravity;
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
import androidx.fragment.app.Fragment;

import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.Model.Model_Image;
import com.example.altin_hilal.R;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class Bolum1_AltBolumA_AltD extends Fragment {
    private Context contex;
    private List<Model_Image> modelListLeft, modellistRight;
    private List<Model_Image> modelListLeftCopy, modellistRightCopy;
    private int widthButton, heightButton;
    private int Country_widthButton, Country_heightButton;
    private int Left_widthButton;
    private LinearLayout containerLeft, containerRight;
    private static final int duration = 300;
    private static final int duration_kaybol = 250;
    private static final int duration_ekle_Button = 500;
    private Button selectButtonLeft = null;
    private Button selectButtonRight = null;
    private boolean butonabasmaaktifmi = true;
    private int silinenButonSayisi;
    private String selectedLanguage = "English";

    // Sol ve sağ butonlar için Drawable önbellekleri
    private Map<Integer, Drawable> leftButtonDrawables;
    private Map<Integer, Drawable> rightButtonDrawables;

    private int list_boyut;
    private ImageButton btnInfob1b;
    private TextView GameAbout1b;

    private DatabaseHelper dbHelper;

    // UI ölçü ve margin değerleri (hesaplandıktan sonra kullanılır)
    private int buttonMarginVertical;
    private int buttonMarginHorizontal;

    private View.OnClickListener clicklistenerLeft = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (!butonabasmaaktifmi) return;
            if (selectButtonRight != null) {
                selectButtonLeft = (Button) v;
                butonabasmaaktifmi = false;
                if (selectButtonLeft.getId() == selectButtonRight.getId()) {
                    eslestiEfect();
                } else {
                    eslesmediEfect();
                }
            } else {
                if (selectButtonLeft != null) {
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        // Eski sol butonu seçimi kaldır (Alpha 1f)
                        selectButtonLeft.setAlpha(1f);
                    }
                }
                selectButtonLeft = (Button) v;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    // Yeni sol butonu seç (Alpha 0.5f)
                    selectButtonLeft.setAlpha(0.5f);
                }
            }
        }
    };

    private View.OnClickListener clicklistenerRight = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            if (!butonabasmaaktifmi) return;

            // Eğer SOL buton seçilmişse, bu butonu seç ve eşleştirme kontrolünü yap
            if (selectButtonLeft != null) {
                selectButtonRight = (Button) v;
                butonabasmaaktifmi = false;
                if (selectButtonLeft.getId() == selectButtonRight.getId()) {
                    eslestiEfect();
                } else {
                    eslesmediEfect();
                }
            } else {
                // Eğer SOL buton seçili değilse, sadece bu butonu seç ve vurgula

                // *** HER ZAMAN ESKİ SEÇİMİ SIFIRLA (Normal Duruma dön) ***
                if (selectButtonRight != null) {
                    // Eski butonu orijinal resmine döndür (Tint kullanılıyorsa sıfırla)
                    Drawable resetDrawable = rightButtonDrawables.get(selectButtonRight.getId());
                    if (resetDrawable != null) {
                        selectButtonRight.setBackground(resetDrawable);
                    } else {
                        // Resim yoksa, yedek arka planı ayarla
                        selectButtonRight.setBackground(createDefaultBackgroundDrawable());
                    }

                    // Tint'i sıfırla
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        selectButtonRight.setBackgroundTintList(null);
                    }
                    selectButtonRight.setAlpha(1f);
                }
                // *** SIFIRLAMA BİTTİ ***

                selectButtonRight = (Button) v;

                // YENİ seçilen butonu vurgula (Alpha 0.5f)
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    selectButtonRight.setAlpha(0.5f);
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
        dbHelper = new DatabaseHelper(contex);
    }

    @Override
    public void onActivityCreated(@Nullable Bundle savedInstanceState) {
        super.onActivityCreated(savedInstanceState);

        setRetainInstance(true);
        modelListLeft = new ArrayList<>();
        modellistRight = new ArrayList<>();
        leftButtonDrawables = new HashMap<>();
        rightButtonDrawables = new HashMap<>();

        btnInfob1b = ((AppCompatActivity) contex).findViewById(R.id.btnInfob1b);
        GameAbout1b = ((AppCompatActivity) contex).findViewById(R.id.GameAbout1b);

        btnInfob1b.setOnClickListener(v -> showInfoDialog());
        GameAbout1b.setOnClickListener(v -> showInfoDialog());

        containerLeft = ((AppCompatActivity) contex).findViewById(R.id.containerleft);
        containerRight = ((AppCompatActivity) contex).findViewById(R.id.containerright);

        // NOT: artık konteynerları invisible yapmıyoruz — dialog açıkken de arka plan görünmeli
        // containerLeft.setVisibility(View.INVISIBLE);
        // containerRight.setVisibility(View.INVISIBLE);

        Spinner spinnerLanguage = ((AppCompatActivity) contex).findViewById(R.id.spinnerLanguage);
        ArrayAdapter<CharSequence> adapter = ArrayAdapter.createFromResource(
                contex,
                R.array.language_array,
                R.layout.spinner_item_1c
        );
        spinnerLanguage.setAdapter(adapter);
        adapter.setDropDownViewResource(R.layout.spinner_item_dropdown_1b);

        spinnerLanguage.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                selectedLanguage = parent.getItemAtPosition(position).toString();
                if (selectedLanguage.equals("English")) {
                    GameAbout1b.setText("About the Game");
                } else if (selectedLanguage.equals("Türkçe")) {
                    GameAbout1b.setText("Oyun Hakkında");
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });

        // ölçüleri hesapla
        Display display = getActivity().getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);

        DisplayMetrics metrics = contex.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels;
        int screenHeight = metrics.heightPixels;
        float density = metrics.density;
        int densityDpi = metrics.densityDpi;

        // *** CİHAZ YOĞUNLUĞUNA GÖRE BUTON BOYUTU HESAPLAMALARI (GENİŞLETİLDİ) ***
        Left_widthButton = (int) (screenWidth * 0.48f); // %48
        Country_widthButton = (int) (screenWidth * 0.48f); // %48

        // Yüksekliği ekran oranına göre ayarlama
        if (densityDpi <= 320) {
            Country_heightButton = (int) (screenHeight * 0.11);
        } else if (densityDpi <= 440) {
            Country_heightButton = (int) (screenHeight * 0.10);
        } else {
            Country_heightButton = (int) (screenHeight * 0.09);
        }

        // Yükseklik çarpanı büyütüldü: 1.3
        Country_heightButton = (int) (Country_heightButton * 1.3);
        widthButton = Country_widthButton;
        heightButton = Country_heightButton; // Artık aynı

        // Padding ve Marjin değerleri
        buttonMarginVertical = (int) (8 * density);
        buttonMarginHorizontal = (int) (8 * density);

        // Eğer daha önce yüklenmemişse hemen yükle ve sonra dialog göster (böylece dialog açıkken resimler görüntülenir)
        if (savedInstanceState == null) {
            loadAllButtons();
            showInfoDialog();
        } else {
            // Eğer fragment yeniden oluşturulduysa, eğer butonlar boşsa yükle
            if (leftButtonDrawables.isEmpty() || rightButtonDrawables.isEmpty()) {
                loadAllButtons();
            }
        }
    }

    // loadAllButtons: eskiden Handler.postDelayed içindeki tüm yükleme kodu burada (ve hemen çalışır)
    private void loadAllButtons() {
        // MODELLERİ EKLE
        modelListLeft.clear();
        modellistRight.clear();
        leftButtonDrawables.clear();
        rightButtonDrawables.clear();

        modelListLeft.add(new Model_Image(R.drawable.tevhid, R.drawable.tevhid, 0));
        modelListLeft.add(new Model_Image(R.drawable.peygamberlereiman, R.drawable.peygamberlereiman, 1));
        modelListLeft.add(new Model_Image(R.drawable.kitaplaraiman, R.drawable.kitaplaraiman, 2));
        modelListLeft.add(new Model_Image(R.drawable.meleklereiman, R.drawable.meleklereiman, 3));
        modelListLeft.add(new Model_Image(R.drawable.ahireteiman, R.drawable.ahireteiman, 4));
        modelListLeft.add(new Model_Image(R.drawable.kazakadereiman, R.drawable.kazakadereiman, 5));
        modelListLeft.add(new Model_Image(R.drawable.kelimeyisehadet, R.drawable.kelimeyisehadet, 6));
        modelListLeft.add(new Model_Image(R.drawable.namazkilmak, R.drawable.namazkilmak, 7));
        modelListLeft.add(new Model_Image(R.drawable.oructutmak, R.drawable.oructutmak, 8));
        modelListLeft.add(new Model_Image(R.drawable.haccagitmek, R.drawable.haccagitmek, 9));
        modelListLeft.add(new Model_Image(R.drawable.zekatvermek, R.drawable.zekatvermek, 10));

        // Sağ liste için kopyalama (Karıştırılacak)
        modellistRight.addAll(modelListLeft);
        list_boyut = modelListLeft.size();

        modellistRightCopy = new ArrayList<>(modellistRight);
        modelListLeftCopy = new ArrayList<>(modelListLeft);

        // *** PRE-CACHING (RESİM ÖNBELLEKLEME) - Ağır İşlem ***
        // Sol Butonlar için önbellekleme
        for (Model_Image model : modelListLeftCopy) {
            Drawable drawable = createButtonDrawable(model.getKelime(), Left_widthButton, Country_heightButton);
            leftButtonDrawables.put(model.getId(), drawable);
        }
        // Sağ Butonlar için önbellekleme
        for (Model_Image model : modellistRightCopy) {
            Drawable drawable = createButtonDrawable(model.getAnlami(), Country_widthButton, Country_heightButton);
            rightButtonDrawables.put(model.getId(), drawable);
        }
        // *** AĞIR İŞLEM BİTTİ ***

        Collections.shuffle(modelListLeft);
        Collections.shuffle(modellistRight);

        // önce container'ı temizle (yeniden yükleme durumları için güvenli)
        containerLeft.removeAllViews();
        containerRight.removeAllViews();

        // Sol butonlar (İkonlar)
        int numberOfButtonsToAdd = Math.min(6, modelListLeft.size());
        for (int i = 0; i < numberOfButtonsToAdd; i++) {
            Button button_AnaL = new Button(contex);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(Left_widthButton, Country_heightButton);
            params.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
            params.gravity = Gravity.CENTER_HORIZONTAL;
            button_AnaL.setLayoutParams(params);

            // Resim arka planı
            Drawable drawable = leftButtonDrawables.get(modelListLeft.get(i).getId());
            if (drawable != null) {
                button_AnaL.setBackground(drawable);
            } else {
                button_AnaL.setBackground(createDefaultBackgroundDrawable());
            }

            button_AnaL.setAllCaps(false);
            button_AnaL.setId(modelListLeft.get(i).getId());
            button_AnaL.setOnClickListener(clicklistenerLeft);

            containerLeft.addView(button_AnaL);
        }
        modelListLeft.subList(0, numberOfButtonsToAdd).clear();

        // Sağ butonlar (İkonlar)
        int numberOfButtonsToAdd_R = Math.min(6, modellistRight.size());
        for (int i = 0; i < numberOfButtonsToAdd_R; i++) {
            Button button_AnaR = new Button(contex);
            LinearLayout.LayoutParams params_R = new LinearLayout.LayoutParams(Country_widthButton, Country_heightButton);
            params_R.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
            params_R.gravity = Gravity.CENTER_HORIZONTAL;
            button_AnaR.setLayoutParams(params_R);

            // Resim arka planı
            Drawable drawable = rightButtonDrawables.get(modellistRight.get(i).getId());
            if (drawable != null) {
                button_AnaR.setBackground(drawable);
            } else {
                button_AnaR.setBackground(createDefaultBackgroundDrawable());
            }

            button_AnaR.setAllCaps(false);
            button_AnaR.setId(modellistRight.get(i).getId());
            button_AnaR.setOnClickListener(clicklistenerRight);

            containerRight.addView(button_AnaR);
        }
        modellistRight.subList(0, numberOfButtonsToAdd_R).clear();

        // yükleme bittikten sonra animasyonu başlat
        girianimasyonu();
    }

    // YARDIMCI METOT (Resim Boyutunu Hesaplama) - Performans iyileştirmesi
    private int calculateInSampleSize(BitmapFactory.Options options, int reqWidth, int reqHeight) {
        final int height = options.outHeight;
        final int width = options.outWidth;
        int inSampleSize = 1;

        if (height > reqHeight || width > reqWidth) {
            final int halfHeight = height / 2;
            final int halfWidth = width / 2;

            while ((halfHeight / inSampleSize) >= reqHeight && (halfWidth / inSampleSize) >= reqWidth) {
                inSampleSize *= 2;
            }
        }
        return inSampleSize;
    }

    // Sol ve Sağ Butonlar için Drawable oluşturma metodu (Performans iyileştirmesi içerir)
    private Drawable createButtonDrawable(int resId, int targetWidth, int targetHeight) {
        // 1. Düşük Örnekleme (InSampleSize) ile daha hafif Bitmap yükleme
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeResource(getResources(), resId, options);

        options.inSampleSize = calculateInSampleSize(options, targetWidth, targetHeight);
        options.inJustDecodeBounds = false;

        Bitmap originalBitmap = BitmapFactory.decodeResource(getResources(), resId, options);

        if (originalBitmap != null) {
            float scaleX = (float) targetWidth / originalBitmap.getWidth();
            float scaleY = (float) targetHeight / originalBitmap.getHeight();
            float scale = Math.min(scaleX, scaleY);

            int scaledWidth = (int) (originalBitmap.getWidth() * scale);
            int scaledHeight = (int) (originalBitmap.getHeight() * scale);

            if (scaledWidth == 0 || scaledHeight == 0) return null;

            Bitmap scaledBitmap = Bitmap.createScaledBitmap(originalBitmap, scaledWidth, scaledHeight, true);

            // Round köşeler + Border ekleme
            Bitmap roundedBitmap = getRoundedCornerBitmapWithBorder(scaledBitmap, 40);
            scaledBitmap.recycle();

            BitmapDrawable drawable = new BitmapDrawable(getResources(), roundedBitmap);
            drawable.setGravity(Gravity.CENTER);
            return drawable;
        }
        return createDefaultBackgroundDrawable();
    }

    // Varsayılan/Yedek arka plan oluşturma metodu (DarkCyan ve Beyaz kenarlık)
    private Drawable createDefaultBackgroundDrawable() {
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setColor(getResources().getColor(R.color.DarkCyan));
        shape.setCornerRadius(40f);
        shape.setStroke(3, getResources().getColor(R.color.white));
        return shape;
    }

    private void showInfoDialog() {
        LayoutInflater inflater = LayoutInflater.from(contex);
        View view = inflater.inflate(R.layout.info_b1_buttonb, null);

        TextView dialogTitle = view.findViewById(R.id.dialogTitle);
        TextView dialogMessage = view.findViewById(R.id.dialogMessage);

        if (selectedLanguage.equals("English")) {
            dialogTitle.setText("📢 About the Game");
            dialogMessage.setText("🎯 Goal: Match the icons on the left with the icons on the right.\n\n🧠 When matched correctly, buttons disappear.\n\n🎮 When all matches are completed, you proceed to the next level.");
        } else {
            dialogTitle.setText("📢 Oyun Hakkında");
            dialogMessage.setText("🎯 Amaç: Soldaki ikonlar ile sağdaki ikonları eşleştir.\n\n🧠 Doğru eşleşmede butonlar kaybolur.\n\n🎮 Tüm eşleşmeler tamamlandığında yeni bölüme geçilir.");
        }

        AlertDialog.Builder builder = new AlertDialog.Builder(contex);
        builder.setView(view);
        builder.setPositiveButton(selectedLanguage.equals("English") ? "OK" : "Anladım", (dialog, id) -> dialog.dismiss());
        AlertDialog dialog = builder.create();
        dialog.show();

        dialog.getButton(AlertDialog.BUTTON_POSITIVE)
                .setTextColor(ContextCompat.getColor(contex, R.color.teal_700));

        dialog.getWindow().setBackgroundDrawable(
                new ColorDrawable(ContextCompat.getColor(contex, R.color.Beige))
        );
    }

    private Bitmap getRoundedCornerBitmapWithBorder(Bitmap bitmap, int pixels) {
        Bitmap output = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(output);
        final Paint paint = new Paint();
        final RectF rect = new RectF(0, 0, bitmap.getWidth(), bitmap.getHeight());
        final RectF rectForBorder = new RectF(2f, 2f, bitmap.getWidth() - 2f, bitmap.getHeight() - 2f);

        paint.setAntiAlias(true);
        canvas.drawARGB(0, 0, 0, 0);
        paint.setColor(Color.WHITE);
        canvas.drawRoundRect(rect, pixels, pixels, paint);

        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, 0, 0, paint);

        // Border ekleme
        Paint strokePaint = new Paint();
        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeWidth(4f);
        strokePaint.setColor(getResources().getColor(R.color.white));
        strokePaint.setAntiAlias(true);
        canvas.drawRoundRect(rectForBorder, pixels, pixels, strokePaint);

        return output;
    }

    // GÜNCELLENMİŞ girianimasyonu METODU (Daha hızlı)
    private void girianimasyonu() {
        // Sol butonlar
        int leftCount = containerLeft.getChildCount();
        for (int i = 0; i < leftCount; i++) {
            int index = Math.max(0, Math.min(5, leftCount - 1 - i));
            Button button = (Button) containerLeft.getChildAt(index);
            ObjectAnimator animator = ObjectAnimator.ofFloat(button, "translationX", -Left_widthButton * 1.5f, 0);
            animator.setInterpolator(new AccelerateDecelerateInterpolator());
            animator.setDuration(duration + i * 30);
            animator.start();
        }
        // Sağ butonlar
        int rightCount = containerRight.getChildCount();
        for (int i = 0; i < rightCount; i++) {
            int index = Math.max(0, Math.min(5, rightCount - 1 - i));
            Button button = (Button) containerRight.getChildAt(index);
            ObjectAnimator animator = ObjectAnimator.ofFloat(button, "translationX", widthButton * 1.5f, 0);
            animator.setInterpolator(new AccelerateDecelerateInterpolator());
            animator.setDuration(duration + i * 30);
            animator.start();
        }
    }

    private void eslesmediEfect() {
        animateMismatch(selectButtonLeft);
        animateMismatch(selectButtonRight);

        new Handler().postDelayed(() -> {
            animateButton(selectButtonLeft);
            animateButton(selectButtonRight);

            // Sol buton reset (Alpha 1f)
            if (selectButtonLeft != null) selectButtonLeft.setAlpha(1f);

            // Sağ buton reset (Alpha 1f ve orijinal resme dön)
            if (selectButtonRight != null) {
                Drawable resetDrawable = rightButtonDrawables.get(selectButtonRight.getId());
                if (resetDrawable != null) {
                    selectButtonRight.setBackground(resetDrawable);
                } else {
                    selectButtonRight.setBackground(createDefaultBackgroundDrawable());
                }
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    selectButtonRight.setBackgroundTintList(null);
                }
                selectButtonRight.setAlpha(1f);
            }

            selectButtonLeft = null;
            selectButtonRight = null;
            butonabasmaaktifmi = true;
        }, 300);
    }

    private void animateMismatch(Button button) {
        if (button != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            button.animate()
                    .scaleX(0.8f).scaleY(0.8f)
                    .alpha(0.3f)
                    .setDuration(150)
                    .withEndAction(() -> button.animate()
                            .scaleX(1f).scaleY(1f)
                            .alpha(1f)
                            .setDuration(150)
                            .start())
                    .start();
        }
    }

    private void animateButton(Button button) {
        if (button != null) {
            button.animate()
                    .scaleX(1.1f)
                    .scaleY(1.1f)
                    .setDuration(150)
                    .withEndAction(() -> button.animate()
                            .scaleX(1f)
                            .scaleY(1f)
                            .setDuration(150)
                            .start())
                    .start();
        }
    }

    private void eslestiEfect() {
        animateMatch(selectButtonLeft);
        animateMatch(selectButtonRight);

        new Handler().postDelayed(this::kaybol, 300);
    }

    private void animateMatch(Button button) {
        if (button != null && Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            button.animate()
                    .scaleX(1.1f).scaleY(1.1f)
                    .alpha(0.7f)
                    .setDuration(200)
                    .withEndAction(() -> button.animate()
                            .scaleX(1f).scaleY(1f)
                            .alpha(1f)
                            .setDuration(100)
                            .start())
                    .start();
        }
    }

    private void kaybol() {
        if (selectButtonLeft == null || selectButtonRight == null) {
            // güvenlik
            selectButtonLeft = null;
            selectButtonRight = null;
            butonabasmaaktifmi = true;
            return;
        }
        ObjectAnimator animatorLeft = ObjectAnimator.ofFloat(selectButtonLeft, "translationX", 0, -Left_widthButton * 1.5f);
        ObjectAnimator animatorRight = ObjectAnimator.ofFloat(selectButtonRight, "translationX", 0, widthButton * 1.5f);

        AnimatorSet set = new AnimatorSet();
        set.playTogether(animatorLeft, animatorRight);
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

                if (modelListLeft.size() == 0 && modellistRight.size() == 0) {
                    if (silinenButonSayisi == list_boyut) {
                        Dialog dialog = new Dialog(contex, R.style.CustomDialog);
                        LayoutInflater layoutInflater = LayoutInflater.from(contex);
                        CardView view = (CardView) layoutInflater.inflate(R.layout.dialog, null);
                        dialog.setContentView(view);
                        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));

                        dialog.show();
                        new Handler().postDelayed(() -> {
                            if (dbHelper != null) {
                                dbHelper.updateTamamlandiByAd("Bolum1_AltBolumA_AltC");
                            }

                            Intent intent = new Intent(getActivity(), Bolum1_AltBolumA_AltAna.class);
                            startActivity(intent);
                            getActivity().finish();
                            dialog.dismiss();
                        }, 3000);
                    }
                } else {
                    butonekle();
                }
            }
        });
        set.start();
    }

    private void butonekle() {
        // Sol butonu ekleme (Her iki listeden de birer eleman olmalı)
        if (!modelListLeft.isEmpty()) {
            Model_Image modelL = modelListLeft.get(0);
            Button buttonL = new Button(contex);
            buttonL.setAllCaps(false);
            buttonL.setId(modelL.getId());

            Drawable drawableL = leftButtonDrawables.get(modelL.getId());
            buttonL.setBackground(drawableL != null ? drawableL : createDefaultBackgroundDrawable());

            LinearLayout.LayoutParams paramsL = new LinearLayout.LayoutParams(Left_widthButton, Country_heightButton);
            paramsL.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
            paramsL.gravity = Gravity.CENTER_HORIZONTAL;
            buttonL.setLayoutParams(paramsL);

            buttonL.setOnClickListener(clicklistenerLeft);
            containerLeft.addView(buttonL, 0);
            modelListLeft.remove(0);

            ObjectAnimator animatorLeft = ObjectAnimator.ofFloat(buttonL, "translationX", -Left_widthButton * 1.5f, 0);
            animatorLeft.setInterpolator(new AccelerateDecelerateInterpolator());
            animatorLeft.setDuration(duration_ekle_Button);
            animatorLeft.start();
        }

        // Sağ butonu ekleme
        if (!modellistRight.isEmpty()) {
            Model_Image modelR = modellistRight.get(0);
            Button buttonR = new Button(contex);
            buttonR.setAllCaps(false);
            buttonR.setId(modelR.getId());

            Drawable drawableR = rightButtonDrawables.get(modelR.getId());
            buttonR.setBackground(drawableR != null ? drawableR : createDefaultBackgroundDrawable());

            LinearLayout.LayoutParams paramsR = new LinearLayout.LayoutParams(Country_widthButton, Country_heightButton);
            paramsR.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
            paramsR.gravity = Gravity.CENTER_HORIZONTAL;
            buttonR.setLayoutParams(paramsR);

            buttonR.setOnClickListener(clicklistenerRight);
            containerRight.addView(buttonR, 0); // Sağ tarafa eklenmeli
            modellistRight.remove(0);

            ObjectAnimator animatorRight = ObjectAnimator.ofFloat(buttonR, "translationX", widthButton * 1.5f, 0);
            animatorRight.setInterpolator(new AccelerateDecelerateInterpolator());
            animatorRight.setDuration(duration_ekle_Button);
            animatorRight.start();
        }
    }
}
