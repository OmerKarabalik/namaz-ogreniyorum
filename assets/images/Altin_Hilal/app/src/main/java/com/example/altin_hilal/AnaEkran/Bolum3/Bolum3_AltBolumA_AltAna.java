package com.example.altin_hilal.AnaEkran.Bolum3;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumB.Bolum1_AltBolumB_AltA;
import com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumB.Bolum1_AltBolumB_AltB;
import com.example.altin_hilal.R;

public class Bolum3_AltBolumA_AltAna extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_bolum3_alt_bolum_aalt_ana);

    }

    public void altBolum_tikla_3a(View v) {
        if (v.getId() == R.id.btn_go_1_alt1c_a) {
            Intent Bolum3_AltBolumB_AltA = new Intent(getApplicationContext(), Bolum3_AltBolumB_AltA.class);
            startActivity(Bolum3_AltBolumB_AltA);
        } else if (v.getId() == R.id.btn_go_2_alt1c_b) {
            Intent Bolum3_AltBolumB_AltB = new Intent(getApplicationContext(), Bolum3_AltBolumB_AltB.class);
            startActivity(Bolum3_AltBolumB_AltB);
        } else if (v.getId() == R.id.btn_go_3_alt1c_c) {
            Intent Bolum3_AltBolumB_AltC = new Intent(getApplicationContext(), Bolum3_AltBolumB_AltC.class);
            startActivity(Bolum3_AltBolumB_AltC);
        }

    }
}