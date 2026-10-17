package com.example.altin_hilal.AnaEkran.Bolum2;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

import com.example.altin_hilal.R;

public class Bolum2_AltBolumA_AltAna extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_bolum2_alt_bolum_aalt_ana);
    }


    public void altBolum_tikla_2b(View v) {
        if (v.getId() == R.id.btn_section1_action) {
            Intent Bolum2_AltBolumA_AltA = new Intent(getApplicationContext(), Bolum2_AltBolumA_AltA.class);
            startActivity(Bolum2_AltBolumA_AltA);
        } else if (v.getId() == R.id.btn_section2_action) {
            Intent Bolum2_AltBolumA_AltB = new Intent(getApplicationContext(), Bolum2_AltBolumA_AltB.class);
            startActivity(Bolum2_AltBolumA_AltB);
        }

    }
}