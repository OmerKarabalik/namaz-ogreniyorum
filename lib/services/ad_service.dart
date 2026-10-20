import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService {
  // === REKLAM AYARLARI (AÇMA / KAPAMA) ===
  static const bool bannerReklamlariAktif = false;
  static const bool gecisReklamlariAktif = true;

  // === REKLAM SIKLIK SINIRI (Frequency Capping) ===
  // İki geçiş reklamı arasında geçmesi gereken minimum süre (saniye cinsinden)
  // 2 dakika (120 saniye) olarak ayarlandı.
  static const int minimumGecisSuresiSaniye = 120;

  // === GOOGLE ADMOB REKLAM BİRİM KİMLİKLERİ ===
  static const String bannerAdUnitId = 'ca-app-pub-3940256099942544/6300978111';
  static String get interstitialAdUnitId {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return 'ca-app-pub-5160530830178108/7420891607'; // iOS Gerçek Geçiş Reklamı
    }
    return 'ca-app-pub-5160530830178108/5778948970'; // Android Gerçek Geçiş Reklamı
  }

  // Geçiş Reklamı Durumu
  static InterstitialAd? _interstitialAd;
  static bool _isInterstitialAdLoading = false;
  static DateTime? _lastInterstitialShowTime;

  /// Reklam SDK'sını başlatır
  static Future<void> initialize() async {
    try {
      await MobileAds.instance.initialize();
      loadInterstitialAd();
    } catch (e) {
      debugPrint('AdMob initialization error (handled): $e');
    }
  }

  /// Banner Reklam oluşturur ve yükler
  static BannerAd? createBannerAd({
    required VoidCallback onAdLoaded,
    required void Function(Ad, LoadAdError) onAdFailedToLoad,
  }) {
    if (!bannerReklamlariAktif) return null;

    try {
      return BannerAd(
        adUnitId: bannerAdUnitId,
        size: AdSize.banner,
        request: const AdRequest(),
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            debugPrint('AdMob: Banner reklam basariyla yuklendi.');
            onAdLoaded();
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('AdMob: Banner reklam yuklenemedi: ${error.message}');
            ad.dispose();
            onAdFailedToLoad(ad, error);
          },
        ),
      )..load();
    } catch (e) {
      debugPrint('AdMob createBannerAd error: $e');
      return null;
    }
  }

  /// Geçiş Reklamını önceden hafızaya (cache) yükler
  static void loadInterstitialAd() {
    if (!gecisReklamlariAktif) return;
    if (_interstitialAd != null || _isInterstitialAdLoading) return;

    _isInterstitialAdLoading = true;
    try {
      InterstitialAd.load(
        adUnitId: interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('AdMob: Gecis reklami basariyla yuklendi.');
            _interstitialAd = ad;
            _isInterstitialAdLoading = false;

            // Reklam kapatıldığında veya hata verdiğinde ne yapılacağı
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                debugPrint('AdMob: Gecis reklami kapatildi.');
                ad.dispose();
                _interstitialAd = null;
                loadInterstitialAd(); // Bir sonraki reklamı önden yükle
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('AdMob: Gecis reklami gosterilemedi: ${error.message}');
                ad.dispose();
                _interstitialAd = null;
                loadInterstitialAd();
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('AdMob: Gecis reklami yuklenemedi: ${error.message} (${error.code})');
            _isInterstitialAdLoading = false;
            _interstitialAd = null;
            // 30 saniye sonra tekrar yüklemeyi dene
            Future.delayed(const Duration(seconds: 30), () {
              loadInterstitialAd();
            });
          },
        ),
      );
    } catch (e) {
      debugPrint('AdMob loadInterstitialAd error: $e');
      _isInterstitialAdLoading = false;
    }
  }

  /// Geçiş Reklamını sıklık sınırına uyarak gösterir
  static void showInterstitialAd() {
    if (!gecisReklamlariAktif) return;

    final ad = _interstitialAd;
    if (ad == null) {
      debugPrint('AdMob: Gecis reklami henüz hazir degil, yukleniyor.');
      loadInterstitialAd();
      return;
    }

    final now = DateTime.now();
    if (_lastInterstitialShowTime != null) {
      final diff = now.difference(_lastInterstitialShowTime!).inSeconds;
      if (diff < minimumGecisSuresiSaniye) {
        debugPrint('AdMob Capping: Gecis reklami sıklık sınırına takildi. Kalan sure: ${minimumGecisSuresiSaniye - diff} saniye.');
        return;
      }
    }

    _lastInterstitialShowTime = now;
    ad.show();
  }
}