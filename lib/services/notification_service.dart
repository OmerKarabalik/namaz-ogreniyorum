import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart'; // added for Navigator
import 'prayer_times_service.dart';
import '../main.dart'; // added for navigatorKey
import '../screens/adhan_playing_screen.dart'; // added for AdhanPlayingScreen

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static bool _initialized = false;

  /// Initialize local notifications and timezone data
  static Future<void> initialize() async {
    if (_initialized) return;

    tz.initializeTimeZones();
    try {
      final timezoneInfo = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timezoneInfo.identifier));
      debugPrint('NotificationService: Local timezone set to ${timezoneInfo.identifier}');
    } catch (e) {
      debugPrint('NotificationService: Timezone init error: $e');
      try {
        final offset = DateTime.now().timeZoneOffset;
        final matching = tz.timeZoneDatabase.locations.values.where((loc) {
          return tz.TZDateTime.now(loc).timeZoneOffset == offset;
        });
        if (matching.isNotEmpty) {
          tz.setLocalLocation(matching.first);
          debugPrint('NotificationService: Fallback timezone set to ${matching.first.name}');
        }
      } catch (e2) {
        debugPrint('NotificationService: Fallback timezone offset error: $e2');
      }
    }

    const androidSettings = AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (details) {
        debugPrint('Notification clicked: ${details.payload}');
        if (details.payload != null && details.payload!.startsWith('adhan_')) {
          void navigate() {
            navigatorKey.currentState?.push(
              MaterialPageRoute(
                builder: (_) => AdhanPlayingScreen(payload: details.payload),
              ),
            );
          }

          if (navigatorKey.currentState != null) {
            navigate();
          } else {
            Future.delayed(const Duration(milliseconds: 500), navigate);
          }
        }
      },
    );

    // Create high-priority Android alarm channels explicitly
    final androidImplementation = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidImplementation != null) {
      // Clean up previous channel versions to ensure fresh settings
      for (final v in ['v10', 'v9', 'v8']) {
        for (final s in ['ezan_normal', 'ezan_fast', 'ezan_emotional', 'chime']) {
          try {
            await androidImplementation.deleteNotificationChannel('ezan_alarm_channel_${v}_$s');
          } catch (_) {}
        }
      }

      for (final soundName in ['ezan_normal', 'ezan_fast', 'ezan_emotional']) {
        await androidImplementation.createNotificationChannel(
          AndroidNotificationChannel(
            'ezan_alarm_channel_v12_$soundName',
            'Ezan & Vakit Alarmı ($soundName)',
            description: 'Namaz vakitlerinde ezan ve vakit alarmları gönderir.',
            importance: Importance.max,
            playSound: true,
            sound: RawResourceAndroidNotificationSound(soundName),
            audioAttributesUsage: AudioAttributesUsage.alarm,
            enableVibration: true,
            showBadge: true,
          ),
        );
      }
      await androidImplementation.createNotificationChannel(
        const AndroidNotificationChannel(
          'ezan_alarm_channel_v12_chime',
          'Vakit Bildirimi (Kısa Zil)',
          description: 'Namaz vakitlerinde kısa uyarı sesi çalar.',
          importance: Importance.max,
          playSound: true,
          audioAttributesUsage: AudioAttributesUsage.alarm,
          enableVibration: true,
        ),
      );
    }

    _initialized = true;
  }

  static bool _initialPayloadHandled = false;

  /// Check if app was launched via notification
  static Future<String?> checkInitialNotification() async {
    if (_initialPayloadHandled) return null; // Sadece bir kere işle
    await initialize();
    final details = await _notificationsPlugin.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      _initialPayloadHandled = true;
      return details.notificationResponse?.payload;
    }
    return null;
  }

  /// Check if notification permission is currently granted
  static Future<bool> areNotificationsEnabled() async {
    await initialize();
    final androidImplementation = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidImplementation != null) {
      final enabled = await androidImplementation.areNotificationsEnabled();
      return enabled ?? false;
    }
    return true;
  }

  /// Request notification permission on Android 13+ and iOS
  static Future<bool> requestPermissions() async {
    await initialize();
    bool allGranted = true;
    final androidImplementation = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidImplementation != null) {
      final granted = await androidImplementation.requestNotificationsPermission();
      if (granted != true) allGranted = false;

      try {
        final canExact = await androidImplementation.canScheduleExactNotifications();
        if (canExact != true) {
          await androidImplementation.requestExactAlarmsPermission();
        }
      } catch (e) {
        debugPrint('Exact alarms check error: $e');
      }
    }
    return allGranted;
  }

  /// Cancel all scheduled notifications
  static Future<void> cancelAllNotifications() async {
    await initialize();
    await _notificationsPlugin.cancelAll();
  }

  /// Schedule notifications for today's and tomorrow's prayer times
  static Future<void> schedulePrayerNotifications({
    required double latitude,
    required double longitude,
    required String cityName,
    required String lang,
    required bool isEnabled,
    required bool notifyFajr,
    required bool notifyDhuhr,
    required bool notifyAsr,
    required bool notifyMaghrib,
    required bool notifyIsha,
    required String soundType,
    String? fajrSound,
    String? dhuhrSound,
    String? asrSound,
    String? maghribSound,
    String? ishaSound,
  }) async {
    await initialize();
    await _notificationsPlugin.cancelAll();

    if (!isEnabled || soundType == 'silent') return;

    final now = DateTime.now();

    // Schedule for the next 7 days ahead (35 prayer alarms queued)
    for (int dayOffset = 0; dayOffset < 7; dayOffset++) {
      final date = now.add(Duration(days: dayOffset));
      final prayerTimes = PrayerTimesService.getPrayerTimes(
        latitude: latitude,
        longitude: longitude,
        date: date,
      );

      final list = [
        {'prayer': Prayer.fajr, 'time': prayerTimes.fajr, 'enabled': notifyFajr, 'sound': fajrSound ?? soundType, 'id': (dayOffset + 1) * 100 + 1},
        {'prayer': Prayer.dhuhr, 'time': prayerTimes.dhuhr, 'enabled': notifyDhuhr, 'sound': dhuhrSound ?? soundType, 'id': (dayOffset + 1) * 100 + 2},
        {'prayer': Prayer.asr, 'time': prayerTimes.asr, 'enabled': notifyAsr, 'sound': asrSound ?? soundType, 'id': (dayOffset + 1) * 100 + 3},
        {'prayer': Prayer.maghrib, 'time': prayerTimes.maghrib, 'enabled': notifyMaghrib, 'sound': maghribSound ?? soundType, 'id': (dayOffset + 1) * 100 + 4},
        {'prayer': Prayer.isha, 'time': prayerTimes.isha, 'enabled': notifyIsha, 'sound': ishaSound ?? soundType, 'id': (dayOffset + 1) * 100 + 5},
      ];

      for (final item in list) {
        final prayer = item['prayer'] as Prayer;
        final time = item['time'] as DateTime?;
        final enabled = item['enabled'] as bool;
        final prayerSpecificSound = item['sound'] as String;
        final notificationId = item['id'] as int;

        if (!enabled || time == null || prayerSpecificSound == 'silent') continue;
        if (time.isBefore(now)) continue;

        final title = _getNotificationTitle(prayer, lang);
        final body = _getNotificationBody(prayer, cityName, lang);

        await _scheduleSingleNotification(
          id: notificationId,
          title: title,
          body: body,
          scheduledTime: time,
          prayer: prayer,
          soundType: prayerSpecificSound,
        );
      }
    }
  }

  static Future<void> _scheduleSingleNotification({
    required int id,
    required String title,
    required String body,
    required DateTime scheduledTime,
    required Prayer prayer,
    required String soundType,
  }) async {
    final tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

    String rawSoundName = 'ezan_normal';
    if (soundType == 'fast') {
      rawSoundName = 'ezan_fast';
    } else if (soundType == 'emotional') {
      rawSoundName = 'ezan_emotional';
    } else if (soundType == 'normal') {
      rawSoundName = 'ezan_normal';
    } else if (soundType == 'auto') {
      rawSoundName = (prayer == Prayer.maghrib) ? 'ezan_fast' : 'ezan_normal';
    }

    final androidDetails = AndroidNotificationDetails(
      soundType == 'chime' ? 'ezan_alarm_channel_v12_chime' : 'ezan_alarm_channel_v12_$rawSoundName',
      'Ezan & Vakit Bildirimleri (Alarm)',
      channelDescription: 'Namaz vakitlerinde ezan ve vakit bildirimleri gönderir.',
      importance: Importance.max,
      priority: Priority.max,
      playSound: soundType != 'silent',
      sound: (soundType == 'silent' || soundType == 'chime')
          ? null
          : RawResourceAndroidNotificationSound(rawSoundName),
      category: AndroidNotificationCategory.alarm,
      fullScreenIntent: true,
      autoCancel: false,
      ongoing: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      visibility: NotificationVisibility.public,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(
        presentSound: soundType != 'silent',
        sound: (soundType == 'silent' || soundType == 'chime')
            ? null
            : '$rawSoundName.mp3',
      ),
    );

    final androidImplementation = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    bool canExact = false;
    try {
      canExact = await androidImplementation?.canScheduleExactNotifications() ?? false;
    } catch (_) {}

    // Priority 1: alarmClock (highest priority, wakes phone from deep sleep/Doze mode)
    if (canExact) {
      try {
        await _notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tzScheduledTime,
          notificationDetails,
          payload: 'adhan_${prayer.name}_$soundType',
          androidScheduleMode: AndroidScheduleMode.alarmClock,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
        return;
      } catch (e) {
        debugPrint('alarmClock schedule failed, trying exactAllowWhileIdle: $e');
      }
    }

    // Priority 2: exactAllowWhileIdle or inexact
    try {
      await _notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tzScheduledTime,
        notificationDetails,
        payload: 'adhan_${prayer.name}_$soundType',
        androidScheduleMode: canExact
            ? AndroidScheduleMode.exactAllowWhileIdle
            : AndroidScheduleMode.inexact,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      debugPrint('Error scheduling notification with exact, trying inexact fallback: $e');
      try {
        await _notificationsPlugin.zonedSchedule(
          id,
          title,
          body,
          tzScheduledTime,
          notificationDetails,
          payload: 'adhan_${prayer.name}_$soundType',
          androidScheduleMode: AndroidScheduleMode.inexact,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
        );
      } catch (e2) {
        debugPrint('Fatal scheduling error for notification $id: $e2');
      }
    }
  }

  /// Schedule a quick test notification exactly seconds from now
  static Future<void> scheduleTestNotification({
    required String soundType,
    int seconds = 10,
  }) async {
    await initialize();

    final tzScheduledTime = tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds));

    String rawSoundName = 'ezan_normal';
    if (soundType == 'fast') {
      rawSoundName = 'ezan_fast';
    } else if (soundType == 'emotional') {
      rawSoundName = 'ezan_emotional';
    } else if (soundType == 'normal') {
      rawSoundName = 'ezan_normal';
    } else if (soundType == 'auto') {
      rawSoundName = 'ezan_normal';
    }

    final androidDetails = AndroidNotificationDetails(
      soundType == 'chime' ? 'ezan_alarm_channel_v12_chime' : 'ezan_alarm_channel_v12_$rawSoundName',
      'Ezan & Vakit Bildirimleri (Alarm)',
      channelDescription: 'Namaz vakitlerinde ezan ve vakit bildirimleri gönderir.',
      importance: Importance.max,
      priority: Priority.max,
      playSound: true,
      sound: soundType == 'chime' ? null : RawResourceAndroidNotificationSound(rawSoundName),
      category: AndroidNotificationCategory.alarm,
      fullScreenIntent: true,
      autoCancel: false,
      ongoing: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      visibility: NotificationVisibility.public,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(
        presentSound: true,
        sound: soundType == 'chime' ? null : '$rawSoundName.mp3',
      ),
    );

    final androidImplementation = _notificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    bool canExact = false;
    try {
      canExact = await androidImplementation?.canScheduleExactNotifications() ?? false;
      if (!canExact) {
        await androidImplementation?.requestExactAlarmsPermission();
        canExact = await androidImplementation?.canScheduleExactNotifications() ?? false;
      }
    } catch (_) {}

    try {
      await _notificationsPlugin.zonedSchedule(
        999,
        '🕌 Ezan Vakti Alarm Testi',
        '$seconds saniyelik test tamamlandı. Vakit girdi!',
        tzScheduledTime,
        notificationDetails,
        payload: 'adhan_test_$soundType',
        androidScheduleMode: canExact ? AndroidScheduleMode.alarmClock : AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    } catch (e) {
      debugPrint('scheduleTestNotification fallback: $e');
      await _notificationsPlugin.zonedSchedule(
        999,
        '🕌 Ezan Vakti Alarm Testi',
        '$seconds saniyelik test tamamlandı. Vakit girdi!',
        tzScheduledTime,
        notificationDetails,
        payload: 'adhan_test_$soundType',
        androidScheduleMode: AndroidScheduleMode.inexact,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  /// Show an instant test notification
  static Future<void> showInstantTestNotification({
    required String soundType,
  }) async {
    await initialize();
    
    String rawSoundName = 'ezan_normal';
    if (soundType == 'fast') rawSoundName = 'ezan_fast';
    else if (soundType == 'emotional') rawSoundName = 'ezan_emotional';
    else if (soundType == 'normal') rawSoundName = 'ezan_normal';
    else if (soundType == 'auto') rawSoundName = 'ezan_normal';

    final androidDetails = AndroidNotificationDetails(
      soundType == 'chime' ? 'ezan_alarm_channel_v12_chime' : 'ezan_alarm_channel_v12_$rawSoundName',
      'Ezan & Vakit Bildirimleri (Test)',
      channelDescription: 'Test için anında bildirim kanalı.',
      importance: Importance.max,
      priority: Priority.max,
      playSound: soundType != 'silent',
      sound: (soundType == 'silent' || soundType == 'chime')
          ? null
          : RawResourceAndroidNotificationSound(rawSoundName),
      category: AndroidNotificationCategory.alarm,
      fullScreenIntent: true,
      autoCancel: false,
      ongoing: true,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      visibility: NotificationVisibility.public,
    );

    final notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: DarwinNotificationDetails(
        presentSound: soundType != 'silent',
        sound: (soundType == 'silent' || soundType == 'chime') ? null : '$rawSoundName.mp3',
      ),
    );

    try {
      await _notificationsPlugin.show(
        998,
        '🕌 Anında Ezan Testi',
        'Bildirim ve ezan sesi başarıyla test edildi.',
        notificationDetails,
        payload: 'adhan_test_$soundType',
      );
    } catch (e) {
      debugPrint('Error showing instant notification: $e');
    }
  }

  static String _getPrayerName(Prayer prayer, String lang) {
    switch (prayer) {
      case Prayer.fajr:
        return lang == 'tr' ? 'İmsak / Sabah' : lang == 'id' ? 'Subuh' : lang == 'ru' ? 'Фаджр' : lang == 'ur' ? 'فجر' : 'Fajr';
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

  static String _getNotificationTitle(Prayer prayer, String lang) {
    final pName = _getPrayerName(prayer, lang);
    switch (lang) {
      case 'tr': return '🕌 Ezan Vakti - $pName';
      case 'de': return '🕌 Gebetszeit - $pName';
      case 'fr': return '🕌 Heure de prière - $pName';
      case 'es': return '🕌 Hora de oración - $pName';
      case 'id': return '🕌 Waktu Sholat - $pName';
      case 'ru': return '🕌 Время намаза - $pName';
      case 'it': return '🕌 Ora di preghiera - $pName';
      case 'ur': return '🕌 وقتِ نماز - $pName';
      default: return '🕌 Prayer Time - $pName';
    }
  }

  static String _getNotificationBody(Prayer prayer, String cityName, String lang) {
    final pName = _getPrayerName(prayer, lang);
    switch (lang) {
      case 'tr': return '$cityName için $pName namazı vakti girdi. Haydi namaza!';
      case 'de': return 'Es ist Zeit für das $pName-Gebet in $cityName.';
      case 'fr': return 'C\'est l\'heure de la prière de $pName à $cityName.';
      case 'es': return 'Es hora de la oración de $pName en $cityName.';
      case 'id': return 'Waktu sholat $pName di $cityName telah tiba.';
      case 'ru': return 'Наступило время намаза $pName для $cityName.';
      case 'it': return 'È ora della preghiera di $pName a $cityName.';
      case 'ur': return '$cityName کے لیے $pName کا وقت ہو گیا ہے۔';
      default: return 'It is time for $pName prayer in $cityName.';
    }
  }
}
