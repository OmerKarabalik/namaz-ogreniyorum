package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA;

import android.graphics.Point;
import android.os.Bundle;
import android.view.Display;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.FragmentManager;


import com.example.altin_hilal.R;


public class Eslestirme_Bolum1 extends AppCompatActivity {
    String bolum, etiket;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.bolum1_altboluma_alata);


        Display display = getWindowManager().getDefaultDisplay();
        Point size = new Point();
        display.getSize(size);

        FragmentManager fm = null;

        fm = getSupportFragmentManager();
        Bundle bundle = getIntent().getExtras();

        if (bundle != null) {
            bolum = bundle.getString("bolumler");
            etiket = bundle.getString("etiket");
        }

        Bolum1_AltBolumA_AltA fragment1 = (Bolum1_AltBolumA_AltA) fm.findFragmentByTag(etiket);
        Bolum1_AltBolumA_AltB fragment2 = (Bolum1_AltBolumA_AltB) fm.findFragmentByTag(etiket);
        Bolum1_AltBolumA_AltC fragment3 = (Bolum1_AltBolumA_AltC) fm.findFragmentByTag(etiket);
        Bolum1_AltBolumA_AltD fragment4 = (Bolum1_AltBolumA_AltD) fm.findFragmentByTag(etiket);

        if (fragment1 == null || fragment1.getTag().equals("Bolum1_AltBolumA_AltA")) {
            //Toast.makeText(this, "Sıfırdan oluştu", Toast.LENGTH_SHORT).show();
            if (etiket.equals("Bolum1_AltBolumA_AltA")) {
                fragment1 = new Bolum1_AltBolumA_AltA();
                fm.beginTransaction().add(R.id.container, fragment1, "Bolum1_AltBolumA_AltA").commit();
            }
        }
        if (fragment2 == null || fragment2.getTag().equals("Bolum1_AltBolumA_AltB")) {
            //Toast.makeText(this, "Sıfırdan oluştu", Toast.LENGTH_SHORT).show();
            if (etiket.equals("Bolum1_AltBolumA_AltB")) {
                setContentView(R.layout.bolum1_altboluma_alatb);
                fragment2 = new Bolum1_AltBolumA_AltB();
                fm.beginTransaction().add(R.id.container, fragment2, "Bolum1_AltBolumA_AltB").commit();
            }
        }
        if (fragment3 == null || fragment3.getTag().equals("Bolum1_AltBolumA_AltC")) {
            //Toast.makeText(this, "Sıfırdan oluştu", Toast.LENGTH_SHORT).show();
            if (etiket.equals("Bolum1_AltBolumA_AltC")) {
                setContentView(R.layout.bolum1_altboluma_alatc);
                fragment3 = new Bolum1_AltBolumA_AltC();
                fm.beginTransaction().add(R.id.container, fragment3, "Bolum1_AltBolumA_AltC").commit();
            }
        }

        if (fragment4 == null || fragment4.getTag().equals("Bolum1_AltBolumA_AltD")) {
            //Toast.makeText(this, "Sıfırdan oluştu", Toast.LENGTH_SHORT).show();
            if (etiket.equals("Bolum1_AltBolumA_AltD")) {
                setContentView(R.layout.bolum1_altboluma_alatd);
                fragment4 = new Bolum1_AltBolumA_AltD();
                fm.beginTransaction().add(R.id.container, fragment4, "Bolum1_AltBolumA_AltD").commit();
            }
        }

    }
}