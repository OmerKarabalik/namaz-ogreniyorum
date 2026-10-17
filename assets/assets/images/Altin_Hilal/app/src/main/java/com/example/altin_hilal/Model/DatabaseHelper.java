package com.example.altin_hilal.Model;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import android.widget.Toast;

public class DatabaseHelper extends SQLiteOpenHelper {

    private static final String DATABASE_NAME = "Bolumler.db";
    private static final int DATABASE_VERSION = 1;
    public static final String TABLE_BOLUMLER = "Bolumler";
    public static final String COLUMN_ID = "id";
    public static final String COLUMN_AD = "ad";
    public static final String COLUMN_TAMAMLANDI = "tamamlandi";

    private static DatabaseHelper instance;

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    public static synchronized DatabaseHelper getInstance(Context context) {
        if (instance == null) {
            instance = new DatabaseHelper(context.getApplicationContext());
        }
        return instance;
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("CREATE TABLE " + TABLE_BOLUMLER + " (" +
                COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                COLUMN_AD + " TEXT NOT NULL UNIQUE, " +
                COLUMN_TAMAMLANDI + " TEXT NOT NULL);");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_BOLUMLER);
        onCreate(db);
    }

    public void addBolum(String ad, String tamamlandi) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(COLUMN_AD, ad);
        values.put(COLUMN_TAMAMLANDI, tamamlandi);

        long result = db.insertWithOnConflict(TABLE_BOLUMLER, null, values, SQLiteDatabase.CONFLICT_IGNORE);
        if (result == -1) {
            Log.d("Database", "Bölüm zaten mevcut: " + ad);
        } else {
            Log.d("Database", "Yeni bölüm eklendi: " + ad);
        }
        db.close();
    }

    public void deleteAllBolumler() {
        SQLiteDatabase db = this.getWritableDatabase();
        db.beginTransaction();
        try {
            int deletedRows = db.delete(TABLE_BOLUMLER, null, null);
            db.setTransactionSuccessful();
            Log.d("Database", deletedRows + " satır silindi. Bölümler temizlendi.");
        } catch (Exception e) {
            Log.e("Database", "Tüm bölümler silinirken hata oluştu", e);
        } finally {
            db.endTransaction();
            db.close();
        }
    }

    public Cursor getAllBolumler() {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_BOLUMLER, null, null, null, null, null, null);

        if (cursor != null && cursor.moveToFirst()) {
            do {
                int columnCount = cursor.getColumnCount();
                StringBuilder row = new StringBuilder();

                for (int i = 0; i < columnCount; i++) {
                    row.append(cursor.getColumnName(i)).append(": ")
                            .append(cursor.getString(i)).append(" | ");
                }
                Log.d("BOLUM_LOG", row.toString());
            } while (cursor.moveToNext());
        } else {
            Log.d("BOLUM_LOG", "Veri bulunamadı.");
        }

        return cursor;
    }

    public void updateTamamlandiByAd(String ad) {
        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(COLUMN_TAMAMLANDI, "true");

        int rowsAffected = db.update(TABLE_BOLUMLER, values, COLUMN_AD + " = ?", new String[]{ad});
        Log.d("Database", rowsAffected > 0 ? "Bölüm güncellendi: " + ad : "Güncellenemedi: " + ad);
        db.close();
    }

    public int bolumTamamlandiMi(String ad) {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_BOLUMLER, new String[]{COLUMN_TAMAMLANDI}, COLUMN_AD + " = ?", new String[]{ad}, null, null, null);
        int result = 0;

        if (cursor != null && cursor.moveToFirst()) {
            String tamamlandi = cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_TAMAMLANDI));
            if ("true".equalsIgnoreCase(tamamlandi)) {
                result = 1;
            }
            Log.d("BolumKontrol", ad + " tamamlandı mı? " + tamamlandi);
            cursor.close();
        } else {
            Log.d("BolumKontrol", ad + " bulunamadı.");
        }

        db.close();
        return result;
    }


    public void logAllBolumler(Context context) {
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.query(TABLE_BOLUMLER, null, null, null, null, null, null);

        if (cursor != null && cursor.moveToFirst()) {
            do {
                String logMessage = "ID: " + cursor.getInt(cursor.getColumnIndexOrThrow(COLUMN_ID)) +
                        ", Ad: " + cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_AD)) +
                        ", Tamamlandı: " + cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_TAMAMLANDI));
                Log.d("Database", logMessage);
                Toast.makeText(context, logMessage, Toast.LENGTH_SHORT).show();
            } while (cursor.moveToNext());
            cursor.close();
        } else {
            Log.d("Database", "Tabloda hiç bölüm yok.");
            Toast.makeText(context, "Tabloda hiç bölüm yok.", Toast.LENGTH_SHORT).show();
        }
        db.close();
    }

    public void closeDatabase() {
        if (instance != null) {
            instance.close();
        }
    }
}
