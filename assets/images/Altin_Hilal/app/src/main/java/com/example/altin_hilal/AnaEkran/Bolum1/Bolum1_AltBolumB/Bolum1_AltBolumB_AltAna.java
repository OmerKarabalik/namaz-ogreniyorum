package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumB;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

import com.example.altin_hilal.R;

public class Bolum1_AltBolumB_AltAna extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_bolum1_alt_bolum_balt_ana);

    }

    public void altBolum_tikla(View v) {
        if (v.getId() == R.id.alt_bolum1a) {
            Intent Bolum1_AltBolumB_AltA = new Intent(getApplicationContext(), Bolum1_AltBolumB_AltA.class);
            startActivity(Bolum1_AltBolumB_AltA);
        } else if (v.getId() == R.id.alt_bolum1b) {
            Intent Bolum1_AltBolumB_AltB = new Intent(getApplicationContext(), Bolum1_AltBolumB_AltB.class);
            startActivity(Bolum1_AltBolumB_AltB);
        }

    }

}