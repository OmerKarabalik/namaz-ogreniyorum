package com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;

import androidx.appcompat.app.AppCompatActivity;

import com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumB.Bolum1_AltBolumB_AltAna;
import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.R;

public class Bolum1_AltBolumA_AltAna extends AppCompatActivity {
    DatabaseHelper dbHelper;  // DatabaseHelper nesnesi
    LinearLayout level1Container;  // LinearLayout nesneleri
    LinearLayout level2Container;
    LinearLayout level3Container;
    LinearLayout level4Container;
    LinearLayout level5Container;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bolum1_alt_bolum1);  // Layout'u ayarlayın

        // findViewById() ile LinearLayout nesnelerini başlatın

    }

    private void kontrolBolum1() {
        if (dbHelper.bolumTamamlandiMi("Bolum1_AltBolumA_AltA") == 1) {
            // Eğer bölümü tamamladıysa, bu bölümü görünür yap
            level1Container.setVisibility(View.VISIBLE);
        } else {
            // Bölüm tamamlanmadıysa, altBolum1 görünmez
            level1Container.setVisibility(View.INVISIBLE);
        }


        if (dbHelper.bolumTamamlandiMi("Bolum1_AltBolumA_AltB") == 1) {
            // Eğer bölümü tamamladıysa, bu bölümü görünür yap
            level2Container.setVisibility(View.VISIBLE);
        } else {
            // Bölüm tamamlanmadıysa, altBolum2 görünmez
            level2Container.setVisibility(View.INVISIBLE);
        }


        if (dbHelper.bolumTamamlandiMi("Bolum1_AltBolumA_AltC") == 1) {
            // Eğer bölümü tamamladıysa, bu bölümü görünür yap
            level3Container.setVisibility(View.VISIBLE);
        } else {
            // Bölüm tamamlanmadıysa, altBolum3 görünmez
            level3Container.setVisibility(View.INVISIBLE);
        }


        if (dbHelper.bolumTamamlandiMi("Bolum1_AltBolumA_AltD") == 1) {
            // Eğer bölümü tamamladıysa, bu bölümü görünür yap
            level4Container.setVisibility(View.VISIBLE);
        } else {
            // Bölüm tamamlanmadıysa, altBolum4 görünmez
            level4Container.setVisibility(View.INVISIBLE);
        }

        if (dbHelper.bolumTamamlandiMi("Bolum1_AltBolumA_AltE") == 1) {
            // Eğer bölümü tamamladıysa, bu bölümü görünür yap
            level5Container.setVisibility(View.VISIBLE);

        } else {
            // Bölüm tamamlanmadıysa, altBolum5 görünmez
            level5Container.setVisibility(View.INVISIBLE);
        }

    }

    public void bolumEkleBolum1() {
        dbHelper.addBolum("Bolum1_AltBolumA_AltA", "false");
        dbHelper.addBolum("Bolum1_AltBolumA_AltB", "false");
    }


    public void altBolum_tikla(View v) {

        if (v.getId() == R.id.alt_bolum1) {
            // İlk durum
           /* Intent Bolum1_AltBolumA = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
            Bolum1_AltBolumA.putExtra("bolumler", "bolumler");
            Bolum1_AltBolumA.putExtra("etiket", "Bolum1_AltBolumA_AltA");
            startActivity(Bolum1_AltBolumA);*/
            Intent Bolum1_AltBolumAA = new Intent(getApplicationContext(), Bolum1_AltBolumA_AltAnaA.class);
            startActivity(Bolum1_AltBolumAA);

        } else if (v.getId() == R.id.alt_bolum2) {
            // İkinci durum
      /*      Intent Bolum1_AltBolumB = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
            Bolum1_AltBolumB.putExtra("bolumler", "bolumler");
            Bolum1_AltBolumB.putExtra("etiket", "Bolum1_AltBolumA_AltB");
            startActivity(Bolum1_AltBolumB);*/
            Intent Bolum1_AltBolumB_AltAna = new Intent(getApplicationContext(), Bolum1_AltBolumB_AltAna.class);
            startActivity(Bolum1_AltBolumB_AltAna);
        }
// Eğer üçüncü bir durum eklemek istiyorsanız buraya eklemelisiniz:
// else if (v.getId() == R.id.alt_bolum3) {
//     // ...
// }
        else {
            // default (İsteğe bağlı)
            // switch bloğundaki default kısmına karşılık gelir.
        }
    }

    private void startEslestirmeActivity(String etiket) {
        // Yeni aktiviteye geçiş yap
        Intent intent = new Intent(getApplicationContext(), Eslestirme_Bolum1.class);
        intent.putExtra("bolumler", "bolumler");
        intent.putExtra("etiket", etiket);
        startActivity(intent);
    }
}