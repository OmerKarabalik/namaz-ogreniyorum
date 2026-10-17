package com.example.altin_hilal.AnaEkran.Bolum3;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.altin_hilal.R;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Bolum3_AltBolumB_AltC extends  SurfaceView implements Runnable, SurfaceHolder.Callback {

    // =============== TEMEL OYUN AYARLARI ===============
    private Thread gameThread = null;
    private SurfaceHolder surfaceHolder;
    private volatile boolean isRunning;
    private volatile boolean isGameActive = false; // Oyun başladı mı?
    private volatile boolean isQuizActive = false; // Quiz aktif mi?
    private final int MAX_LIVES = 3;

    // =============== OYUN DURUMU ===============
    private int score = 0;
    private int lives = MAX_LIVES;
    private double gameSpeed = 1.2; // Başlangıç hızı

    // =============== OYUNCU (TEKNE) VE OBJE BOYUTLARI ===============
    private static final int BOAT_WIDTH = 100;
    private static final int BOAT_HEIGHT = 140;
    private static final int OBSTACLE_SIZE = 80;
    private static final int BULLET_WIDTH = 12;
    private static final int BULLET_HEIGHT = 30;

    // =============== GAME OBJE SINIFLARI ===============

    // Tekne Sınıfı
    class Boat {
        int x, y;
        int width, height;

        public Boat(int screenWidth, int screenHeight) {
            this.width = BOAT_WIDTH;
            this.height = BOAT_HEIGHT;
            this.x = screenWidth / 2 - width / 2;
            this.y = screenHeight - height - 50;
        }

        public Rect getRect() {
            return new Rect(x, y, x + width, y + height);
        }
    }

    // Engel Sınıfı (Debris, Mine, Chest)
    class Obstacle {
        int x, y;
        String type; // "debris", "mine", "chest"
        Rect rect;

        public Obstacle(int screenWidth, String type) {
            this.type = type;
            this.rect = new Rect();
            this.x = random.nextInt(screenWidth - OBSTACLE_SIZE);
            this.y = -OBSTACLE_SIZE;
            updateRect();
        }

        public void updateRect() {
            rect.set(x, y, x + OBSTACLE_SIZE, y + OBSTACLE_SIZE);
        }
    }

    // Mermi Sınıfı
    class Bullet {
        int x, y;
        Rect rect;

        public Bullet(int startX, int startY) {
            this.x = startX;
            this.y = startY;
            this.rect = new Rect();
            updateRect();
        }

        public void updateRect() {
            rect.set(x, y, x + BULLET_WIDTH, y + BULLET_HEIGHT);
        }
    }

    // Quiz Sınıfı
    class Quiz {
        String question;
        String correctAnswer;
        String[] options;

        public Quiz(String q, String correct, String[] opts) {
            this.question = q;
            this.correctAnswer = correct;
            this.options = opts;
        }
    }

    // =============== OBJE LİSTELERİ VE ARAÇLAR ===============
    private Boat boat;
    private List<Obstacle> obstacles = new ArrayList<>();
    private List<Bullet> bullets = new ArrayList<>();
    private Random random = new Random();
    private int screenWidth, screenHeight;
    private long lastObstacleTime = 0;
    private final int OBSTACLE_INTERVAL = 700; // ms

    // Boya (Paint) nesneleri
    private Paint paintWater, paintBoat, paintDebris, paintMine, paintChest, paintBullet, paintText, paintQuizBox;

    // Quiz Verileri
    private Quiz currentQuiz = null;
    private final Quiz[] quizData = {
            new Quiz("He decided to give ___ smoking.", "up", new String[]{"up", "in", "off"}),
            new Quiz("If I ___ more time, I would have helped you.", "had", new String[]{"had", "have", "would have"}),
            new Quiz("What does 'look forward to' mean?", "Sabırsızlıkla beklemek", new String[]{"Gözetmek", "Sabırsızlıkla beklemek", "Araştırmak"}),
            new Quiz("If the sun ___, the snow melts. (Type 0 Conditional)", "shines", new String[]{"shines", "shone", "will shine"}),
            new Quiz("They had to call ___ the meeting.", "off", new String[]{"off", "up", "out"}),
    };

    // =============== KURUCU METOTLAR ===============

    public Bolum3_AltBolumB_AltC(Context context, AttributeSet attrs) {
        super(context, attrs);
        surfaceHolder = getHolder();
        surfaceHolder.addCallback(this);
        initPaints();
    }

    private void initPaints() {
        paintWater = new Paint();
        paintWater.setColor(Color.parseColor("#0077b6")); // Okyanus Mavisi

        paintBoat = new Paint();
        paintBoat.setColor(Color.parseColor("#3498db")); // Tekne Rengi

        paintDebris = new Paint();
        paintDebris.setColor(Color.parseColor("#8B4513")); // Kütük/Debris Kahverengi

        paintMine = new Paint();
        paintMine.setColor(Color.parseColor("#cc0000")); // Mayın Kırmızı

        paintChest = new Paint();
        paintChest.setColor(Color.parseColor("#ffcc00")); // Hazine Sandığı Sarı

        paintBullet = new Paint();
        paintBullet.setColor(Color.WHITE);

        paintText = new Paint();
        paintText.setColor(Color.WHITE);
        paintText.setTextSize(50);
        paintText.setTextAlign(Paint.Align.CENTER);

        paintQuizBox = new Paint();
        paintQuizBox.setColor(Color.parseColor("#44000000")); // Yarı şeffaf siyah
    }

    // =============== OYUN DÖNGÜSÜ YÖNETİMİ ===============

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        // Ekran boyutlarını al
        screenWidth = getWidth();
        screenHeight = getHeight();

        // Oyunu ilk kez başlat
        startGame();
    }

    @Override
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        // Yeniden boyutlandırma
        screenWidth = width;
        screenHeight = height;
        if (boat != null) {
            boat.x = screenWidth / 2 - boat.width / 2;
            boat.y = screenHeight - boat.height - 50;
        }
    }

    @Override
    public void surfaceDestroyed(SurfaceHolder holder) {
        pauseGameThread();
    }

    public void pauseGameThread() {
        boolean retry = true;
        isRunning = false;
        while (retry) {
            try {
                // Thread'in güvenli bir şekilde sonlanmasını bekle
                if (gameThread != null) {
                    gameThread.join();
                }
                retry = false;
            } catch (InterruptedException e) {
                // Tekrar dene
                Thread.currentThread().interrupt();
            }
        }
        gameThread = null;
    }

    public void resumeGameThread() {
        if (!isRunning && screenWidth > 0) {
            isRunning = true;
            gameThread = new Thread(this);
            gameThread.start();
        }
    }

    @Override
    public void run() {
        while (isRunning) {
            long startTime = System.currentTimeMillis();

            if (isGameActive && !isQuizActive) {
                update();
            }
            draw();

            long timeMillis = System.currentTimeMillis() - startTime;
            long waitTime = 1000 / 60 - timeMillis; // 60 FPS hedefi

            try {
                if (waitTime > 0) {
                    Thread.sleep(waitTime);
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
            }
        }
    }

    // =============== OYUN BAŞLATMA VE SIFIRLAMA ===============

    public void startGame() {
        score = 0;
        lives = MAX_LIVES;
        gameSpeed = 1.2;
        obstacles.clear();
        bullets.clear();
        isQuizActive = false;

        // Boat objesini başlat
        if (screenWidth > 0 && screenHeight > 0) {
            boat = new Boat(screenWidth, screenHeight);
            isGameActive = true;
        } else {
            // SurfaceView henüz hazır değil, bekleniyor.
            isGameActive = false;
        }

        // Oyun döngüsünü başlat (Eğer durmuşsa)
        if (gameThread == null || !gameThread.isAlive()) {
            resumeGameThread();
        }
    }

    // =============== GÜNCELLEME (UPDATE) MANTIĞI ===============

    private void update() {
        // Engel Yaratma
        long now = System.currentTimeMillis();
        if (now - lastObstacleTime > OBSTACLE_INTERVAL / gameSpeed) {
            generateObstacle();
            lastObstacleTime = now;
        }

        // Engelleri ve Çarpışmaları Güncelle
        for (int i = obstacles.size() - 1; i >= 0; i--) {
            Obstacle obs = obstacles.get(i);
            obs.y += 5 * gameSpeed;
            obs.updateRect();

            // Tekne ile çarpışma (Mine ve Debris)
            if (obs.type.equals("mine") || obs.type.equals("debris")) {
                if (Rect.intersects(obs.rect, boat.getRect())) {
                    if (obs.type.equals("mine")) {
                        lives--;
                    } else if (obs.type.equals("debris")) {
                        // Debris (Kütük) toplama: Hafif puan, can kaybı yok.
                        // Kullanıcının orijinal kodunda debris çarptığında can gitmiyor, puan veriliyor.
                        score += 5;
                    }
                    obstacles.remove(i);
                    checkGameOver();
                    continue;
                }
            }

            // Ekran dışına çıkanları sil
            if (obs.y > screenHeight) {
                obstacles.remove(i);
            }
        }

        // Mermileri ve Çarpışmaları Güncelle (Chest için)
        for (int i = bullets.size() - 1; i >= 0; i--) {
            Bullet bullet = bullets.get(i);
            bullet.y -= 15;
            bullet.updateRect();

            boolean hit = false;
            for (int j = obstacles.size() - 1; j >= 0; j--) {
                Obstacle obs = obstacles.get(j);
                if (obs.type.equals("chest") && Rect.intersects(bullet.rect, obs.rect)) {
                    score += 20;
                    obstacles.remove(j);
                    bullets.remove(i);
                    startQuiz();
                    hit = true;
                    break;
                }
            }

            if (hit) continue;

            // Ekran dışına çıkanları sil
            if (bullet.y < 0) {
                bullets.remove(i);
            }
        }

        // Oyun Hızını Artır
        gameSpeed += 0.0001;
    }

    private void checkGameOver() {
        if (lives <= 0) {
            isGameActive = false;
        }
    }

    private void generateObstacle() {
        String type;
        double chance = random.nextDouble();

        if (chance < 0.60) type = "debris";
        else if (chance < 0.85) type = "mine";
        else type = "chest";

        obstacles.add(new Obstacle(screenWidth, type));
    }

    private void shoot() {
        if (!isGameActive || isQuizActive || boat == null) return;
        bullets.add(new Bullet(
                boat.x + boat.width / 2 - BULLET_WIDTH / 2,
                boat.y
        ));
    }

    // =============== ÇİZİM (DRAW) MANTIĞI ===============

    private void draw() {
        if (surfaceHolder.getSurface().isValid()) {
            Canvas canvas = surfaceHolder.lockCanvas();
            if (canvas != null) {
                // 1. Okyanus Arka Planı
                canvas.drawColor(paintWater.getColor());

                // 2. Engelleri Çiz
                for (Obstacle obs : obstacles) {
                    drawObstacle(canvas, obs);
                }

                // 3. Mermileri Çiz
                for (Bullet bullet : bullets) {
                    drawBullet(canvas, bullet);
                }

                // 4. Tekneyi Çiz (Sadece oyun aktifse)
                if (boat != null) {
                    drawBoat(canvas, boat);
                }

                // 5. HUD (Skor, Can, Hız)
                drawHUD(canvas);

                // 6. Modal / Durum Mesajları
                if (isQuizActive) {
                    drawQuiz(canvas);
                } else if (!isGameActive) {
                    drawGameOver(canvas);
                }

                surfaceHolder.unlockCanvasAndPost(canvas);
            }
        }
    }

    private void drawBoat(Canvas canvas, Boat b) {
        // Tekne Gövdesi (Basit dikdörtgen)
        Paint p = new Paint(paintBoat);
        p.setColor(Color.parseColor("#3498db"));
        canvas.drawRect(b.getRect(), p);

        // Kabin/Güverte (Basit dikdörtgen)
        p.setColor(Color.parseColor("#f39c12"));
        // Tekne üst kısmının boyutunu ve konumunu ayarla
        canvas.drawRect(b.x + b.width / 4, b.y + b.height / 4,
                b.x + b.width * 3 / 4, b.y + b.height / 2, p);
    }

    private void drawObstacle(Canvas canvas, Obstacle obs) {
        Paint p = new Paint();
        p.setStyle(Paint.Style.FILL);

        if (obs.type.equals("debris")) {
            p.setColor(paintDebris.getColor());
            canvas.drawRect(obs.rect, p); // Kütük/Odun
        } else if (obs.type.equals("mine")) {
            p.setColor(paintMine.getColor());
            canvas.drawCircle(obs.rect.centerX(), obs.rect.centerY(), OBSTACLE_SIZE / 2, p); // Mayın
            // Üçgen çıkıntılar (Basit mayın görünümü)
            p.setColor(Color.BLACK);
            canvas.drawPoint(obs.rect.left, obs.rect.top, p);
            canvas.drawPoint(obs.rect.right, obs.rect.top, p);
            canvas.drawPoint(obs.rect.centerX(), obs.rect.bottom, p);
        } else if (obs.type.equals("chest")) {
            p.setColor(paintChest.getColor());
            canvas.drawRect(obs.rect, p); // Hazine Sandığı
            p.setColor(Color.parseColor("#b38f00")); // Kilit
            canvas.drawRect(obs.rect.left + OBSTACLE_SIZE * 0.4f, obs.rect.top + OBSTACLE_SIZE * 0.3f,
                    obs.rect.left + OBSTACLE_SIZE * 0.6f, obs.rect.top + OBSTACLE_SIZE * 0.5f, p);
        }
    }

    private void drawBullet(Canvas canvas, Bullet bullet) {
        canvas.drawRect(bullet.rect, paintBullet);
    }

    private void drawHUD(Canvas canvas) {
        // Can, Skor ve Hız Bilgisi
        String statusText = String.format("SKOR: %d | CAN: %d | HIZ: %.1f", score, lives, gameSpeed);

        // Arka plan kutusu
        paintQuizBox.setColor(Color.parseColor("#88000000"));
        canvas.drawRect(0, 0, screenWidth, 80, paintQuizBox);

        // Metin
        paintText.setTextAlign(Paint.Align.LEFT);
        paintText.setTextSize(35);
        paintText.setColor(Color.WHITE);
        canvas.drawText(statusText, 20, 50, paintText);
        paintText.setTextAlign(Paint.Align.CENTER); // Varsayılana geri dön
    }

    // =============== OYUN SONU VE QUIZ ÇİZİMİ ===============

    private void drawGameOver(Canvas canvas) {
        // Yarı saydam siyah arka plan
        canvas.drawRect(0, 0, screenWidth, screenHeight, paintQuizBox);

        paintText.setTextSize(80);
        paintText.setColor(Color.RED);
        canvas.drawText("OYUN BİTTİ!", screenWidth / 2, screenHeight / 2 - 100, paintText);

        paintText.setTextSize(60);
        paintText.setColor(Color.YELLOW);
        canvas.drawText("Skorunuz: " + score, screenWidth / 2, screenHeight / 2, paintText);

        paintText.setTextSize(50);
        paintText.setColor(Color.WHITE);
        canvas.drawText("Yeniden Başlamak İçin Dokunun", screenWidth / 2, screenHeight / 2 + 100, paintText);
    }

    private void startQuiz() {
        if (quizData.length > 0) {
            // Rastgele bir quiz seç
            currentQuiz = quizData[random.nextInt(quizData.length)];
            isQuizActive = true;
        } else {
            isQuizActive = false;
        }
    }

    private void drawQuiz(Canvas canvas) {
        if (currentQuiz == null) return;

        // Yarı saydam siyah arka plan
        canvas.drawRect(0, 0, screenWidth, screenHeight, paintQuizBox);

        // Quiz Kutusu
        paintQuizBox.setColor(Color.parseColor("#e6ffffff")); // Açık gri kutu
        int boxWidth = screenWidth - 100;
        int boxLeft = 50;
        int boxTop = screenHeight / 4;
        int boxBottom = boxTop + screenHeight / 2;
        canvas.drawRect(boxLeft, boxTop, boxLeft + boxWidth, boxBottom, paintQuizBox);

        // Başlık
        paintText.setTextSize(50);
        paintText.setColor(Color.BLACK);
        canvas.drawText("Hazine Sandığı Bulundu!", screenWidth / 2, boxTop + 70, paintText);

        // Soru
        paintText.setTextSize(40);
        canvas.drawText(currentQuiz.question, screenWidth / 2, boxTop + 150, paintText);

        // Basitleştirilmiş Talimat
        paintText.setTextSize(30);
        paintText.setColor(Color.RED);
        canvas.drawText("Cevaplamak için Ekrana Tekrar Dokunun (Demo)", screenWidth / 2, boxBottom - 50, paintText);
    }

    // QUIZ: Basitleştirilmiş Cevaplama Mantığı
    private void answerQuiz(boolean isCorrect) {
        if (isCorrect) {
            score += 100;
        } else {
            lives--;
            score = Math.max(0, score - 30);
        }
        isQuizActive = false;
        checkGameOver();
    }

    // =============== ETKİLEŞİM (TOUCH) MANTIĞI ===============

    private float lastTouchX;
    private final float TOUCH_SENSITIVITY = 1.0f;

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (!isGameActive) {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                startGame(); // Oyun bittiyse dokunarak yeniden başlat
            }
            return true;
        }

        if (isQuizActive) {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                // Quiz'de dokunma: Demo için rastgele %50 doğru/yanlış cevap verelim
                answerQuiz(random.nextBoolean());
            }
            return true;
        }

        // Normal Oyun Kontrolü
        switch (event.getAction()) {
            case MotionEvent.ACTION_DOWN:
                lastTouchX = event.getX();
                // Tekne alanına yakınsa ateş et (Teknenin hemen üstüne dokununca)
                if (boat != null && event.getY() > boat.y) {
                    shoot();
                }
                break;
            case MotionEvent.ACTION_MOVE:
                float currentX = event.getX();
                float deltaX = currentX - lastTouchX;

                // Tekneyi hareket ettir
                if (boat != null) {
                    boat.x += deltaX * TOUCH_SENSITIVITY;
                    // Sınır kontrolü
                    boat.x = Math.max(0, boat.x);
                    boat.x = Math.min(screenWidth - boat.width, boat.x);
                }

                lastTouchX = currentX;
                break;
            case MotionEvent.ACTION_UP:
                // Parmak kalktı
                break;
        }
        return true;
    }
}