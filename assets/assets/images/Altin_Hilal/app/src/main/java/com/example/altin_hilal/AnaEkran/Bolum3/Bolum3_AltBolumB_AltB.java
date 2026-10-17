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

public class Bolum3_AltBolumB_AltB extends AppCompatActivity {

    private GameView gameView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // activity_bolum1_alt_bolum_calt_b layout'unuzun var olduğunu varsayıyoruz
        setContentView(R.layout.activity_bolum3_alt_bolum_balt_b);

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

        private Paint paintTrack, paintCar, paintObstacle, paintText, paintGrass, paintProjectile;
        private int screenW = 1080, screenH = 1920;
        private float carX, carY, carW = 160, carH = 80;
        private float carSpeed = 6f; // Engellerin aşağı inme hızı
        private float bulletSpeed = 15f; // Mermi hızı

        // Araba çizimi vektörel olduğu için bu null kalacak
        private Bitmap carBitmap = null;
        private Bitmap obstaclePersonBitmap;
        private Bitmap obstacleAnimalBitmap;

        private Paint roundPaint;
        private Paint bitmapPaint;

        // Mermi (Projectile) Sınıfı - Statik olmalı
        private static class Projectile {
            RectF rect;
            boolean active = true;

            Projectile(RectF r) {
                rect = r;
            }
        }

        // Engel (Obstacle) Sınıfı - Statik olmalı
        private static class Obstacle {
            RectF rect;
            boolean active = true; // Vurulmadıysa true
            Bitmap image;

            Obstacle(RectF r, Bitmap img) {
                rect = r;
                image = img;
            }
        }

        // ======================= SORU YAPISI =======================
        // EnglishQuestion sınıfı GameView'in bir parçası olarak tanımlandı.
        private static class EnglishQuestion {
            String question;
            String[] options; // Şıklar
            int correctAnswerIndex; // 0, 1, 2 veya 3

            public EnglishQuestion(String q, String[] opt, int correct) {
                this.question = q;
                this.options = opt;
                this.correctAnswerIndex = correct;
            }
        }

        // Hata Düzeltildi: 'questions' listesi burada tanımlanmalı.
        private final List<EnglishQuestion> questions = new ArrayList<>();

        private final List<Obstacle> obstacles = new CopyOnWriteArrayList<>();
        private final List<Projectile> projectiles = new CopyOnWriteArrayList<>(); // Mermiler için liste

        private final Random rand = new Random();
        private final Handler uiHandler = new Handler(Looper.getMainLooper());
        private final Context ctx;

        private int score = 0;
        private int mistakes = 0;
        private int destroyedTargets = 0; // Yok edilen hedef sayısı (Soru tetikleyicisi)

        private long lastTouchTime = 0;
        private float lastTouchY = 0;
        private long lastShotTime = 0;
        private final long shotCooldown = 150; // Atış bekleme süresi (ms)

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
            paintProjectile = new Paint();

            // Engelleri yuvarlak çizmek için paint ayarları
            roundPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            roundPaint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
            bitmapPaint = new Paint(Paint.ANTI_ALIAS_FLAG);

            // RENK AYARLARI
            paintTrack.setColor(Color.rgb(64, 64, 64)); // Koyu Gri Yol
            paintGrass.setColor(Color.rgb(100, 220, 100)); // Parlak Yeşil Çim
            paintProjectile.setColor(Color.parseColor("#FFFF00")); // Parlak Sarı Mermi
            paintProjectile.setShadowLayer(10, 0, 0, Color.RED); // Ateş efekti

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
            questions.add(new EnglishQuestion("Bir milleti savaş olmaksızın yıkmak isterseniz ne yapmanız gerekir?.\"  ?", new String[]{"Tatil Keyfi", "Para", "İyi Bir Gelecek", "Çıplaklık ve Zina"}, 0));
            questions.add(new EnglishQuestion("İnsan Sonsuz için yaratıldığını düşünürsek Neden genç nesil bu kadar geniş çaplı bir yönlendirmeye maruz bırakılıyor?", new String[]{"Akıldan çok duygu tarafı daha baskındır", "Run", "Beautiful", "Table"}, 2));
            questions.add(new EnglishQuestion("Bu Yönlendirmeyi kullanan Masonlar Hangi Sanatçıları kullanmışlardır?", new String[]{"Britney Spears, Madonna", ".Michael Jackson, Bob marley", "Will Smith, Eminem", "Tupac"}, 1));
            questions.add(new EnglishQuestion("Rapor, medyayı (TV, sinema, müzik) yalnızca eğlence aracı olarak mı görüyor, yoksa 'gizli bir gündemi uygulayan silah' olarak mı tanımlıyor?",
                    new String[]{
                            "Yalnızca eğlence aracı olarak.",
                            "Gizli bir gündemi uygulayan silah olarak.",
                            "Kültürel miras aktarıcısı olarak.",
                            "Sanatsal ifade platformu olarak."}, 1));
            questions.add(new EnglishQuestion("The flight leaves ___ 8:00 AM.", new String[]{"on", "at", "in", "by"}, 1));
            questions.add(new EnglishQuestion("Raporda, Rihanna'nın 'Umbrella' klibi gibi örneklerle, hangi gizli sembollerin kullanıldığı ve bunların neyi temsil ettiği iddia edilir?",
                    new String[]{
                            "Aşkı ve neşeyi temsil eden kalpler.",
                            "Piramit, Üçgen ve Tek Göz sembolleri (Manevi/Şeytani).",
                            "Doğayı temsil eden yapraklar.",
                            "Hızı temsil eden oklar."}, 1));
            questions.add(new EnglishQuestion("Yazıya göre, medya içeriklerinde **Duygusal Manipülasyon** kullanılmasının amacı, izleyicinin hangi yeteneğini geçersiz kılmaktır (bypass etmek)?",
                    new String[]{
                            "Fiziksel gücünü artırmak.",
                            "Rasyonel (Mantıklı) düşünme yeteneğini.",
                            "Hayal kurma yeteneğini.",
                            "Hızlı okuma yeteneğini."}, 1));

        }

        private EnglishQuestion getRandomQuestion() {
            if (questions.isEmpty()) return null;
            return questions.get(rand.nextInt(questions.size()));
        }

        private void loadBitmaps() {
            try {
                // Engellerin var olduğunu varsayarak kaynakları yükle
                // NOT: Bu kısım, R.drawable içinde bu isimde resimlerinizin var olmasına bağlıdır.
                obstaclePersonBitmap = BitmapFactory.decodeResource(ctx.getResources(), R.drawable.obstacle_person);
                obstacleAnimalBitmap = BitmapFactory.decodeResource(ctx.getResources(), R.drawable.obstacle_animal);

            } catch (Exception e) {
                // Kaynaklar bulunamazsa, null olarak kalacaklar
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

        // Yeni: Mermi oluşturma fonksiyonu
        private void createProjectile() {
            long now = System.currentTimeMillis();
            if (now - lastShotTime < shotCooldown) return; // Cooldown kontrolü

            lastShotTime = now;
            float w = 20;
            float h = 40;
            // Mermiyi arabanın ön ortasından başlat
            float x = carX + carW / 2f - w / 2f;
            float y = carY - h;

            RectF r = new RectF(x, y, x + w, y + h);
            projectiles.add(new Projectile(r));
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
            // 1. Engelleri hareket ettir ve kayıp/çarpışma kontrolü yap
            List<Obstacle> remObstacles = new CopyOnWriteArrayList<>();
            RectF carRect = new RectF(carX, carY, carX + carW, carY + carH);

            for (Obstacle ob : obstacles) {
                if (!ob.active) {
                    remObstacles.add(ob);
                    continue; // Vurulmuş engeli hareket ettirme
                }

                ob.rect.offset(0, carSpeed * dt);

                // A) Arabayla çarpışma kontrolü (Game Over)
                if (RectF.intersects(carRect, ob.rect)) {
                    ob.active = false;
                    pause();
                    uiHandler.post(() -> showCrashDialog("ARABA ENGELE ÇARPTI!"));
                    return; // Oyunu durdur
                }

                // B) Engelin alt sınıra ulaşması (Miss/Game Over)
                if (ob.rect.top > screenH) {
                    pause();
                    uiHandler.post(() -> showCrashDialog("HEDEFİ ISKALADIN, OYUN BİTTİ!"));
                    return; // Oyunu durdur
                }
            }
            // Vurulmuş engelleri temizle
            obstacles.removeAll(remObstacles);


            // 2. Mermileri hareket ettir ve ekran dışına çıkanı temizle
            List<Projectile> remProjectiles = new CopyOnWriteArrayList<>();
            for (Projectile p : projectiles) {
                if (!p.active) {
                    remProjectiles.add(p);
                    continue;
                }
                p.rect.offset(0, -bulletSpeed * dt);

                if (p.rect.bottom < 0) {
                    p.active = false; // Ekran dışına çıkan mermiyi pasif yap
                }
            }
            // Pasif mermileri temizle
            projectiles.removeAll(remProjectiles);


            // 3. Mermi-Engel çarpışma kontrolü
            List<Projectile> projectilesToCleanup = new CopyOnWriteArrayList<>();

            for (Projectile p : projectiles) {
                if (!p.active) continue;

                for (Obstacle ob : obstacles) {
                    if (ob.active && RectF.intersects(p.rect, ob.rect)) {
                        // Çarpışma oldu!
                        ob.active = false;      // Engeli yok et
                        p.active = false;       // Mermiyi yok et
                        projectilesToCleanup.add(p); // Mermiyi temizlik listesine ekle

                        score += 10;
                        destroyedTargets++;

                        if (destroyedTargets >= 5) {
                            destroyedTargets = 0;
                            pause();
                            uiHandler.post(this::showQuestionDialog);
                            return;
                        }
                        break; // Bu mermi başka bir engele çarpamaz
                    }
                }
            }
            projectiles.removeAll(projectilesToCleanup); // Mermileri temizle

            // 4. Yeni engel oluştur
            if (obstacles.size() < 4) {
                spawnObstacle();
            }
        }

        private void drawFrame() {
            Canvas c = holder.lockCanvas();
            if (c == null) return;

            // Arka Plan ve Yol Çizimi
            c.drawColor(Color.rgb(135, 206, 235)); // Gökyüzü Mavisi
            float grassWidth = 80;

            paintGrass.setColor(Color.rgb(100, 220, 100)); // Çim
            c.drawRect(0, 0, grassWidth, screenH, paintGrass);
            c.drawRect(screenW - grassWidth, 0, screenW, screenH, paintGrass);

            paintTrack.setColor(Color.rgb(60, 60, 60)); // Koyu Gri Yol
            float left = grassWidth, right = screenW - grassWidth;
            c.drawRect(left, 0, right, screenH, paintTrack);

            paintText.setColor(Color.WHITE);
            for (int y = 0; y < screenH; y += 90)
                c.drawRect(screenW / 2f - 6, y, screenW / 2f + 6, y + 40, paintText); // Yol Şeritleri

            // Mermileri Çiz
            paintProjectile.setColor(Color.parseColor("#FFFF00"));
            for (Projectile p : projectiles) {
                if (p.active) {
                    c.drawRect(p.rect, paintProjectile);
                }
            }

            // Engelleri Çiz
            for (Obstacle ob : obstacles) {
                if (!ob.active) continue;

                if (ob.image != null) {
                    int layerId = c.saveLayer(ob.rect, null, Canvas.ALL_SAVE_FLAG);
                    c.drawOval(ob.rect, bitmapPaint);

                    // Engeli yuvarlak bir şekilde çizmek için resim boyutunu ayarla
                    Bitmap scaledImage = Bitmap.createScaledBitmap(ob.image, (int) ob.rect.width(), (int) ob.rect.height(), true);
                    c.drawBitmap(scaledImage, ob.rect.left, ob.rect.top, roundPaint);

                    c.restoreToCount(layerId);
                } else {
                    paintObstacle.setColor(Color.YELLOW);
                    c.drawOval(ob.rect, paintObstacle);
                }
            }

            // Vektörel araba çizimi
            drawCar(c);

            // Skor ve Hedef Bilgisi
            paintText.setColor(Color.WHITE);
            paintText.setTextSize(54);
            c.drawText("SKOR: " + score, 40, 100, paintText);
            c.drawText("HEDEF: " + destroyedTargets + "/5", 40, 160, paintText);

            holder.unlockCanvasAndPost(c);
        }

        private void drawCar(Canvas c) {
            RectF destRect = new RectF(carX, carY, carX + carW, carY + carH);

            float cornerRadius = carH / 4f;

            // 1. GÖVDE (Body) - Parlak Kırmızı
            paintCar.setXfermode(null);
            paintCar.setColor(Color.parseColor("#E53935"));
            c.drawRoundRect(destRect, cornerRadius, cornerRadius, paintCar);

            // 2. GÖLGELENDİRME
            Paint shadowPaint = new Paint(paintCar);
            shadowPaint.setColor(Color.parseColor("#B71C1C"));
            RectF shadowRect = new RectF(carX, carY + carH * 0.65f, carX + carW, carY + carH);
            c.drawRect(shadowRect.left, shadowRect.top, shadowRect.right, shadowRect.bottom - cornerRadius, shadowPaint);
            c.drawRoundRect(shadowRect, cornerRadius, cornerRadius, shadowPaint);

            // 3. KABİN/CAM (Cabin/Window)
            Paint windowPaint = new Paint(paintCar);
            windowPaint.setColor(Color.parseColor("#455A64"));
            float cabW = carW * 0.5f;
            float cabH = carH * 0.6f;
            float cabX = carX + (carW - cabW) / 2f;
            float cabY = carY + carH * 0.15f;
            RectF cabRect = new RectF(cabX, cabY, cabX + cabW, cabY + cabH);
            c.drawRoundRect(cabRect, 10, 10, windowPaint);

            // Cam parlaması
            Paint highlightPaint = new Paint(paintCar);
            highlightPaint.setColor(Color.parseColor("#FFFFFF"));
            highlightPaint.setAlpha(150);
            c.drawOval(cabX + 5, cabY + 5, cabX + cabW * 0.3f, cabY + cabH * 0.3f, highlightPaint);

            // 4. TEKERLEKLER (Wheels)
            Paint wheelPaint = new Paint(Paint.ANTI_ALIAS_FLAG);
            wheelPaint.setColor(Color.BLACK);
            float wheelRadius = carH / 4f;
            float wheelInset = 10f;

            c.drawOval(carX - wheelRadius + wheelInset, carY + wheelRadius / 2, carX + wheelRadius + wheelInset, carY + carH - wheelRadius / 2, wheelPaint);
            c.drawOval(carX + carW - wheelRadius - wheelInset, carY + wheelRadius / 2, carX + carW + wheelRadius - wheelInset, carY + carH - wheelRadius / 2, wheelPaint);

            // Jantlar (Gri)
            wheelPaint.setColor(Color.LTGRAY);
            float rimRadius = wheelRadius * 0.5f;
            float rimAdjustment = (wheelRadius - rimRadius);

            c.drawOval(carX - rimRadius + wheelInset + rimAdjustment / 2, carY + wheelRadius / 2 + rimAdjustment / 2, carX + rimRadius + wheelInset - rimAdjustment / 2, carY + carH - wheelRadius / 2 - rimAdjustment / 2, wheelPaint);
            c.drawOval(carX + carW - rimRadius - wheelInset + rimAdjustment / 2, carY + wheelRadius / 2 + rimAdjustment / 2, carX + carW + rimRadius - wheelInset - rimAdjustment / 2, carY + carH - wheelRadius / 2 - rimAdjustment / 2, wheelPaint);

            // 5. FARLAR (Headlights)
            Paint lightPaint = new Paint(paintCar);
            lightPaint.setColor(Color.parseColor("#FFD700"));
            float lightW = carW * 0.1f;
            float lightH = carH * 0.15f;

            c.drawRect(carX + 5, carY + 5, carX + 5 + lightW, carY + 5 + lightH, lightPaint);
            c.drawRect(carX + carW - 5 - lightW, carY + 5, carX + carW - 5, carY + 5 + lightH, lightPaint);
        }

        private void checkAnswer(int selectedIndex, EnglishQuestion q) {
            if (selectedIndex == q.correctAnswerIndex) {
                score += 50; // Soru bilince daha çok puan
                Toast.makeText(ctx, "✅ Doğru! +50 Puan!", Toast.LENGTH_SHORT).show();
            } else {
                score = Math.max(0, score - 20);
                Toast.makeText(ctx, "❌ Yanlış! -20 Puan! Doğru cevap: " + q.options[q.correctAnswerIndex], Toast.LENGTH_LONG).show();
                mistakes++;
            }
            uiHandler.post(this::resume);
        }

        private void showQuestionDialog() {
            final EnglishQuestion q = getRandomQuestion();
            if (q == null) {
                showGameOverDialog(true, "SORULAR BİTTİ!");
                return;
            }

            AlertDialog.Builder b = new AlertDialog.Builder(ctx, AlertDialog.THEME_HOLO_LIGHT);
            b.setTitle("❓BİLGİ TESTİ");

            String fullMessage = "5 HEDEF İMHA EDİLDİ!\n\nSORU: " + q.question;
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
                uiHandler.post(this::resume);
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

        private void showCrashDialog(String reason) {
            mistakes++;
            try {
                Vibrator v = (Vibrator) ctx.getSystemService(Context.VIBRATOR_SERVICE);
                if (v != null) v.vibrate(500); // Daha uzun titreme
            } catch (Exception ignored) {
            }

            showGameOverDialog(false, reason);
        }

        private void showGameOverDialog(boolean victory, String reason) {
            String title = victory ? "🏆 OYUN BİTTİ (TEBRİKLER!)" : "💥 GAME OVER: " + reason;
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
            destroyedTargets = 0;
            carSpeed = 6f;
            obstacles.clear();
            projectiles.clear();
            for (int i = 0; i < 3; i++) spawnObstacle();
            resume();
        }

        @Override
        public boolean onTouchEvent(MotionEvent event) {
            float x = event.getX();
            float y = event.getY();

            switch (event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    // Dokunulduğunda Mermi Atma
                    createProjectile();

                    lastTouchTime = System.currentTimeMillis();
                    lastTouchY = y;

                    // Aracı sola veya sağa hareket ettir (Yatay hareket için)
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
                        carSpeed = Math.min(15f, carSpeed + 2.5f);
                        uiHandler.postDelayed(() -> carSpeed = Math.max(6f, carSpeed - 2.5f), 800);
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