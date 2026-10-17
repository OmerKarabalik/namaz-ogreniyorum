package com.example.altin_hilal.AnaEkran.Bolum3;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Bolum3_AltBolumB_AltC_View extends SurfaceView implements Runnable, SurfaceHolder.Callback {

    private Thread gameThread = null;
    private SurfaceHolder surfaceHolder;
    private volatile boolean isRunning;
    private volatile boolean isGameActive = false;
    private volatile boolean isQuizActive = false;
    private final int MAX_LIVES = 3;

    private int score = 0;
    private int lives = MAX_LIVES;
    private double gameSpeed = 1.2;

    private static final int BOAT_WIDTH = 100;
    private static final int BOAT_HEIGHT = 140;
    private static final int OBSTACLE_SIZE = 80;
    private static final int BULLET_WIDTH = 12;
    private static final int BULLET_HEIGHT = 30;

    // İç Sınıflar (Boat, Obstacle, Bullet, Quiz)
    class Boat {
        int x, y, width, height;
        public Boat(int sw, int sh) {
            this.width = BOAT_WIDTH; this.height = BOAT_HEIGHT;
            this.x = sw / 2 - width / 2; this.y = sh - height - 50;
        }
        public Rect getRect() { return new Rect(x, y, x + width, y + height); }
    }

    class Obstacle {
        int x, y; String type; Rect rect;
        public Obstacle(int sw, String type) {
            this.type = type; this.rect = new Rect();
            this.x = random.nextInt(sw - OBSTACLE_SIZE); this.y = -OBSTACLE_SIZE;
            updateRect();
        }
        public void updateRect() { rect.set(x, y, x + OBSTACLE_SIZE, y + OBSTACLE_SIZE); }
    }

    class Bullet {
        int x, y; Rect rect;
        public Bullet(int sx, int sy) {
            this.x = sx; this.y = sy; this.rect = new Rect();
            updateRect();
        }
        public void updateRect() { rect.set(x, y, x + BULLET_WIDTH, y + BULLET_HEIGHT); }
    }

    class Quiz {
        String question, correctAnswer; String[] options;
        public Quiz(String q, String c, String[] o) {
            this.question = q; this.correctAnswer = c; this.options = o;
        }
    }

    private Boat boat;
    private List<Obstacle> obstacles = new ArrayList<>();
    private List<Bullet> bullets = new ArrayList<>();
    private Random random = new Random();
    private int screenWidth, screenHeight;
    private long lastObstacleTime = 0;
    private final int OBSTACLE_INTERVAL = 700;

    private Paint paintWater, paintBoat, paintDebris, paintMine, paintChest, paintBullet, paintText, paintQuizBox;

    private Quiz currentQuiz = null;
    private final Quiz[] quizData = {
            new Quiz("He decided to give ___ smoking.", "up", new String[]{"up", "in", "off"}),
            new Quiz("If I ___ more time, I would have helped you.", "had", new String[]{"had", "have", "would have"}),
            new Quiz("What does 'look forward to' mean?", "Sabırsızlıkla beklemek", new String[]{"Gözetmek", "Sabırsızlıkla beklemek", "Araştırmak"}),
            new Quiz("If the sun ___, the snow melts.", "shines", new String[]{"shines", "shone", "will shine"}),
            new Quiz("They had to call ___ the meeting.", "off", new String[]{"off", "up", "out"}),
    };

    public Bolum3_AltBolumB_AltC_View(Context context) {
        super(context);
        surfaceHolder = getHolder();
        surfaceHolder.addCallback(this);
        initPaints();
    }

    private void initPaints() {
        paintWater = new Paint(); paintWater.setColor(Color.parseColor("#0077b6"));
        paintBoat = new Paint(); paintBoat.setColor(Color.parseColor("#3498db"));
        paintDebris = new Paint(); paintDebris.setColor(Color.parseColor("#8B4513"));
        paintMine = new Paint(); paintMine.setColor(Color.parseColor("#cc0000"));
        paintChest = new Paint(); paintChest.setColor(Color.parseColor("#ffcc00"));
        paintBullet = new Paint(); paintBullet.setColor(Color.WHITE);
        paintText = new Paint(); paintText.setColor(Color.WHITE); paintText.setTextSize(50); paintText.setTextAlign(Paint.Align.CENTER);
        paintQuizBox = new Paint(); paintQuizBox.setColor(Color.parseColor("#44000000"));
    }

    @Override
    public void surfaceCreated(SurfaceHolder holder) {
        screenWidth = getWidth();
        screenHeight = getHeight();
        startGame();
    }

    @Override
    public void surfaceChanged(SurfaceHolder h, int f, int w, int h1) {}

    @Override
    public void surfaceDestroyed(SurfaceHolder h) { pauseGameThread(); }

    public void pauseGameThread() {
        isRunning = false;
        try { if (gameThread != null) gameThread.join(); } catch (InterruptedException e) { e.printStackTrace(); }
        gameThread = null;
    }

    public void resumeGameThread() {
        if (!isRunning) {
            isRunning = true;
            gameThread = new Thread(this);
            gameThread.start();
        }
    }

    @Override
    public void run() {
        while (isRunning) {
            if (isGameActive && !isQuizActive) update();
            draw();
            try { Thread.sleep(16); } catch (InterruptedException e) {}
        }
    }

    public void startGame() {
        score = 0; lives = MAX_LIVES; gameSpeed = 1.2;
        obstacles.clear(); bullets.clear();
        isQuizActive = false;
        if (screenWidth > 0) {
            boat = new Boat(screenWidth, screenHeight);
            isGameActive = true;
        }
        resumeGameThread();
    }

    private void update() {
        long now = System.currentTimeMillis();
        if (now - lastObstacleTime > OBSTACLE_INTERVAL / gameSpeed) {
            generateObstacle(); lastObstacleTime = now;
        }

        for (int i = obstacles.size() - 1; i >= 0; i--) {
            Obstacle obs = obstacles.get(i);
            obs.y += 5 * gameSpeed; obs.updateRect();
            if (Rect.intersects(obs.rect, boat.getRect())) {
                if (obs.type.equals("mine")) lives--;
                else if (obs.type.equals("debris")) score += 5;
                obstacles.remove(i);
                if (lives <= 0) isGameActive = false;
                continue;
            }
            if (obs.y > screenHeight) obstacles.remove(i);
        }

        for (int i = bullets.size() - 1; i >= 0; i--) {
            Bullet b = bullets.get(i); b.y -= 15; b.updateRect();
            for (int j = obstacles.size() - 1; j >= 0; j--) {
                if (obstacles.get(j).type.equals("chest") && Rect.intersects(b.rect, obstacles.get(j).rect)) {
                    score += 20; obstacles.remove(j); bullets.remove(i);
                    startQuiz(); break;
                }
            }
            if (b.y < 0 && i < bullets.size()) bullets.remove(i);
        }
        gameSpeed += 0.0001;
    }

    private void generateObstacle() {
        double chance = random.nextDouble();
        String type = chance < 0.60 ? "debris" : (chance < 0.85 ? "mine" : "chest");
        obstacles.add(new Obstacle(screenWidth, type));
    }

    private void startQuiz() {
        currentQuiz = quizData[random.nextInt(quizData.length)];
        isQuizActive = true;
    }

    private void draw() {
        if (!surfaceHolder.getSurface().isValid()) return;
        Canvas canvas = surfaceHolder.lockCanvas();
        if (canvas != null) {
            canvas.drawColor(paintWater.getColor());
            for (Obstacle o : obstacles) drawObstacle(canvas, o);
            for (Bullet b : bullets) canvas.drawRect(b.rect, paintBullet);
            if (boat != null) canvas.drawRect(boat.getRect(), paintBoat);

            drawHUD(canvas);
            if (isQuizActive) drawQuiz(canvas);
            else if (!isGameActive) drawGameOver(canvas);

            surfaceHolder.unlockCanvasAndPost(canvas);
        }
    }

    private void drawObstacle(Canvas canvas, Obstacle obs) {
        Paint p = new Paint();
        if (obs.type.equals("debris")) { p.setColor(paintDebris.getColor()); canvas.drawRect(obs.rect, p); }
        else if (obs.type.equals("mine")) { p.setColor(paintMine.getColor()); canvas.drawCircle(obs.rect.centerX(), obs.rect.centerY(), OBSTACLE_SIZE / 2, p); }
        else { p.setColor(paintChest.getColor()); canvas.drawRect(obs.rect, p); }
    }

    private void drawHUD(Canvas canvas) {
        paintText.setTextAlign(Paint.Align.LEFT);
        canvas.drawText("SKOR: " + score + " | CAN: " + lives, 20, 60, paintText);
    }

    private void drawGameOver(Canvas canvas) {
        paintText.setTextAlign(Paint.Align.CENTER);
        paintText.setColor(Color.RED); paintText.setTextSize(100);
        canvas.drawText("OYUN BİTTİ", screenWidth / 2, screenHeight / 2, paintText);
    }

    private void drawQuiz(Canvas canvas) {
        paintQuizBox.setColor(Color.WHITE);
        canvas.drawRect(50, screenHeight/4, screenWidth-50, screenHeight*3/4, paintQuizBox);
        paintText.setColor(Color.BLACK); paintText.setTextSize(40);
        canvas.drawText(currentQuiz.question, screenWidth/2, screenHeight/2, paintText);
    }

    private float lastTouchX;
    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (!isGameActive) { if (event.getAction() == MotionEvent.ACTION_DOWN) startGame(); return true; }
        if (isQuizActive) { if (event.getAction() == MotionEvent.ACTION_DOWN) { isQuizActive = false; score += 100; } return true; }

        if (event.getAction() == MotionEvent.ACTION_DOWN) {
            lastTouchX = event.getX();
            if (event.getY() > boat.y) bullets.add(new Bullet(boat.x + boat.width/2, boat.y));
        } else if (event.getAction() == MotionEvent.ACTION_MOVE) {
            boat.x += (event.getX() - lastTouchX);
            boat.x = Math.max(0, Math.min(screenWidth - boat.width, boat.x));
            lastTouchX = event.getX();
        }
        return true;
    }
}