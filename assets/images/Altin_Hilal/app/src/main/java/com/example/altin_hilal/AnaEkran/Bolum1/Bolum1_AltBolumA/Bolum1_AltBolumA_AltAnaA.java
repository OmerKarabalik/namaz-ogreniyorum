package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;

import com.example.altin_hilal.R;

public class Bolum1_AltBolumA_AltAnaA extends AppCompatActivity {
    ImageButton alt_bolum1aa,alt_bolum1ab,alt_bolum1ac, alt_bolum1ad;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_bolum1_alt_bolum_aa);
        alt_bolum1aa = findViewById(R.id.alt_bolum1aa);
        alt_bolum1ab = findViewById(R.id.alt_bolum1ab);
        alt_bolum1ac = findViewById(R.id.alt_bolum1ac);
        alt_bolum1ad = findViewById(R.id.alt_bolum1ad);


    }

    public void altBolum_tiklaaa(View v) {
        // Hatanın çözümü: view ID'sini bir değişkene atamak ve if-else if kullanmak
        int viewId = v.getId();

        if (viewId == R.id.alt_bolum1aa) {
             Intent Bolum1_AltBolumA = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
            Bolum1_AltBolumA.putExtra("bolumler", "bolumler");
            Bolum1_AltBolumA.putExtra("etiket", "Bolum1_AltBolumA_AltA");
            startActivity(Bolum1_AltBolumA);

        } else if (viewId == R.id.alt_bolum1ab) {
            Intent Bolum1_AltBolumB = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
            Bolum1_AltBolumB.putExtra("bolumler", "bolumler");
            Bolum1_AltBolumB.putExtra("etiket", "Bolum1_AltBolumA_AltB");
            startActivity(Bolum1_AltBolumB);

        } else if (viewId == R.id.alt_bolum1ac) {
            // Not: Buradaki intent de Bolum1_AltBolumA_AltAna sınıfına gidiyor.
            // Bolum3 için farklı bir sınıf çağırmanız gerekebilir.
            Intent Bolum1_AltBolumC = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
            Bolum1_AltBolumC.putExtra("bolumler", "bolumler");
            Bolum1_AltBolumC.putExtra("etiket", "Bolum1_AltBolumA_AltC");
            startActivity(Bolum1_AltBolumC);
        }
        else if (viewId == R.id.alt_bolum1ad) {
            // Not: Buradaki intent de Bolum1_AltBolumA_AltAna sınıfına gidiyor.
            // Bolum3 için farklı bir sınıf çağırmanız gerekebilir.
            Intent Bolum1_AltBolumD = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
            Bolum1_AltBolumD.putExtra("bolumler", "bolumler");
            Bolum1_AltBolumD.putExtra("etiket", "Bolum1_AltBolumA_AltD");
            startActivity(Bolum1_AltBolumD);
        }
    }
}