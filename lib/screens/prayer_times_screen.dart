import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adhan/adhan.dart';
import '../constants/theme.dart';
import '../models/prayer_models.dart' show Mezhep;
import '../providers/app_provider.dart';
import '../services/prayer_times_service.dart';
import '../services/location_service.dart';
import '../widgets/location_selection_sheet.dart';

class PrayerTimesScreen extends StatefulWidget {
  const PrayerTimesScreen({super.key});

  @override
  State<PrayerTimesScreen> createState() => _PrayerTimesScreenState();
}

class _PrayerTimesScreenState extends State<PrayerTimesScreen> {
  Timer? _timer;
  CityLocation _selectedCity = PrayerTimesService.defaultCities[0]; // Istanbul
  double _latitude = 41.0082;
  double _longitude = 28.9784;
  String _locationName = 'İstanbul';
  bool _isGpsActive = false;
  bool _isLoadingGps = false;
  CalculationMethod _selectedMethod = CalculationMethod.turkey;

  @override
  void initState() {
    super.initState();
    _startTimer();
    final provider = Provider.of<AppProvider>(context, listen: false);
    _latitude = provider.userLatitude;
    _longitude = provider.userLongitude;
    _locationName = provider.userCityName;
    _isGpsActive = provider.isGpsActive;

    if (!_isGpsActive) {
      final match = PrayerTimesService.defaultCities.firstWhere(
        (c) => c.name.toLowerCase() == _locationName.toLowerCase(),
        orElse: () => PrayerTimesService.defaultCities[0],
      );
      _selectedCity = match;
    } else {
      _tryGetGpsLocation();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _tryGetGpsLocation() async {
    setState(() => _isLoadingGps = true);
    final pos = await LocationService.getCurrentLocation();
    if (mounted) {
      if (pos != null) {
        final provider = Provider.of<AppProvider>(context, listen: false);
        await provider.setUserLocation(
          lat: pos.latitude,
          lng: pos.longitude,
          cityName: 'Mevcut Konum (GPS)',
          isGps: true,
        );
        setState(() {
          _latitude = pos.latitude;
          _longitude = pos.longitude;
          _locationName = 'Mevcut Konum (GPS)';
          _isGpsActive = true;
          _isLoadingGps = false;
        });
      } else {
        setState(() => _isLoadingGps = false);
      }
    }
  }

  String _getPrayerName(Prayer prayer, String lang) {
    switch (prayer) {
      case Prayer.fajr:
        return lang == 'tr' ? 'İmsak' : lang == 'id' ? 'Subuh' : lang == 'ru' ? 'Имсак (Фаджр)' : lang == 'ur' ? 'فجر' : 'Fajr';
      case Prayer.sunrise:
        return lang == 'tr' ? 'Güneş' : lang == 'id' ? 'Syuruq' : lang == 'ru' ? 'Восход' : lang == 'ur' ? 'طلوع آفتاب' : 'Sunrise';
      case Prayer.dhuhr:
        return lang == 'tr' ? 'Öğle' : lang == 'id' ? 'Dzuhur' : lang == 'ru' ? 'Зухр' : lang == 'ur' ? 'ظہر' : 'Dhuhr';
      case Prayer.asr:
        return lang == 'tr' ? 'İkindi' : lang == 'id' ? 'Ashar' : lang == 'ru' ? 'Аср' : lang == 'ur' ? 'عصر' : 'Asr';
      case Prayer.maghrib:
        return lang == 'tr' ? 'Akşam' : lang == 'id' ? 'Maghrib' : lang == 'ru' ? 'Магриб' : lang == 'ur' ? 'مغرب' : 'Maghrib';
      case Prayer.isha:
        return lang == 'tr' ? 'Yatsı' : lang == 'id' ? 'Isya' : lang == 'ru' ? 'Иша' : lang == 'ur' ? 'عشاء' : 'Isha';
      default:
        return '';
    }
  }

  String _getScreenTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Namaz Vakitleri';
      case 'de': return 'Gebetszeiten';
      case 'fr': return 'Heures de prière';
      case 'es': return 'Horarios de oración';
      case 'id': return 'Jadwal Sholat';
      case 'ru': return 'Время намаза';
      case 'it': return 'Orari delle preghiere';
      case 'ur': return 'اوقات نماز';
      default: return 'Prayer Times';
    }
  }

  String _getNextPrayerLabel(String lang) {
    switch (lang) {
      case 'tr': return 'Sonraki Vakte Kalan Süre';
      case 'de': return 'Verbleibende Zeit bis zum nächsten Gebet';
      case 'fr': return 'Temps restant avant la prochaine prière';
      case 'es': return 'Tiempo restante para la siguiente oración';
      case 'id': return 'Waktu Tersisa Hingga Sholat Berikutnya';
      case 'ru': return 'До следующего намаза';
      case 'it': return 'Tempo rimanente alla prossima preghiera';
      case 'ur': return 'اگلی نماز کا وقت';
      default: return 'Time Remaining to Next Prayer';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.languageCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final prayerTimes = PrayerTimesService.getPrayerTimes(
      latitude: _latitude,
      longitude: _longitude,
      method: _selectedMethod,
      madhab: appProvider.selectedMezhep == Mezhep.shafii ? Madhab.shafi : Madhab.hanafi,
    );

    Prayer nextPrayer = prayerTimes.nextPrayer();
    DateTime? nextPrayerTime = prayerTimes.timeForPrayer(nextPrayer);
    final now = DateTime.now();

    if (nextPrayer == Prayer.none || nextPrayerTime == null) {
      final tomorrow = now.add(const Duration(days: 1));
      final tomorrowTimes = PrayerTimesService.getPrayerTimes(
        latitude: _latitude,
        longitude: _longitude,
        date: tomorrow,
        method: _selectedMethod,
        madhab: appProvider.selectedMezhep == Mezhep.shafii ? Madhab.shafi : Madhab.hanafi,
      );
      nextPrayer = Prayer.fajr;
      nextPrayerTime = tomorrowTimes.fajr;
    }

    Duration remaining = Duration.zero;
    if (nextPrayerTime != null) {
      remaining = nextPrayerTime.difference(now);
      if (remaining.isNegative) remaining = Duration.zero;
    }

    final prayerList = [
      {'prayer': Prayer.fajr, 'time': prayerTimes.fajr, 'icon': Icons.nights_stay_rounded},
      {'prayer': Prayer.sunrise, 'time': prayerTimes.sunrise, 'icon': Icons.wb_twilight_rounded},
      {'prayer': Prayer.dhuhr, 'time': prayerTimes.dhuhr, 'icon': Icons.wb_sunny_rounded},
      {'prayer': Prayer.asr, 'time': prayerTimes.asr, 'icon': Icons.wb_cloudy_rounded},
      {'prayer': Prayer.maghrib, 'time': prayerTimes.maghrib, 'icon': Icons.wb_twilight_sharp},
      {'prayer': Prayer.isha, 'time': prayerTimes.isha, 'icon': Icons.bedtime_rounded},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_getScreenTitle(lang)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: _isLoadingGps
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2, color: AppColors.premiumGold),
                  )
                : const Icon(Icons.my_location_rounded, color: AppColors.premiumGold),
            tooltip: 'GPS Konumu Al',
            onPressed: _tryGetGpsLocation,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Countdown Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: isDark
                      ? [const Color(0xFF0F382C), const Color(0xFF062018)]
                      : [AppColors.darkEmerald, const Color(0xFF0A4034)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkEmerald.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on_rounded, color: AppColors.premiumGold, size: 18),
                      const SizedBox(width: 6),
                      Text(
                        _isGpsActive ? appProvider.userCityName : _locationName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    _getNextPrayerLabel(lang),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _getPrayerName(nextPrayer, lang),
                    style: const TextStyle(
                      color: AppColors.premiumGold,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    PrayerTimesService.formatCountdown(remaining),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontFeatures: [FontFeature.tabularFigures()],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // City Selection & Method Bar
            InkWell(
              onTap: () async {
                final result = await LocationSelectionSheet.show(context);
                if (result == true && mounted) {
                  setState(() {
                    _latitude = appProvider.userLatitude;
                    _longitude = appProvider.userLongitude;
                    _locationName = appProvider.userCityName;
                    _isGpsActive = appProvider.isGpsActive;
                  });
                }
              },
              borderRadius: BorderRadius.circular(14),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white10 : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: AppColors.champagneGold.withOpacity(0.4)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.location_city_rounded, color: AppColors.premiumGold, size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang == 'tr' ? 'Seçili Konum / Şehir' : 'Selected Location / City',
                            style: TextStyle(
                              fontSize: 11,
                              color: isDark ? Colors.white54 : Colors.grey.shade600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            _locationName,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : AppColors.darkEmerald,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.search_rounded, color: AppColors.premiumGold, size: 20),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Prayer Times List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: prayerList.length,
              itemBuilder: (context, index) {
                final item = prayerList[index];
                final prayer = item['prayer'] as Prayer;
                final time = item['time'] as DateTime?;
                final icon = item['icon'] as IconData;

                final isNext = nextPrayer == prayer;
                final isPassed = time != null && now.isAfter(time) && !isNext;

                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  decoration: BoxDecoration(
                    color: isNext
                        ? (isDark ? const Color(0xFF1E4D3E) : const Color(0xFFE8F5E9))
                        : (isDark ? Colors.white.withOpacity(0.05) : Colors.white),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isNext
                          ? AppColors.premiumGold
                          : (isDark ? Colors.white10 : Colors.grey.shade200),
                      width: isNext ? 2 : 1,
                    ),
                    boxShadow: isNext
                        ? [
                            BoxShadow(
                              color: AppColors.premiumGold.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        color: isNext ? AppColors.premiumGold : (isDark ? Colors.white70 : AppColors.darkEmerald),
                        size: 24,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          _getPrayerName(prayer, lang),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isNext ? FontWeight.bold : FontWeight.w600,
                            color: isNext
                                ? (isDark ? Colors.white : AppColors.darkEmerald)
                                : (isDark ? Colors.white70 : Colors.black87),
                          ),
                        ),
                      ),
                      Text(
                        PrayerTimesService.formatTime(time),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isNext
                              ? AppColors.premiumGold
                              : (isPassed ? Colors.grey : (isDark ? Colors.white : AppColors.darkEmerald)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
