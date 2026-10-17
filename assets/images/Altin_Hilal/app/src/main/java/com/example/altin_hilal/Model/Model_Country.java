package com.example.altin_hilal.Model;

public class Model_Country {
    private int imageResourceId;  // Drawable kaynağı
    private String kelime;        // Ülkenin adı
    private int id;               // Modelin ID'si

    // Constructor
    public Model_Country(int imageResourceId, String kelime, int id) {
        this.imageResourceId = imageResourceId;
        this.kelime = kelime;
        this.id = id;
    }

    // Getter ve Setter metodları
    public int getImageResourceId() {
        return imageResourceId;
    }

    public void setImageResourceId(int imageResourceId) {
        this.imageResourceId = imageResourceId;
    }

    public String getKelime() {
        return kelime;
    }

    public void setKelime(String kelime) {
        this.kelime = kelime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}