package com.example.altin_hilal.AnaEkran;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageButton;
import android.widget.TextView;

import com.example.altin_hilal.AnaEkran.Bolum1.Bolum1_AltBolumA.Bolum1_AltBolumA_AltAna;
import com.example.altin_hilal.AnaEkran.Bolum2.Bolum2_AltBolumA_AltAna;
import com.example.altin_hilal.AnaEkran.Bolum3.Bolum3_AltBolumA_AltAna;
import com.example.altin_hilal.Model.DatabaseHelper;
import com.example.altin_hilal.R;

public class MainActivity extends AppCompatActivity {
    ImageButton fab1, fab2, fab3, fab4;
    DatabaseHelper dbHelper;  // DatabaseHelper nesnesi
    TextView completed_textb1a, completed_textb2a, completed_textb3a;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // ÖNEMLİ DÜZELTME 1: dbHelper'ı findViewById'dan önce başlatın
        dbHelper = new DatabaseHelper(this); // DatabaseHelper'ı başlat

        fab1 = findViewById(R.id.fab1);
        fab2 = findViewById(R.id.fab2);
        fab3 = findViewById(R.id.fab3);

        // Not: Burada dbHelper.getReadableDatabase() çağrılırken dbHelper'ın null olmadığından emin olmalısınız.
        // Yukarıdaki düzeltme bu sorunu çözdü.
        SQLiteDatabase db = dbHelper.getReadableDatabase();  // Veritabanını açın
        TextView completedText = findViewById(R.id.completed_textb1a);

        //bolumEkleAnaBolumler();
        //kontrolAnaBolum();
    }

    private void kontrolAnaBolum() {
        // Kontrol mantığı buraya gelecek
    }

    /**
     * Tıklanan View'ın ID'sini kontrol eder ve ilgili ana bölüme yönlendirir.
     * 'constant expression required' hatasını önlemek için switch ifadesi
     * if-else if zinciri ile değiştirilmiştir.
     *
     * @param v Tıklanan View.
     */
    public void tikla(View v) {
        // Hatanın çözümü: view ID'sini bir değişkene atamak ve if-else if kullanmak
        int viewId = v.getId();

        if (viewId == R.id.fab1) {
            Intent Bolum1_AltBolum1 = new Intent(getApplicationContext(), Bolum1_AltBolumA_AltAna.class);
            // Bolum1_AltBolumA_AltA.putExtra("bolumler", "bolumler");
            //  Bolum1_AltBolumA_AltA.putExtra("etiket", "Bolum1_AltBolumA_D");
            startActivity(Bolum1_AltBolum1);

        } else if (viewId == R.id.fab2) {
            // Not: Buradaki intent de Bolum1_AltBolumA_AltAna sınıfına gidiyor.
            // Bolum2 için farklı bir sınıf çağırmanız gerekebilir.
            Intent Bolum2_AltBolum1 = new Intent(getApplicationContext(), Bolum2_AltBolumA_AltAna.class);
            startActivity(Bolum2_AltBolum1);

        } else if (viewId == R.id.fab3) {
            // Not: Buradaki intent de Bolum1_AltBolumA_AltAna sınıfına gidiyor.
            // Bolum3 için farklı bir sınıf çağırmanız gerekebilir.
            Intent Bolum3_AltBolum1 = new Intent(getApplicationContext(), Bolum3_AltBolumA_AltAna.class);
            startActivity(Bolum3_AltBolum1);
        }
    }

    private void bolumEkleAnaBolumler() {
        // Bölüm ekleme mantığı buraya gelecek
    }
}