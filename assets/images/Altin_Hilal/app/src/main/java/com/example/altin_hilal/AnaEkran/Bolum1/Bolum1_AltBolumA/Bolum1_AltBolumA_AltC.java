package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Typeface;
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
import androidx.core.content.res.ResourcesCompat;
import androidx.fragment.app.Fragment;

import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.Model.Model_Country;
import com.example.altin_hilal.R;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class Bolum1_AltBolumA_AltC extends Fragment {
    private Context contex;
    private List<Model_Country> modelListLeft, modellistRight;
    private List<Model_Country> modelListLeftCopy, modellistRightCopy;
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

    private Map<Integer, Drawable> leftButtonDrawables;

    private int list_boyut;
    private ImageButton btnInfob1b;
    private TextView GameAbout1b;

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
                        selectButtonLeft.setAlpha(1f);
                    }
                }
                selectButtonLeft = (Button) v;
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
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

                // *** HER ZAMAN ESKİ SEÇİMİ SIFIRLA (DarkCyan'a dön) ***
                if (selectButtonRight != null) {
                    // Eski butonu orijinal rengine (DarkCyan) ve metin rengine (GreenYellow) döndür
                    GradientDrawable shapeReset = new GradientDrawable();
                    shapeReset.setShape(GradientDrawable.RECTANGLE);
                    shapeReset.setColor(getResources().getColor(R.color.DarkCyan)); // Orijinal renk
                    shapeReset.setCornerRadius(40f);
                    shapeReset.setStroke(3, getResources().getColor(R.color.white));

                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                        selectButtonRight.setBackground(shapeReset);
                    } else {
                        selectButtonRight.setBackgroundDrawable(shapeReset);
                    }
                    selectButtonRight.setTextColor(getResources().getColor(R.color.GreenYellow)); // Orijinal metin rengi

                    // Tint'i sıfırla
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        selectButtonRight.setBackgroundTintList(null);
                    }
                }
                // *** SIFIRLAMA BİTTİ ***

                selectButtonRight = (Button) v;

                // YENİ seçilen butonu sadece BEIGE yap ve metni BLACK yap
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    selectButtonRight.setTextColor(getResources().getColor(R.color.black));
                    selectButtonRight.setBackgroundTintList(ColorStateList.valueOf(getResources().getColor(R.color.Beige)));
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
        modelListLeft = new ArrayList<>();
        modellistRight = new ArrayList<>();
        leftButtonDrawables = new HashMap<>();

        if (savedInstanceState == null) {
            showInfoDialog();
        }
        btnInfob1b = ((AppCompatActivity) contex).findViewById(R.id.btnInfob1b);
        GameAbout1b = ((AppCompatActivity) contex).findViewById(R.id.GameAbout1b);

        btnInfob1b.setOnClickListener(v -> showInfoDialog());
        GameAbout1b.setOnClickListener(v -> showInfoDialog());

        containerLeft = ((AppCompatActivity) contex).findViewById(R.id.containerleft);
        containerRight = ((AppCompatActivity) contex).findViewById(R.id.containerright);

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
            public void onNothingSelected(AdapterView<?> parent) {}
        });

        Display display = getActivity().getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);

        DisplayMetrics metrics = contex.getResources().getDisplayMetrics();
        int screenWidth = metrics.widthPixels;
        int screenHeight = metrics.heightPixels;
        float density = metrics.density;
        float densityDpi = metrics.densityDpi;

        // Sağ buton genişliği (temel) - Yan yana sığması için ve büyük görünmesi için ayarlıyoruz
        if (densityDpi <= 160) {
            Country_widthButton = (int) (screenWidth * 0.38f);
            Country_heightButton = (int) (screenHeight * 0.12);
        } else if (densityDpi <= 240) {
            Country_widthButton = (int) (screenWidth * 0.36f);
            Country_heightButton = (int) (screenHeight * 0.11);
        } else if (densityDpi <= 320) {
            Country_widthButton = (int) (screenWidth * 0.33f);
            Country_heightButton = (int) (screenHeight * 0.10);
        } else if (densityDpi <= 440) {
            Country_widthButton = (int) (screenWidth * 0.33f);
            Country_heightButton = (int) (screenHeight * 0.095);
        } else if (densityDpi <= 450) {
            Country_widthButton = (int) (screenWidth * 0.33f);
            Country_heightButton = (int) (screenHeight * 0.10);
        } else if (densityDpi <= 560) {
            Country_widthButton = (int) (screenWidth * 0.30f);
            Country_heightButton = (int) (screenHeight * 0.09);
        } else if (densityDpi <= 640) {
            Country_widthButton = (int) (screenWidth * 0.28f);
            Country_heightButton = (int) (screenHeight * 0.085);
        } else {
            // SAĞ BUTON GENİŞLİĞİ: Yüksek çözünürlüklü cihazlar için %35
            Country_widthButton = (int) (screenWidth * 0.35f);
            Country_heightButton = (int) (screenHeight * 0.08);
        }

        // Sol butonlar için ekranın kalanını kullan
        // DÜZELTME: Sol buton genişliği %60'a çıkarıldı.
        Left_widthButton = (int) (screenWidth * 0.80f);

        Country_heightButton = (int) (Country_heightButton * 1.4);
        widthButton = Country_widthButton; // Sağ için
        heightButton = (int) ((size.y) / 12);

        // **Metin Ortalaması/Taşması Düzeltmesi**
        int verticalPadding = (int) (16 * density); // Dikey padding azaltıldı (16dp)
        int horizontalPadding = (int) (32 * density); // Yatay padding korundu (32dp)

        // Marjin değerleri
        int buttonMarginVertical = (int) (8 * density);
        int buttonMarginHorizontal = (int) (12 * density);

        // Model'leri ekle
        modelListLeft.add(new Model_Country(R.drawable.tevhid, "Allah(c.c)'a İman (Tevhid)", 0));
        modelListLeft.add(new Model_Country(R.drawable.peygamberlereiman, "Peygamberlere İman ", 1));
        modelListLeft.add(new Model_Country(R.drawable.kitaplaraiman, "Kitaplara İman", 2));
        modelListLeft.add(new Model_Country(R.drawable.meleklereiman, "Meleklere İman", 3));
        modelListLeft.add(new Model_Country(R.drawable.ahireteiman, "Ahiret Gününe İman", 4));
        modelListLeft.add(new Model_Country(R.drawable.kazakadereiman, "Kaza ve Kaderin Allah(c.c)'tan geldiğine İman", 5));
        modelListLeft.add(new Model_Country(R.drawable.kelimeyisehadet, "Kelimeyi Şehadet Getirmek", 6));
        modelListLeft.add(new Model_Country(R.drawable.namazkilmak, "Namaz Kılmak", 7));
        modelListLeft.add(new Model_Country(R.drawable.oructutmak, "Oruç Tutmak", 8));
        modelListLeft.add(new Model_Country(R.drawable.haccagitmek, "Oruç Tutmak", 9));
        modelListLeft.add(new Model_Country(R.drawable.zekatvermek, "Zekat Vermek", 10));

        for (Model_Country model : modelListLeft) {
            modellistRight.add(model);
        }
        list_boyut = modelListLeft.size();

        modellistRightCopy = new ArrayList<>(modellistRight);
        modelListLeftCopy = new ArrayList<>(modelListLeft);

        // Pre-caching
        int targetWidth = Left_widthButton;
        int targetHeight = Country_heightButton;
        for (Model_Country model : modelListLeftCopy) {
            Bitmap originalBitmap = BitmapFactory.decodeResource(getResources(), model.getImageResourceId());
            if (originalBitmap != null) {
                float scaleX = (float) targetWidth / originalBitmap.getWidth();
                float scaleY = (float) targetHeight / originalBitmap.getHeight();
                float scale = Math.min(scaleX, scaleY);
                int scaledWidth = (int) (originalBitmap.getWidth() * scale);
                int scaledHeight = (int) (originalBitmap.getHeight() * scale);
                Bitmap scaledBitmap = Bitmap.createScaledBitmap(originalBitmap, scaledWidth, scaledHeight, true);
                originalBitmap.recycle();

                // Round köşeler + Border ekleme
                Bitmap roundedBitmap = getRoundedCornerBitmapWithBorder(scaledBitmap, 40);
                scaledBitmap.recycle();

                BitmapDrawable drawable = new BitmapDrawable(getResources(), roundedBitmap);
                drawable.setGravity(Gravity.CENTER);
                leftButtonDrawables.put(model.getId(), drawable);
            }
        }

        Collections.shuffle(modelListLeft);
        Collections.shuffle(modellistRight);

        // Sol butonlar
        int numberOfButtonsToAdd = Math.min(6, modelListLeft.size());
        for (int i = 0; i < numberOfButtonsToAdd; i++) {
            Button button_AnaL = new Button(contex);
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(Left_widthButton, Country_heightButton); // GÜNCELLEME: Left_widthButton kullanıldı
            params.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
            params.gravity = Gravity.CENTER_HORIZONTAL;
            button_AnaL.setLayoutParams(params);

            Drawable drawable = leftButtonDrawables.get(modelListLeft.get(i).getId());
            button_AnaL.setBackground(drawable);

            button_AnaL.setAllCaps(false);
            button_AnaL.setId(modelListLeft.get(i).getId());

            button_AnaL.setGravity(Gravity.CENTER);
            button_AnaL.setPadding(0, 0, 0, 0);

            button_AnaL.setOnClickListener(clicklistenerLeft);

            containerLeft.addView(button_AnaL);
        }
        modelListLeft.subList(0, numberOfButtonsToAdd).clear();

        // Sağ butonlar
        int numberOfButtonsToAdd_R = Math.min(6, modellistRight.size());
        for (int i = 0; i < numberOfButtonsToAdd_R; i++) {
            Button button_AnaR = new Button(contex);
            button_AnaR.setWidth(widthButton);
            button_AnaR.setHeight(heightButton);

            LinearLayout.LayoutParams params_R = new LinearLayout.LayoutParams(Country_widthButton, Country_heightButton);
            params_R.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
            params_R.gravity = Gravity.CENTER_HORIZONTAL;
            button_AnaR.setLayoutParams(params_R);
            button_AnaR.setAllCaps(false);

            // Border ve rounded background
            GradientDrawable shape = new GradientDrawable();
            shape.setShape(GradientDrawable.RECTANGLE);
            shape.setColor(getResources().getColor(R.color.DarkCyan));
            shape.setCornerRadius(40f);
            shape.setStroke(3, getResources().getColor(R.color.white));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                button_AnaR.setBackground(shape);
            } else {
                button_AnaR.setBackgroundDrawable(shape);
            }

            button_AnaR.setTextColor(getResources().getColor(R.color.GreenYellow));
            button_AnaR.setTextSize(Country_heightButton / 30f);

            button_AnaR.setGravity(Gravity.CENTER);
            button_AnaR.setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding);

            button_AnaR.setId(modellistRight.get(i).getId());
            button_AnaR.setText(modellistRight.get(i).getKelime());
            Typeface typeface = ResourcesCompat.getFont(contex, R.font.yazi_3);
            button_AnaR.setTypeface(typeface, Typeface.BOLD);
            button_AnaR.setAllCaps(false);
            button_AnaR.setOnClickListener(clicklistenerRight);
            containerRight.addView(button_AnaR);
        }
        modellistRight.subList(0, numberOfButtonsToAdd_R).clear();
        girianimasyonu();
    }
    private void showInfoDialog() {
        LayoutInflater inflater = LayoutInflater.from(contex);
        View view = inflater.inflate(R.layout.info_b1_buttonb, null);

        TextView dialogTitle = view.findViewById(R.id.dialogTitle);
        TextView dialogMessage = view.findViewById(R.id.dialogMessage);

        if (selectedLanguage.equals("English")) {
            dialogTitle.setText("📢 About the Game");
            dialogMessage.setText("🎯 Goal: Match the icons on the left with the faith topics on the right.\n\n🧠 When matched correctly, buttons disappear.\n\n🎮 When all matches are completed, you proceed to the next level.");
        } else {
            dialogTitle.setText("📢 Oyun Hakkında");
            dialogMessage.setText("🎯 Amaç: Soldaki ikonlar ile sağdaki iman konuları eşleştir.\n\n🧠 Doğru eşleşmede butonlar kaybolur.\n\n🎮 Tüm eşleşmeler tamamlandığında yeni bölüme geçilir.");
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
        paint.setAntiAlias(true);
        canvas.drawRoundRect(rect, pixels, pixels, paint);
        paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
        canvas.drawBitmap(bitmap, 0, 0, paint);

        // Border ekleme
        Paint strokePaint = new Paint();
        strokePaint.setStyle(Paint.Style.STROKE);
        strokePaint.setStrokeWidth(4f);
        strokePaint.setColor(getResources().getColor(R.color.white));
        strokePaint.setAntiAlias(true);
        canvas.drawRoundRect(rect, pixels, pixels, strokePaint);

        return output;
    }

    private void girianimasyonu() {
        for (int i = 0; i < containerLeft.getChildCount(); i++) {
            Button button = (Button) containerLeft.getChildAt(5 - i);
            ObjectAnimator animator = ObjectAnimator.ofFloat(button, "translationX", -Left_widthButton * 1.5f, 0);
            animator.setInterpolator(new AccelerateDecelerateInterpolator());
            animator.setDuration(duration + i * 70);
            animator.start();
        }
        for (int i = 0; i < containerRight.getChildCount(); i++) {
            Button button = (Button) containerRight.getChildAt(5 - i);
            ObjectAnimator animator = ObjectAnimator.ofFloat(button, "translationX", widthButton * 1.5f, 0);
            animator.setInterpolator(new AccelerateDecelerateInterpolator());
            animator.setDuration(duration + i * 70);
            animator.start();
        }
    }

    private void eslesmediEfect() {
        animateMismatch(selectButtonLeft);
        animateMismatch(selectButtonRight);

        new Handler().postDelayed(() -> {
            animateButton(selectButtonLeft);
            animateButton(selectButtonRight);

            // Sol buton reset (Alpha 1f ve Padding 0)
            Drawable cachedDrawable = leftButtonDrawables.get(selectButtonLeft.getId());
            if (cachedDrawable != null) {
                selectButtonLeft.setBackground(cachedDrawable);
            }
            selectButtonLeft.setAlpha(1f);
            selectButtonLeft.setPadding(0, 0, 0, 0);

            // Sağ buton reset (DarkCyan ve GreenYellow metin)
            selectButtonRight.setTextColor(getResources().getColor(R.color.GreenYellow));

            // Seçimden sonra DarkCyan ve beyaz kenarlığa dön
            GradientDrawable shapeReset = new GradientDrawable();
            shapeReset.setShape(GradientDrawable.RECTANGLE);
            shapeReset.setColor(getResources().getColor(R.color.DarkCyan));
            shapeReset.setCornerRadius(40f);
            shapeReset.setStroke(3, getResources().getColor(R.color.white));
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
                selectButtonRight.setBackground(shapeReset);
            } else {
                selectButtonRight.setBackgroundDrawable(shapeReset);
            }
            // Ayrıca, varsa tint listesini sıfırla (DarkCyan'a dönmeyi garantiler)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                selectButtonRight.setBackgroundTintList(null);
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
                            DatabaseHelper dbHelper = new DatabaseHelper(contex);
                            dbHelper.updateTamamlandiByAd("Bolum1_AltBolumA_AltC");

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
        float density = contex.getResources().getDisplayMetrics().density;

        // Padding ve Marjin değerleri
        int verticalPadding = (int) (16 * density);
        int horizontalPadding = (int) (32 * density);
        int buttonMarginVertical = (int) (8 * density);
        int buttonMarginHorizontal = (int) (12 * density);

        // Sol buton
        Button buttonL = new Button(contex);
        buttonL.setWidth(Left_widthButton);
        buttonL.setHeight(heightButton);
        buttonL.setAllCaps(false);
        buttonL.setId(modelListLeft.get(0).getId());

        Drawable drawable = leftButtonDrawables.get(modelListLeft.get(0).getId());
        buttonL.setBackground(drawable);

        LinearLayout.LayoutParams paramsL = new LinearLayout.LayoutParams(Left_widthButton, Country_heightButton);
        paramsL.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
        paramsL.gravity = Gravity.CENTER_HORIZONTAL;
        buttonL.setLayoutParams(paramsL);

        buttonL.setGravity(Gravity.CENTER);
        buttonL.setPadding(0, 0, 0, 0);

        buttonL.setOnClickListener(clicklistenerLeft);
        containerLeft.addView(buttonL, 0);
        modelListLeft.remove(0);
        ObjectAnimator animatorLeft = ObjectAnimator.ofFloat(buttonL, "translationX", -Left_widthButton * 1.5f, 0);
        animatorLeft.setInterpolator(new AccelerateDecelerateInterpolator());
        animatorLeft.setDuration(duration_ekle_Button);
        animatorLeft.start();

        // Sağ buton
        Button buttonR = new Button(contex);
        buttonR.setWidth(widthButton);
        buttonR.setHeight(heightButton);
        buttonR.setTextColor(getResources().getColor(R.color.GreenYellow));
        buttonR.setTextSize(Country_heightButton / 30f);
        buttonR.setId(modellistRight.get(0).getId());
        buttonR.setText(modellistRight.get(0).getKelime());
        Typeface typeface = ResourcesCompat.getFont(contex, R.font.yazi_3);
        buttonR.setTypeface(typeface, Typeface.BOLD);
        buttonR.setAllCaps(false);

        // Border ve rounded background
        GradientDrawable shape = new GradientDrawable();
        shape.setShape(GradientDrawable.RECTANGLE);
        shape.setColor(getResources().getColor(R.color.DarkCyan));
        shape.setCornerRadius(40f);
        shape.setStroke(3, getResources().getColor(R.color.white));
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN) {
            buttonR.setBackground(shape);
        } else {
            buttonR.setBackgroundDrawable(shape);
        }

        LinearLayout.LayoutParams paramsR = new LinearLayout.LayoutParams(Country_widthButton, Country_heightButton);
        paramsR.setMargins(buttonMarginHorizontal, buttonMarginVertical, buttonMarginHorizontal, buttonMarginVertical);
        paramsR.gravity = Gravity.CENTER_HORIZONTAL;
        buttonR.setLayoutParams(paramsR);

        buttonR.setGravity(Gravity.CENTER);
        buttonR.setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding);

        buttonR.setOnClickListener(clicklistenerRight);
        containerRight.addView(buttonR, 0);
        modellistRight.remove(0);
        ObjectAnimator animatorRight = ObjectAnimator.ofFloat(buttonR, "translationX", widthButton * 1.5f, 0);
        animatorRight.setInterpolator(new AccelerateDecelerateInterpolator());
        animatorRight.setDuration(duration_ekle_Button);
        animatorRight.start();
    }
}