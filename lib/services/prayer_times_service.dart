import 'package:adhan/adhan.dart';

class CityLocation {
  final String name;
  final String country;
  final double latitude;
  final double longitude;

  const CityLocation({
    required this.name,
    required this.country,
    required this.latitude,
    required this.longitude,
  });
}

class PrayerTimesService {
  // Pre-defined fallback cities around the world categorized by country
  static const List<CityLocation> defaultCities = [
    // Türkiye
    CityLocation(name: 'İstanbul', country: 'Türkiye', latitude: 41.0082, longitude: 28.9784),
    CityLocation(name: 'Ankara', country: 'Türkiye', latitude: 39.9334, longitude: 32.8597),
    CityLocation(name: 'İzmir', country: 'Türkiye', latitude: 38.4237, longitude: 27.1428),
    CityLocation(name: 'Bursa', country: 'Türkiye', latitude: 40.1885, longitude: 29.0610),
    CityLocation(name: 'Antalya', country: 'Türkiye', latitude: 36.8969, longitude: 30.7133),
    CityLocation(name: 'Adana', country: 'Türkiye', latitude: 37.0000, longitude: 35.3213),
    CityLocation(name: 'Konya', country: 'Türkiye', latitude: 37.8746, longitude: 32.4932),
    CityLocation(name: 'Gaziantep', country: 'Türkiye', latitude: 37.0662, longitude: 37.3833),
    CityLocation(name: 'Trabzon', country: 'Türkiye', latitude: 41.0027, longitude: 39.7168),
    CityLocation(name: 'Diyarbakır', country: 'Türkiye', latitude: 37.9144, longitude: 40.2306),

    // Suudi Arabistan & Ortadoğu
    CityLocation(name: 'Mekke (Makkah)', country: 'Suudi Arabistan', latitude: 21.4225, longitude: 39.8262),
    CityLocation(name: 'Medine (Madinah)', country: 'Suudi Arabistan', latitude: 24.4672, longitude: 39.6112),
    CityLocation(name: 'Riyad', country: 'Suudi Arabistan', latitude: 24.7136, longitude: 46.6753),
    CityLocation(name: 'Cidde', country: 'Suudi Arabistan', latitude: 21.5433, longitude: 39.1728),
    CityLocation(name: 'Kudüs (Jerusalem)', country: 'Filistin', latitude: 31.7683, longitude: 35.2137),

    // Almanya (Germany)
    CityLocation(name: 'Berlin', country: 'Almanya', latitude: 52.5200, longitude: 13.4050),
    CityLocation(name: 'Köln', country: 'Almanya', latitude: 50.9375, longitude: 6.9603),
    CityLocation(name: 'Frankfurt', country: 'Almanya', latitude: 50.1109, longitude: 8.6821),
    CityLocation(name: 'Münih (Munich)', country: 'Almanya', latitude: 48.1351, longitude: 11.5820),
    CityLocation(name: 'Hamburg', country: 'Almanya', latitude: 53.5511, longitude: 9.9937),
    CityLocation(name: 'Stuttgart', country: 'Almanya', latitude: 48.7758, longitude: 9.1829),

    // İngiltere (UK)
    CityLocation(name: 'Londra (London)', country: 'İngiltere', latitude: 51.5074, longitude: -0.1278),
    CityLocation(name: 'Birmingham', country: 'İngiltere', latitude: 52.4862, longitude: -1.8904),
    CityLocation(name: 'Manchester', country: 'İngiltere', latitude: 53.4808, longitude: -2.2426),

    // Fransa (France)
    CityLocation(name: 'Paris', country: 'Fransa', latitude: 48.8566, longitude: 2.3522),
    CityLocation(name: 'Lyon', country: 'Fransa', latitude: 45.7640, longitude: 4.8357),
    CityLocation(name: 'Marsilya (Marseille)', country: 'Fransa', latitude: 43.2965, longitude: 5.3698),

    // İspanya (Spain)
    CityLocation(name: 'Madrid', country: 'İspanya', latitude: 40.4168, longitude: -3.7038),
    CityLocation(name: 'Barselona (Barcelona)', country: 'İspanya', latitude: 41.3851, longitude: 2.1734),
    CityLocation(name: 'Valensiya (Valencia)', country: 'İspanya', latitude: 39.4699, longitude: -0.3763),

    // İtalya (Italy)
    CityLocation(name: 'Roma (Rome)', country: 'İtalya', latitude: 41.9028, longitude: 12.4964),
    CityLocation(name: 'Milano (Milan)', country: 'İtalya', latitude: 45.4642, longitude: 9.1900),
    CityLocation(name: 'Napoli (Naples)', country: 'İtalya', latitude: 40.8518, longitude: 14.2681),

    // Rusya & Orta Asya (Russia & Central Asia)
    CityLocation(name: 'Moskova (Moscow)', country: 'Rusya', latitude: 55.7558, longitude: 37.6173),
    CityLocation(name: 'St. Petersburg', country: 'Rusya', latitude: 59.9343, longitude: 30.3351),
    CityLocation(name: 'Kazan', country: 'Rusya', latitude: 55.8304, longitude: 49.0661),
    CityLocation(name: 'Taşkent (Tashkent)', country: 'Özbekistan', latitude: 41.2995, longitude: 69.2401),
    CityLocation(name: 'Semerkand (Samarkand)', country: 'Özbekistan', latitude: 39.6542, longitude: 66.9597),
    CityLocation(name: 'Buhara (Bukhara)', country: 'Özbekistan', latitude: 39.7747, longitude: 64.4286),
    CityLocation(name: 'Almatı (Almaty)', country: 'Kazakistan', latitude: 43.2220, longitude: 76.8512),
    CityLocation(name: 'Astana', country: 'Kazakistan', latitude: 51.1694, longitude: 71.4491),
    CityLocation(name: 'Bakü (Baku)', country: 'Azerbaycan', latitude: 40.4093, longitude: 49.8671),

    // Endonezya (Indonesia)
    CityLocation(name: 'Cakarta (Jakarta)', country: 'Endonezya', latitude: -6.2088, longitude: 106.8456),
    CityLocation(name: 'Surabaya', country: 'Endonezya', latitude: -7.2575, longitude: 112.7521),
    CityLocation(name: 'Bandung', country: 'Endonezya', latitude: -6.9175, longitude: 107.6191),
    CityLocation(name: 'Medan', country: 'Endonezya', latitude: 3.5952, longitude: 98.6722),

    // Pakistan
    CityLocation(name: 'İslamabad (Islamabad)', country: 'Pakistan', latitude: 33.6844, longitude: 73.0479),
    CityLocation(name: 'Karaçi (Karachi)', country: 'Pakistan', latitude: 24.8607, longitude: 67.0011),
    CityLocation(name: 'Lahor (Lahore)', country: 'Pakistan', latitude: 31.5204, longitude: 74.3587),

    // Kuzey Amerika (USA & Canada)
    CityLocation(name: 'New York', country: 'ABD', latitude: 40.7128, longitude: -74.0060),
    CityLocation(name: 'Washington D.C.', country: 'ABD', latitude: 38.9072, longitude: -77.0369),
    CityLocation(name: 'Chicago', country: 'ABD', latitude: 41.8781, longitude: -87.6298),
    CityLocation(name: 'Los Angeles', country: 'ABD', latitude: 34.0522, longitude: -118.2437),
    CityLocation(name: 'Toronto', country: 'Kanada', latitude: 43.6532, longitude: -79.3832),
    CityLocation(name: 'Montreal', country: 'Kanada', latitude: 45.5017, longitude: -73.5673),

    // Diğer Avrupa Ülkeleri (Other European Countries)
    CityLocation(name: 'Amsterdam', country: 'Hollanda', latitude: 52.3676, longitude: 4.9041),
    CityLocation(name: 'Brüksel (Brussels)', country: 'Belçika', latitude: 50.8503, longitude: 4.3517),
    CityLocation(name: 'Viyana (Vienna)', country: 'Avusturya', latitude: 48.2082, longitude: 16.3738),
    CityLocation(name: 'Zürih (Zurich)', country: 'İsviçre', latitude: 47.3769, longitude: 8.5417),
    CityLocation(name: 'Saraybosna (Sarajevo)', country: 'Bosna Hersek', latitude: 43.8563, longitude: 18.4131),
    CityLocation(name: 'Sydney', country: 'Avustralya', latitude: -33.8688, longitude: 151.2093),
  ];

  /// Get prayer times for a latitude/longitude and date
  static PrayerTimes getPrayerTimes({
    required double latitude,
    required double longitude,
    DateTime? date,
    CalculationMethod method = CalculationMethod.turkey,
    Madhab madhab = Madhab.hanafi,
  }) {
    final coordinates = Coordinates(latitude, longitude);
    final dateComponents = DateComponents.from(date ?? DateTime.now());
    final params = method.getParameters();
    
    // Diyanet (Turkey) official calendars use Asr-i Evvel (1x shadow length) for Asr time.
    // In adhan package, Madhab.hanafi calculates Asr-i Sani (2x shadow length), which is ~50 mins later.
    // Therefore, for CalculationMethod.turkey, we set madhab to Madhab.shafi (1x shadow) to match Diyanet exactly.
    if (method == CalculationMethod.turkey) {
      params.madhab = Madhab.shafi;
    } else {
      params.madhab = madhab;
    }

    return PrayerTimes(coordinates, dateComponents, params);
  }

  /// Get available calculation methods
  static Map<String, CalculationMethod> getCalculationMethods() {
    return {
      'Diyanet (Türkiye)': CalculationMethod.turkey,
      'Muslim World League': CalculationMethod.muslim_world_league,
      'ISNA (North America)': CalculationMethod.north_america,
      'Umm Al-Qura (Makkah)': CalculationMethod.umm_al_qura,
      'Egyptian General Authority': CalculationMethod.egyptian,
      'Karachi': CalculationMethod.karachi,
      'Tehran': CalculationMethod.tehran,
      'Singapore': CalculationMethod.singapore,
      'Kuwait': CalculationMethod.kuwait,
      'Qatar': CalculationMethod.qatar,
    };
  }

  /// Formats time string (e.g., 05:42) from DateTime
  static String formatTime(DateTime? dateTime) {
    if (dateTime == null) return '--:--';
    final local = dateTime.toLocal();
    final hour = local.hour.toString().padLeft(2, '0');
    final minute = local.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Formats duration countdown to next prayer (e.g., 01:24:45)
  static String formatCountdown(Duration duration) {
    if (duration.isNegative) return '00:00:00';
    final hours = duration.inHours.toString().padLeft(2, '0');
    final minutes = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$hours:$minutes:$seconds';
  }
}
