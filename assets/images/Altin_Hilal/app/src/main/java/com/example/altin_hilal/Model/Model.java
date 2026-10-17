package com.example.altin_hilal.Model;

public class Model {
    private String kelime;

    public String getKelime() {
        return kelime;
    }

    public void setKelime(String kelime) {
        this.kelime = kelime;
    }

    public String getAnlami() {
        return anlami;
    }

    public void setAnlami(String anlami) {
        this.anlami = anlami;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    private String anlami;

    public Model(String kelime, String anlami, int id) {
        this.kelime = kelime;
        this.anlami = anlami;
        this.id = id;
    }

    private int id;

}
