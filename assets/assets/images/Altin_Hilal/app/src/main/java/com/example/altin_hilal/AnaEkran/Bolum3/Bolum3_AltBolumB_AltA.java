package com.example.altin_hilal.AnaEkran.Bolum3;

import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Vibrator;
import android.text.Spannable;
import android.text.SpannableString;
import android.text.style.ForegroundColorSpan;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.core.widget.CompoundButtonCompat;

import com.example.altin_hilal.R;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CopyOnWriteArrayList;

public class Bolum3_AltBolumB_AltA extends AppCompatActivity {

    private GameView gameView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // activity_bolum1_alt_bolum_calt_b layout'unuzun var olduğunu varsayıyoruz
        setContentView(R.layout.activity_bolum3_alt_bolum_balt);

        FrameLayout container = findViewById(R.id.gameContainer);
        if (container != null) {
            gameView = new GameView(this);
            container.addView(gameView);
        }
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (gameView != null) gameView.pause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        if (gameView != null) gameView.resume();
    }

    // ======================= INNER GAME CLASS =======================
    public static class GameView extends SurfaceView implements SurfaceHolder.Callback, Runnable {

        private Thread thread;
        private SurfaceHolder holder;
        private volatile boolean running = false;

        private Paint paintTrack, paintCar, paintObstacle, paintText, paintGrass;
        private int screenW = 1080, screenH = 1920;
        private float carX, carY, carW = 160, carH = 80;
        private float carSpeed = 6f;

        // Araba çizimi vektörel olduğu için bu null kalacak
        private Bitmap carBitmap = null;
        private Bitmap obstaclePersonBitmap;
        private Bitmap obstacleAnimalBitmap;

        private Paint roundPaint;
        private Paint bitmapPaint;
        private Paint carMaskPaint;

        private static class Obstacle {
            RectF rect;
            boolean active = true;
            Bitmap image;
            boolean passed = false;

            Obstacle(RectF r, Bitmap img) {
                rect = r;
                image = img;
            }
        }

        private final List<Obstacle> obstacles = new CopyOnWriteArrayList<>();
        private final Random rand = new Random();
        private final Handler uiHandler = new Handler(Looper.getMainLooper());
        private final Context ctx;

        private int score = 0;
        private int mistakes = 0;
        private int passedObstacles = 0;

        private final List<EnglishQuestion> questions = new ArrayList<>();

        private long lastTouchTime = 0;
        private float lastTouchY = 0;

        public GameView(Context context) {
            super(context);
            ctx = context;
            init();
        }

        public GameView(Context context, AttributeSet attrs) {
            super(context, attrs);
            ctx = context;
            init();
        }

        private void init() {
            holder = getHolder();
            holder.addCallback(this);

            paintTrack = new Paint();
            paintGrass = new Paint();
            paintCar = new Paint();
            paintObstacle = new Paint();
            paintText = new Paint();

            // Engelleri yuvarlak çizmek için paint ayarları
            roundPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            roundPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
            bitmapPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            carMaskPaint = new Paint(Paint.ANTI_ALIAS_FLAG);


            // RENK AYARLARI
            paintTrack.setColor(Color.rgb(64, 64, 64)); // Koyu Gri Yol
            paintGrass.setColor(Color.rgb(100, 220, 100)); // Parlak Yeşil Çim

            paintCar.setColor(Color.RED);
            paintObstacle.setColor(Color.YELLOW);
            paintText.setColor(Color.WHITE);
            paintText.setTextSize(50f);

            setupQuestions();
            loadBitmaps();

            for (int i = 0; i < 3; i++) spawnObstacle();

            setFocusable(true);
        }

        private void setupQuestions() {

            questions.add(new EnglishQuestion(
                    "Medya çocukları en çok hangi yolla etkileyebilir?",
                    new String[]{
                            "Sadece bilgi vererek",
                            "Renkler ve eğlenceli sahnelerle",
                            "Duygulara hitap ederek",
                            "Hiç etkilemez"
                    },
                    2
            ));

            questions.add(new EnglishQuestion(
                    "Bazı çizgi film sahneleri neden dikkatli izlenmelidir?",
                    new String[]{
                            "Çok uzun oldukları için",
                            "Yanlış davranışları normal gösterebildiği için",
                            "Sesleri yüksek olduğu için",
                            "Siyah beyaz oldukları için"
                    },
                    1
            ));

            questions.add(new EnglishQuestion(
                    "Dumbo filmindeki 'Pembe Filler' sahnesi bize neyi gösterir?",
                    new String[]{
                            "Gerçek hayatta olmayan bir durumu",
                            "Komik bir hayvan hikâyesini",
                            "Bir spor yarışmasını",
                            "Bir arkadaşlık öyküsünü"
                    },
                    0
            ));

            questions.add(new EnglishQuestion(
                    "Bazı şekil ve semboller neden farklı şekillerde yorumlanabilir?",
                    new String[]{
                            "Herkes aynı şeyi düşündüğü için",
                            "Sadece süs oldukları için",
                            "İnsanlar onlara farklı anlamlar yükleyebildiği için",
                            "Hiçbir anlamları olmadığı için"
                    },
                    2
            ));

            questions.add(new EnglishQuestion(
                    "Bir mesajın gizli verilmesi ne demektir?",
                    new String[]{
                            "Açıkça söylenmesi",
                            "Fark edilmeden anlatılması",
                            "Yazıyla anlatılması",
                            "Hiç anlatılmaması"},
                    1
            ));

            questions.add(new EnglishQuestion(
                    "Çocuklar medya karşısında neden daha dikkatli olmalıdır?",
                    new String[]{
                            "Çünkü her şeyi hemen anlayamazlar",
                            "Çünkü her zaman doğruyu söylerler",
                            "Çünkü televizyonu severler",
                            "Çünkü çizgi film izlerler"},
                    0
            ));

            questions.add(new EnglishQuestion(
                    "Klip ve filmlerde kullanılan görseller neden önemlidir?",
                    new String[]{
                            "Sadece güzel göründükleri için",
                            "İzleyicinin duygularını etkileyebildikleri için",
                            "Daha uzun oldukları için",
                            "Sesli oldukları için"},
                    1
            ));

            questions.add(new EnglishQuestion(
                    "Medya izlerken en doğru davranış hangisidir?",
                    new String[]{
                            "Her şeyi doğru kabul etmek",
                            "Hiç izlememek",
                            "Düşünerek ve bilinçli izlemek",
                            "Sadece eğlence olarak görmek"},
                    2
            ));
            questions.add(new EnglishQuestion("Özellikle çizgi filmlerde hangi tür görsellerin arka planlarda veya giysilerde gizlendiğini görünür?",
                    new String[]{"Hayvan figürleri.",
                            "Cinsel organlara veya eylemlere ait figürler.",
                            "Doğa manzaraları.",
                            "Tarihi karakterler."}, 1));

            questions.add(new EnglishQuestion("Bu tür gizli mesajların en büyük hedefi nedir?",
                    new String[]{
                            "Sanat ödülleri kazanmak.",
                            "Medya şirketlerinin karını artırmak.",
                            "Çocukları küçük yaşlardan itibaren kontrol altına almak.",
                            "Eğitim sistemini iyileştirmek."}, 2));

        }


        class EnglishQuestion {
            String question;
            String[] options; // Şıklar
            int correctAnswerIndex; // 0, 1, 2 veya 3

            public EnglishQuestion(String q, String[] opt, int correct) {
                this.question = q;
                this.options = opt;
                this.correctAnswerIndex = correct;
            }
        }

        private EnglishQuestion getRandomQuestion() {
            if (questions.isEmpty()) return null;
            return questions.get(rand.nextInt(questions.size()));
        }

        private void loadBitmaps() {
            try {
                // Araba için vektörel çizim kullanıldığı için carBitmap null
                carBitmap = null;

                // Engellerin var olduğunu varsayarak kaynakları yükle
                // NOT: Bu kısım, R.drawable içinde bu isimde resimlerinizin var olmasına bağlıdır.
                obstaclePersonBitmap = BitmapFactory.decodeResource(ctx.getResources(), R.drawable.obstacle_person);
                obstacleAnimalBitmap = BitmapFactory.decodeResource(ctx.getResources(), R.drawable.obstacle_animal);

            } catch (Exception e) {
                // Kaynaklar bulunamazsa, null olarak kalacaklar
                carBitmap = null;
                obstaclePersonBitmap = null;
                obstacleAnimalBitmap = null;
            }
        }

        private void spawnObstacle() {
            float w = 120;
            float h = 120;
            float roadLeft = 80;
            float roadRight = screenW - 80;
            float minSeparationY = 300f;

            float nearestObstacleY = Float.MAX_VALUE;
            for (Obstacle ob : obstacles) {
                if (ob.active && ob.rect.top < nearestObstacleY) {
                    nearestObstacleY = ob.rect.top;
                }
            }

            float requiredY = nearestObstacleY - minSeparationY;
            float maxY = -h;
            float minY = requiredY;

            float y;
            if (minY < maxY) {
                y = rand.nextInt(Math.max(1, (int) (maxY - minY))) + minY;
            } else {
                y = -rand.nextInt(800) - h;
            }

            float x = roadLeft + rand.nextInt(Math.max(1, (int) (roadRight - roadLeft - w)));

            RectF r = new RectF(x, y, x + w, y + h);

            Bitmap selectedImage;
            if (rand.nextBoolean()) {
                selectedImage = obstaclePersonBitmap;
            } else {
                selectedImage = obstacleAnimalBitmap;
            }

            obstacles.add(new Obstacle(r, selectedImage));
        }

        @Override
        public void surfaceCreated(SurfaceHolder holder) {
            running = true;
            thread = new Thread(this);
            thread.start();
        }

        @Override
        public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
            screenW = width;
            screenH = height;
            carW = Math.max(120, screenW / 8f);
            carH = carW / 2f;
            carX = screenW / 2f - carW / 2f;
            carY = screenH - carH - 220;
        }

        @Override
        public void surfaceDestroyed(SurfaceHolder holder) {
            running = false;
            try {
                if (thread != null) thread.join();
            } catch (InterruptedException ignored) {
            }
        }

        @Override
        public void run() {
            long lastTime = System.currentTimeMillis();

            while (running) {
                if (!holder.getSurface().isValid()) continue;

                long now = System.currentTimeMillis();
                float dt = (now - lastTime) / 16f;
                lastTime = now;

                update(dt);
                drawFrame();

                try {
                    Thread.sleep(16);
                } catch (InterruptedException ignored) {
                }
            }
        }

        private void update(float dt) {
            for (Obstacle ob : obstacles) {
                if (!ob.active) continue;
                ob.rect.offset(0, carSpeed * dt);
            }

            List<Obstacle> rem = new CopyOnWriteArrayList<>();
            for (Obstacle ob : obstacles) {
                if (ob.rect.top > screenH) {
                    if (!ob.passed) {
                        passedObstacles++;
                        ob.passed = true;

                        if (passedObstacles >= 5) {
                            passedObstacles = 0;
                            pause();
                            uiHandler.post(this::showQuestionDialog);
                            return;
                        }
                    }
                    rem.add(ob);
                }
            }
            for (Obstacle r : rem) {
                obstacles.remove(r);
            }

            if (obstacles.size() < 4) {
                spawnObstacle();
            }

            RectF carRect = new RectF(carX, carY, carX + carW, carY + carH);
            for (Obstacle ob : obstacles) {
                if (ob.active && RectF.intersects(carRect, ob.rect)) {
                    ob.active = false;
                    pause();
                    uiHandler.post(() -> showCrashDialog());
                    break;
                }
            }
        }

        private void drawFrame() {
            Canvas c = holder.lockCanvas();
            if (c == null) return;

            c.drawColor(Color.rgb(135, 206, 235)); // Parlak Gökyüzü Mavisi (Arka plan)
            float grassWidth = 80;

            paintGrass.setColor(Color.rgb(100, 220, 100));
            c.drawRect(0, 0, grassWidth, screenH, paintGrass);
            c.drawRect(screenW - grassWidth, 0, screenW, screenH, paintGrass);

            paintTrack.setColor(Color.rgb(60, 60, 60)); // Koyu Gri Yol
            float left = grassWidth, right = screenW - grassWidth;
            c.drawRect(left, 0, right, screenH, paintTrack); // Düzeltilmiş çizim

            paintText.setColor(Color.WHITE);
            for (int y = 0; y < screenH; y += 90)
                c.drawRect(screenW / 2f - 6, y, screenW / 2f + 6, y + 40, paintText); // Yol Şeritleri

            // Engelleri yuvarlak çizme
            for (Obstacle ob : obstacles) {
                if (!ob.active) continue;

                if (ob.image != null) {
                    int layerId = c.saveLayer(ob.rect, null, Canvas.ALL_SAVE_FLAG);

                    c.drawOval(ob.rect, bitmapPaint);

                    // roundPaint içinde SRC_IN xfermode ayarlı
                    c.drawBitmap(ob.image, null, ob.rect, roundPaint);

                    c.restoreToCount(layerId);

                } else {
                    paintObstacle.setColor(Color.YELLOW);
                    c.drawOval(ob.rect, paintObstacle); // Yuvarlak engel
                }
            }

            // Vektörel araba çizimi
            drawCar(c);

            paintText.setColor(Color.WHITE);
            paintText.setTextSize(54);
            c.drawText("Score: " + score, 40, 100, paintText);
            c.drawText("Passed: " + passedObstacles + "/5", 40, 160, paintText);

            holder.unlockCanvasAndPost(c);
        }

        // GÜNCELLENDİ: Daha estetik, vektörel çizimle araba çizme (Bitmap bağımlılığı yok)
        private void drawCar(Canvas c) {
            RectF destRect = new RectF(carX, carY, carX + carW, carY + carH);

            float cornerRadius = carH / 4f; // Arabanın yuvarlak köşeleri için yarıçap

            // ------------------------------------------------
            // 1. GÖVDE (Body) - Parlak Kırmızı
            // ------------------------------------------------
            paintCar.setXfermode(null);
            paintCar.setColor(Color.parseColor("#E53935")); // Parlak Kırmızı
            c.drawRoundRect(destRect, cornerRadius, cornerRadius, paintCar);

            // ------------------------------------------------
            // 2. GÖLGELENDİRME (Shadow/3D Effect) - Koyu Kırmızı
            // ------------------------------------------------
            Paint shadowPaint = new Paint(paintCar);
            shadowPaint.setColor(Color.parseColor("#B71C1C")); // Koyu Kırmızı
            RectF shadowRect = new RectF(carX, carY + carH * 0.65f, carX + carW, carY + carH);
            // Sadece alt kısımdaki köşeleri yuvarlatmak için
            c.drawRect(shadowRect.left, shadowRect.top, shadowRect.right, shadowRect.bottom - cornerRadius, shadowPaint);
            c.drawRoundRect(shadowRect, cornerRadius, cornerRadius, shadowPaint);


            // ------------------------------------------------
            // 3. KABİN/CAM (Cabin/Window) - Koyu Gri
            // ------------------------------------------------
            Paint windowPaint = new Paint(paintCar);
            windowPaint.setColor(Color.parseColor("#455A64")); // Koyu Mavi Gri
            float cabW = carW * 0.5f;
            float cabH = carH * 0.6f;
            float cabX = carX + (carW - cabW) / 2f;
            float cabY = carY + carH * 0.15f;
            RectF cabRect = new RectF(cabX, cabY, cabX + cabW, cabY + cabH);
            c.drawRoundRect(cabRect, 10, 10, windowPaint);

            // Cam parlaması (Highlight)
            Paint highlightPaint = new Paint(paintCar);
            highlightPaint.setColor(Color.parseColor("#FFFFFF"));
            highlightPaint.setAlpha(150);
            c.drawOval(cabX + 5, cabY + 5, cabX + cabW * 0.3f, cabY + cabH * 0.3f, highlightPaint);


            // ------------------------------------------------
            // 4. TEKERLEKLER (Wheels) - Siyah ve Gri Jant
            // ------------------------------------------------
            Paint wheelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            wheelPaint.setColor(Color.BLACK);

            float wheelRadius = carH / 4f;
            float wheelInset = 10f; // İçeriye çekme miktarı

            // Tekerlekler (Oval)
            c.drawOval(carX - wheelRadius + wheelInset, carY + wheelRadius / 2, carX + wheelRadius + wheelInset, carY + carH - wheelRadius / 2, wheelPaint); // Ön Sol
            c.drawOval(carX + carW - wheelRadius - wheelInset, carY + wheelRadius / 2, carX + carW + wheelRadius - wheelInset, carY + carH - wheelRadius / 2, wheelPaint); // Ön Sağ

            // Jantlar (Gri)
            wheelPaint.setColor(Color.LTGRAY);
            float rimRadius = wheelRadius * 0.5f;
            float rimAdjustment = (wheelRadius - rimRadius);

            c.drawOval(carX - rimRadius + wheelInset + rimAdjustment / 2, carY + wheelRadius / 2 + rimAdjustment / 2, carX + rimRadius + wheelInset - rimAdjustment / 2, carY + carH - wheelRadius / 2 - rimAdjustment / 2, wheelPaint); // Ön Sol Jant
            c.drawOval(carX + carW - rimRadius - wheelInset + rimAdjustment / 2, carY + wheelRadius / 2 + rimAdjustment / 2, carX + carW + rimRadius - wheelInset - rimAdjustment / 2, carY + carH - wheelRadius / 2 - rimAdjustment / 2, wheelPaint); // Ön Sağ Jant

            // ------------------------------------------------
            // 5. FARLAR (Headlights) - Sarımsı Beyaz
            // ------------------------------------------------
            Paint lightPaint = new Paint(paintCar);
            lightPaint.setColor(Color.parseColor("#FFD700")); // Altın Sarısı
            float lightW = carW * 0.1f;
            float lightH = carH * 0.15f;

            // Sol Far (Ön köşe)
            c.drawRect(carX + 5, carY + 5, carX + 5 + lightW, carY + 5 + lightH, lightPaint);
            // Sağ Far (Ön köşe)
            c.drawRect(carX + carW - 5 - lightW, carY + 5, carX + carW - 5, carY + 5 + lightH, lightPaint);
        }

        private void checkAnswer(int selectedIndex, EnglishQuestion q) {
            if (selectedIndex == q.correctAnswerIndex) {
                score += 10;
                Toast.makeText(ctx, "✅ Doğru! +10 Puan!", Toast.LENGTH_SHORT).show();
            } else {
                score = Math.max(0, score - 10);
                Toast.makeText(ctx, "❌ Yanlış! -10 Puan! Doğru cevap: " + q.options[q.correctAnswerIndex], Toast.LENGTH_LONG).show();
                mistakes++;
            }
            uiHandler.post(() -> resume());
        }

        private void showQuestionDialog() {
            final EnglishQuestion q = getRandomQuestion();
            if (q == null) {
                showGameOverDialog(true);
                return;
            }

            AlertDialog.Builder b = new AlertDialog.Builder(ctx, AlertDialog.THEME_HOLO_LIGHT);
            b.setTitle("❓ BİLGİ TESTİ");


            String fullMessage = "5 ENGEL GEÇİLDİ!\n\nSORU: " + q.question;
            SpannableString spannableMessage = new SpannableString(fullMessage);

            int startIndex = fullMessage.indexOf("SORU: ");

            if (startIndex != -1) {
                // Kırmızı yapmak istediğimiz kısmın başlangıcı (SORU: 'nun başladığı yer)
                int spanStart = startIndex;

                // Kırmızı yapmak istediğimiz kısmın bitişi:
                // Metnin sonuna kadar gitmek için fullMessage'ın toplam uzunluğunu kullanıyoruz.
                int spanEnd = fullMessage.length();

                // Soru metnini Kırmızı renkte vurgula
                spannableMessage.setSpan(new ForegroundColorSpan(Color.RED),
                        spanStart,
                        spanEnd,
                        Spannable.SPAN_EXCLUSIVE_EXCLUSIVE);
            }

            // UNUTMAYIN: Bu spannableMessage'ı TextView'inize atamalısınız.
            b.setMessage(spannableMessage);

            b.setCancelable(false);

            final RadioGroup radioGroup = new RadioGroup(ctx);
            radioGroup.setOrientation(LinearLayout.VERTICAL);

            int[][] states = new int[][]{
                    new int[]{android.R.attr.state_checked},
                    new int[]{-android.R.attr.state_checked}
            };

            int[] colors = new int[]{
                    Color.parseColor("#4CAF50"), // Yeşil
                    Color.GRAY
            };

            final ColorStateList colorStateList = new ColorStateList(states, colors);


            for (int i = 0; i < q.options.length; i++) {
                RadioButton rb = new RadioButton(ctx);
                rb.setText(getOptionLetter(i) + ") " + q.options[i]);
                rb.setId(i);
                rb.setTextColor(Color.BLACK);
                CompoundButtonCompat.setButtonTintList(rb, colorStateList);
                radioGroup.addView(rb);
            }

            radioGroup.setPadding(40, 20, 40, 20);
            b.setView(radioGroup);

            b.setPositiveButton("✅ CEVAPLA", (dialog, which) -> {
            });

            final AlertDialog dialog = b.create();
            dialog.show();

            // Negative butonu, pozitif butonu tanımlandıktan sonra eklenmeli
            dialog.setButton(AlertDialog.BUTTON_NEGATIVE, "↪️ OYUNA DEVAM ET", (d, w) -> {
                d.dismiss();
                uiHandler.post(() -> resume());
            });

            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                int selectedId = radioGroup.getCheckedRadioButtonId();
                if (selectedId != -1) {
                    checkAnswer(selectedId, q);
                    dialog.dismiss();
                } else {
                    Toast.makeText(ctx, "Lütfen bir şık seçimi yapın!", Toast.LENGTH_SHORT).show();
                }
            });
        }

        private char getOptionLetter(int index) {
            return (char) ('A' + index);
        }

        private void showCrashDialog() {
            mistakes++;
            try {
                Vibrator v = (Vibrator) ctx.getSystemService(Context.VIBRATOR_SERVICE);
                if (v != null) v.vibrate(100);
            } catch (Exception ignored) {
            }

            showGameOverDialog(false);
        }

        private void showGameOverDialog(boolean victory) {
            String title = victory ? "🏆 OYUN BİTTİ (TEBRİKLER!)" : "💥 GAME OVER: ENGELE ÇARPTIN!";
            String message = "Toplam Skorunuz: " + score + "\n\nTekrar denemek ister misiniz?";

            AlertDialog.Builder b = new AlertDialog.Builder(ctx, AlertDialog.THEME_HOLO_LIGHT);
            b.setTitle(title);
            b.setMessage(message);
            b.setCancelable(false);

            b.setPositiveButton("🔄 TEKRAR DENE", (d, w) -> resetGame());
            b.setNegativeButton("🚪 ÇIKIŞ YAP", (d, w) -> ((AppCompatActivity) ctx).finish());
            b.show();
        }

        private void resetGame() {
            score = 0;
            mistakes = 0;
            passedObstacles = 0;
            carSpeed = 6f;
            obstacles.clear();
            for (int i = 0; i < 3; i++) spawnObstacle();
            resume();
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            float x = event.getX();
            float y = event.getY();

            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    lastTouchTime = System.currentTimeMillis();
                    lastTouchY = y;

                    // Aracı sola veya sağa hareket ettir
                    if (x < screenW / 2f - 10)
                        carX = Math.max(80, carX - 140);
                    else
                        carX = Math.min(screenW - 80 - carW, carX + 140);
                    return true;
                case MotionEvent.ACTION_UP:
                    long dt = System.currentTimeMillis() - lastTouchTime;
                    float dy = lastTouchY - y;
                    // Hızlı yukarı kaydırmayı algıla (Hızlanma için)
                    if (dy > 150 && dt < 400) {
                        carSpeed += 2.5f;
                        uiHandler.postDelayed(() -> carSpeed = Math.max(4f, carSpeed - 2.5f), 800);
                    }
                    return true;
            }
            return super.onTouchEvent(event);
        }

        public void pause() {
            running = false;
        }

        public void resume() {
            if (!running) {
                running = true;
                thread = new Thread(this);
                thread.start();
            }
        }
    }
}