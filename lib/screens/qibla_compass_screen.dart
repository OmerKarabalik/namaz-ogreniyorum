import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';
import '../services/qibla_service.dart';
import '../services/location_service.dart';

class QiblaCompassScreen extends StatefulWidget {
  const QiblaCompassScreen({super.key});

  @override
  State<QiblaCompassScreen> createState() => _QiblaCompassScreenState();
}

class _QiblaCompassScreenState extends State<QiblaCompassScreen> {
  double _latitude = 41.0082; // Istanbul default
  double _longitude = 28.9784;
  String _locationName = 'İstanbul';
  bool _isLoadingGps = false;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<AppProvider>(context, listen: false);
    _latitude = provider.userLatitude;
    _longitude = provider.userLongitude;
    _locationName = provider.userCityName;
    _tryGetGpsLocation();
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
          _isLoadingGps = false;
        });
      } else {
        setState(() => _isLoadingGps = false);
      }
    }
  }

  String _getScreenTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Kıble Pusulası';
      case 'de': return 'Qibla-Kompass';
      case 'fr': return 'Boussole Qibla';
      case 'es': return 'Brújula Qibla';
      case 'id': return 'Kompas Kiblat';
      case 'ru': return 'Компас Киблы';
      case 'it': return 'Bussola Qibla';
      case 'ur': return 'قبلہ نما';
      default: return 'Qibla Compass';
    }
  }

  String _getAlignedMessage(String lang) {
    switch (lang) {
      case 'tr': return 'Kıbledesiniz!';
      case 'de': return 'Ausgerichtet auf Qibla!';
      case 'fr': return 'Aligné avec la Qibla !';
      case 'es': return '¡Alineado con la Qibla!';
      case 'id': return 'Menghadap Kiblat!';
      case 'ru': return 'Направлено на Киблу!';
      case 'it': return 'Allineato con la Qibla!';
      case 'ur': return 'آپ قبلہ کی سمت میں ہیں!';
      default: return 'Aligned with Qibla!';
    }
  }

  String _getDistanceLabel(String lang, int distKm) {
    switch (lang) {
      case 'tr': return 'Kabe\'ye Uzaklık: $distKm km';
      case 'de': return 'Entfernung zur Kaaba: $distKm km';
      case 'fr': return 'Distance jusqu\'à la Kaaba : $distKm km';
      case 'es': return 'Distancia a la Kaaba: $distKm km';
      case 'id': return 'Jarak ke Ka\'bah: $distKm km';
      case 'ru': return 'Расстояние до Каабы: $distKm км';
      case 'it': return 'Distanza dalla Kaaba: $distKm km';
      case 'ur': return 'کعبہ سے فاصلہ: $distKm کلومیٹر';
      default: return 'Distance to Kaaba: $distKm km';
    }
  }

  String _getCalibrationTip(String lang) {
    switch (lang) {
      case 'tr': return 'Pusulanın doğru çalışması için telefonunuzu düz tutun ve metal eşyalardan uzak durun.';
      case 'de': return 'Halten Sie das Telefon flach und halten Sie Abstand zu Metallgegenständen.';
      case 'fr': return 'Tenez le téléphone à plat et éloignez-vous des objets métalliques.';
      case 'es': return 'Mantenga el teléfono plano y alejado de objetos metálicos.';
      case 'id': return 'Pegang ponsel secara mendatar dan jauhkan dari benda logam.';
      case 'ru': return 'Держите телефон ровно и вдали от металлических предметов.';
      case 'it': return 'Tieni il telefono in piano e lontano da oggetti metallici.';
      case 'ur': return 'فون کو ہموار رکھیں اور دھاتی اشیاء سے دور رہیں۔';
      default: return 'Hold your phone flat and stay away from metallic objects for accuracy.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.languageCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final qiblaAngle = QiblaService.calculateQiblaAngle(_latitude, _longitude);
    final distanceKm = QiblaService.calculateDistanceToKaabaKm(_latitude, _longitude).round();

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
      body: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Pusula sensörü hatası: ${snapshot.error}'));
          }

          double heading = snapshot.data?.heading ?? 0;
          // Normalize heading
          heading = (heading + 360) % 360;

          // Qibla direction relative to phone's current heading
          double relativeQiblaAngle = (qiblaAngle - heading + 360) % 360;

          // Check if phone is aligned with Qibla within ±5 degrees
          bool isAligned = (relativeQiblaAngle <= 5 || relativeQiblaAngle >= 355);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              children: [
                // Location & Alignment Status Card
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
                  decoration: BoxDecoration(
                    color: isAligned
                        ? AppColors.emeraldGreen
                        : (isDark ? Colors.white10 : Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isAligned ? AppColors.premiumGold : AppColors.champagneGold.withOpacity(0.3),
                      width: isAligned ? 2 : 1,
                    ),
                    boxShadow: isAligned
                        ? [
                            BoxShadow(
                              color: AppColors.emeraldGreen.withOpacity(0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isAligned ? Icons.check_circle_rounded : Icons.explore_rounded,
                        color: isAligned ? AppColors.premiumGold : AppColors.darkEmerald,
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          isAligned ? _getAlignedMessage(lang) : _locationName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isAligned ? Colors.white : (isDark ? Colors.white : AppColors.darkEmerald),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // 3D Gold & Emerald Compass Widget
                Center(
                  child: SizedBox(
                    width: 280,
                    height: 280,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Outer Glow if aligned
                        if (isAligned)
                          Container(
                            width: 270,
                            height: 270,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.emeraldGreen.withOpacity(0.6),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                          ),

                        // Rotating Outer Compass Dial (N, E, S, W)
                        Transform.rotate(
                          angle: -heading * (pi / 180),
                          child: Container(
                            width: 260,
                            height: 260,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isDark ? const Color(0xFF0D2D24) : Colors.white,
                              border: Border.all(color: AppColors.premiumGold, width: 4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.15),
                                  blurRadius: 12,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Cardinal direction markers
                                const Positioned(top: 10, child: Text('N', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red, fontSize: 16))),
                                const Positioned(bottom: 10, child: Text('S', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14))),
                                const Positioned(left: 10, child: Text('W', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14))),
                                const Positioned(right: 10, child: Text('E', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 14))),
                              ],
                            ),
                          ),
                        ),

                        // Qibla Needle pointing directly to Kaaba angle
                        Transform.rotate(
                          angle: (qiblaAngle - heading) * (pi / 180),
                          child: SizedBox(
                            width: 240,
                            height: 240,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.account_balance_rounded, // Kaaba icon symbol
                                  color: AppColors.premiumGold,
                                  size: 32,
                                ),
                                Container(
                                  width: 4,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [AppColors.premiumGold, AppColors.emeraldGreen],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Center Pivot Cap
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.premiumGold,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Distance to Kaaba Info Card
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    _getDistanceLabel(lang, distanceKm),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white70 : AppColors.darkEmerald,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Calibration Note Tip Card
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.champagneGold.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline_rounded, color: AppColors.premiumGold, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          _getCalibrationTip(lang),
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.white70 : Colors.black87,
                            height: 1.35,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
