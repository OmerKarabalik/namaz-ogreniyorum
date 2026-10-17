import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/prayer_models.dart';
import '../data/localization_data.dart';
import '../services/notification_service.dart';

class AppProvider extends ChangeNotifier {
  Mezhep _selectedMezhep = Mezhep.hanafi;
  Gender _selectedGender = Gender.male;
  bool _isDarkMode = false;
  bool _setupCompleted = false;
  String _languageCode = 'tr';

  double _userLatitude = 41.0082;
  double _userLongitude = 28.9784;
  String _userCityName = 'İstanbul';
  bool _isGpsActive = false;

  Mezhep get selectedMezhep => _selectedMezhep;
  Gender get selectedGender => _selectedGender;
  bool get isDarkMode => _isDarkMode;
  bool get setupCompleted => _setupCompleted;
  String get languageCode => _languageCode;

  double get userLatitude => _userLatitude;
  double get userLongitude => _userLongitude;
  String get userCityName => userCityDisplayName;
  String get rawUserCityName => _userCityName;
  bool get isGpsActive => _isGpsActive;

  String get userCityDisplayName {
    if (_isGpsActive ||
        _userCityName.contains('Mevcut Konum') ||
        _userCityName.contains('Current Location') ||
        _userCityName.contains('Location (GPS)')) {
      switch (_languageCode) {
        case 'tr':
          return 'Mevcut Konum (GPS)';
        case 'de':
          return 'Aktueller Standort (GPS)';
        case 'fr':
          return 'Emplacement actuel (GPS)';
        case 'es':
          return 'Ubicación actual (GPS)';
        case 'id':
          return 'Lokasi Saat Ini (GPS)';
        case 'ru':
          return 'Текущее местоположение (GPS)';
        case 'it':
          return 'Posizione attuale (GPS)';
        case 'ur':
          return 'موجودہ مقام (GPS)';
        default:
          return 'Current Location (GPS)';
      }
    }
    return _userCityName;
  }

  bool _isNotificationsEnabled = true;
  bool _notifyFajr = true;
  bool _notifyDhuhr = true;
  bool _notifyAsr = true;
  bool _notifyMaghrib = true;
  bool _notifyIsha = true;
  String _adhanSoundType = 'normal'; // 'normal', 'fast', 'emotional', 'auto', 'chime', 'silent'

  String _fajrSound = 'normal';
  String _dhuhrSound = 'normal';
  String _asrSound = 'normal';
  String _maghribSound = 'normal';
  String _ishaSound = 'normal';

  bool get isNotificationsEnabled => _isNotificationsEnabled;
  bool get notifyFajr => _notifyFajr;
  bool get notifyDhuhr => _notifyDhuhr;
  bool get notifyAsr => _notifyAsr;
  bool get notifyMaghrib => _notifyMaghrib;
  bool get notifyIsha => _notifyIsha;
  String get adhanSoundType => _adhanSoundType;

  String get fajrSound => _fajrSound;
  String get dhuhrSound => _dhuhrSound;
  String get asrSound => _asrSound;
  String get maghribSound => _maghribSound;
  String get ishaSound => _ishaSound;

  AppProvider() {
    _loadPreferences();
  }

  // Load preferences from Shared Preferences
  Future<void> _loadPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      
      // Load Mezhep
      final mezhepIndex = prefs.getInt('selected_mezhep');
      if (mezhepIndex != null && mezhepIndex < Mezhep.values.length) {
        _selectedMezhep = Mezhep.values[mezhepIndex];
      }
      
      // Load Gender
      final genderIndex = prefs.getInt('selected_gender');
      if (genderIndex != null && genderIndex < Gender.values.length) {
        _selectedGender = Gender.values[genderIndex];
      }

      // Load Dark Mode
      _isDarkMode = prefs.getBool('is_dark_mode') ?? false;
      
      // Load Setup Completed
      _setupCompleted = prefs.getBool('setup_completed') ?? false;
      
      // Load Language (default to device system language if supported, otherwise Turkish)
      final savedLang = prefs.getString('language_code');
      if (savedLang != null) {
        _languageCode = savedLang;
      } else {
        final sysLang = PlatformDispatcher.instance.locale.languageCode.toLowerCase();
        const supported = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];
        _languageCode = supported.contains(sysLang) ? sysLang : 'tr';
      }

      // Load User Location
      _userLatitude = prefs.getDouble('user_latitude') ?? 41.0082;
      _userLongitude = prefs.getDouble('user_longitude') ?? 28.9784;
      _userCityName = prefs.getString('user_city_name') ?? 'İstanbul';
      _isGpsActive = prefs.getBool('is_gps_active') ?? false;

      // Load Notification Settings
      _isNotificationsEnabled = prefs.getBool('notif_enabled') ?? true;
      _notifyFajr = prefs.getBool('notif_fajr') ?? true;
      _notifyDhuhr = prefs.getBool('notif_dhuhr') ?? true;
      _notifyAsr = prefs.getBool('notif_asr') ?? true;
      _notifyMaghrib = prefs.getBool('notif_maghrib') ?? true;
      _notifyIsha = prefs.getBool('notif_isha') ?? true;
      _adhanSoundType = prefs.getString('adhan_sound_type') ?? 'normal';

      _fajrSound = prefs.getString('sound_fajr') ?? 'normal';
      _dhuhrSound = prefs.getString('sound_dhuhr') ?? 'normal';
      _asrSound = prefs.getString('sound_asr') ?? 'normal';
      _maghribSound = prefs.getString('sound_maghrib') ?? 'normal';
      _ishaSound = prefs.getString('sound_isha') ?? 'normal';
      
      notifyListeners();
      reschedulePrayerNotifications();
    } catch (e) {
      debugPrint('Error loading preferences: $e');
    }
  }

  // Save and set Language
  Future<void> setLanguageCode(String code) async {
    _languageCode = code;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('language_code', code);
    } catch (e) {
      debugPrint('Error saving language preference: $e');
    }
  }

  // Helper method for UI translations
  String translate(String key) {
    if (LocalizationData.translations[_languageCode]?.containsKey(key) ?? false) {
      return LocalizationData.translations[_languageCode]![key]!;
    }
    // Fallback to Turkish
    if (LocalizationData.translations['tr']?.containsKey(key) ?? false) {
      return LocalizationData.translations['tr']![key]!;
    }
    return key;
  }

  // Save and set Mezhep
  Future<void> setSelectedMezhep(Mezhep mezhep) async {
    _selectedMezhep = mezhep;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('selected_mezhep', mezhep.index);
    } catch (e) {
      debugPrint('Error saving mezhep preference: $e');
    }
  }

  // Save and set Gender
  Future<void> setSelectedGender(Gender gender) async {
    _selectedGender = gender;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('selected_gender', gender.index);
    } catch (e) {
      debugPrint('Error saving gender preference: $e');
    }
  }

  // Save and toggle Theme
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('is_dark_mode', _isDarkMode);
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
    }
  }

  // Save setup completed status
  Future<void> setSetupCompleted(bool completed) async {
    _setupCompleted = completed;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('setup_completed', completed);
    } catch (e) {
      debugPrint('Error saving setup completed preference: $e');
    }
  }

  // Save and update User Location
  Future<void> setUserLocation({
    required double lat,
    required double lng,
    required String cityName,
    required bool isGps,
  }) async {
    _userLatitude = lat;
    _userLongitude = lng;
    _userCityName = cityName;
    _isGpsActive = isGps;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('user_latitude', lat);
      await prefs.setDouble('user_longitude', lng);
      await prefs.setString('user_city_name', cityName);
      await prefs.setBool('is_gps_active', isGps);
    } catch (e) {
      debugPrint('Error saving location preference: $e');
    }
    reschedulePrayerNotifications();
  }

  // Update Notification Settings
  Future<void> setNotificationSettings({
    bool? isEnabled,
    bool? fajr,
    bool? dhuhr,
    bool? asr,
    bool? maghrib,
    bool? isha,
    String? soundType,
  }) async {
    if (isEnabled != null) _isNotificationsEnabled = isEnabled;
    if (fajr != null) _notifyFajr = fajr;
    if (dhuhr != null) _notifyDhuhr = dhuhr;
    if (asr != null) _notifyAsr = asr;
    if (maghrib != null) _notifyMaghrib = maghrib;
    if (isha != null) _notifyIsha = isha;
    if (soundType != null) _adhanSoundType = soundType;

    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('notif_enabled', _isNotificationsEnabled);
      await prefs.setBool('notif_fajr', _notifyFajr);
      await prefs.setBool('notif_dhuhr', _notifyDhuhr);
      await prefs.setBool('notif_asr', _notifyAsr);
      await prefs.setBool('notif_maghrib', _notifyMaghrib);
      await prefs.setBool('notif_isha', _notifyIsha);
      await prefs.setString('adhan_sound_type', _adhanSoundType);
    } catch (e) {
      debugPrint('Error saving notification preferences: $e');
    }
    reschedulePrayerNotifications();
  }

  // Update Per-Prayer Sound Settings
  Future<void> setPrayerSound({
    String? fajr,
    String? dhuhr,
    String? asr,
    String? maghrib,
    String? isha,
  }) async {
    if (fajr != null) _fajrSound = fajr;
    if (dhuhr != null) _dhuhrSound = dhuhr;
    if (asr != null) _asrSound = asr;
    if (maghrib != null) _maghribSound = maghrib;
    if (isha != null) _ishaSound = isha;

    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('sound_fajr', _fajrSound);
      await prefs.setString('sound_dhuhr', _dhuhrSound);
      await prefs.setString('sound_asr', _asrSound);
      await prefs.setString('sound_maghrib', _maghribSound);
      await prefs.setString('sound_isha', _ishaSound);
    } catch (e) {
      debugPrint('Error saving per-prayer sound preference: $e');
    }

    reschedulePrayerNotifications();
  }

  // Reschedule all prayer notifications automatically
  Future<void> reschedulePrayerNotifications() async {
    if (!_isNotificationsEnabled) return;
    try {
      await NotificationService.schedulePrayerNotifications(
        latitude: _userLatitude,
        longitude: _userLongitude,
        cityName: _userCityName,
        lang: _languageCode,
        isEnabled: _isNotificationsEnabled,
        notifyFajr: _notifyFajr,
        notifyDhuhr: _notifyDhuhr,
        notifyAsr: _notifyAsr,
        notifyMaghrib: _notifyMaghrib,
        notifyIsha: _notifyIsha,
        soundType: _adhanSoundType,
        fajrSound: _fajrSound,
        dhuhrSound: _dhuhrSound,
        asrSound: _asrSound,
        maghribSound: _maghribSound,
        ishaSound: _ishaSound,
      );
      debugPrint('Prayer notifications successfully scheduled for today and tomorrow.');
    } catch (e) {
      debugPrint('Error rescheduling prayer notifications: $e');
    }
  }
}


