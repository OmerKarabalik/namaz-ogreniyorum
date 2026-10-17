package com.example.altin_hilal.AnaEkran.Bolum3;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;

public class Bolum3_AltBolumB_AltC_Activity extends AppCompatActivity {
    private Bolum3_AltBolumB_AltC_View gameView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // Oyun görünümünü oluştur ve ekrana yerleştir
        gameView = new Bolum3_AltBolumB_AltC_View(this);
        setContentView(gameView);
    }

    @Override
    protected void onPause() {
        super.onPause();
        // Uygulama arka plana atıldığında thread'i durdur (Hata almamak için şart)
        gameView.pauseGameThread();
    }

    @Override
    protected void onResume() {
        super.onResume();
        // Uygulama tekrar açıldığında oyunu devam ettir
        gameView.resumeGameThread();
    }
}