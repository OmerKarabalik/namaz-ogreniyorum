package com.example.altin_hilal.Model;

public class Model_Image  {

    // Sol tarafta gösterilecek resmin kaynak kimliği (R.drawable.xxx)
    private int leftImageResId;

    // Sağ tarafta gösterilecek resmin kaynak kimliği (R.drawable.yyy)
    private int rightImageResId;

    // Eşleşme kontrolü için benzersiz kimlik (Örneğin: 0, 1, 2, ...)
    private int matchId;

    /**
     * Resim Eşleştirme Modeli için kurucu metot.
     * @param leftImageResId Sol tarafta gösterilecek resmin kaynak kimliği (int).
     * @param rightImageResId Sağ tarafta gösterilecek resmin kaynak kimliği (int).
     * @param matchId Eşleşme kontrolü için benzersiz kimlik (int).
     */
    public Model_Image(int leftImageResId, int rightImageResId, int matchId) {
        this.leftImageResId = leftImageResId;
        this.rightImageResId = rightImageResId;
        this.matchId = matchId;
    }

    // --- Getter Metotları ---

    /**
     * Önceki kodunuzda kullanılan getKelime() metodunun yerini alır.
     * Artık Sol tarafta gösterilecek resmin kaynak kimliğini (int) döndürür.
     */
    public int getKelime() {
        return leftImageResId;
    }

    /**
     * Önceki kodunuzda kullanılan getAnlami() metodunun yerini alır.
     * Artık Sağ tarafta gösterilecek resmin kaynak kimliğini (int) döndürür.
     */
    public int getAnlami() {
        return rightImageResId;
    }

    /**
     * Eşleşme kontrolü için benzersiz kimliği döndürür.
     */
    public int getId() {
        return matchId;
    }

    // İsteğe bağlı olarak ekleyebilirsiniz, ancak zorunlu değildir:
    public int getLeftImageResId() {
        return leftImageResId;
    }

    public int getRightImageResId() {
        return rightImageResId;
    }
}