import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';

class NotificationSettingsSheet extends StatefulWidget {
  const NotificationSettingsSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const NotificationSettingsSheet(),
    );
  }

  @override
  State<NotificationSettingsSheet> createState() => _NotificationSettingsSheetState();
}

class _NotificationSettingsSheetState extends State<NotificationSettingsSheet> {
  final AudioPlayer _previewPlayer = AudioPlayer();
  bool _isPlayingPreview = false;
  String? _currentlyPlayingSound;
  bool _notificationsAllowed = true;

  @override
  void initState() {
    super.initState();
    _checkPermissionStatus();
    _previewPlayer.onPlayerComplete.listen((_) {
      if (mounted) {
        setState(() {
          _isPlayingPreview = false;
          _currentlyPlayingSound = null;
        });
      }
    });
  }

  Future<void> _checkPermissionStatus() async {
    final allowed = await NotificationService.areNotificationsEnabled();
    if (mounted) {
      setState(() {
        _notificationsAllowed = allowed;
      });
    }
  }

  @override
  void dispose() {
    _previewPlayer.dispose();
    super.dispose();
  }

  Future<void> _toggleAudioPreview(String soundType) async {
    if (_isPlayingPreview && _currentlyPlayingSound == soundType) {
      await _previewPlayer.stop();
      setState(() {
        _isPlayingPreview = false;
        _currentlyPlayingSound = null;
      });
      return;
    }

    await _previewPlayer.stop();
    setState(() {
      _isPlayingPreview = true;
      _currentlyPlayingSound = soundType;
    });

    try {
      if (soundType == 'normal' || soundType == 'auto') {
        await _previewPlayer.play(AssetSource('audio/ezan_normal.mp3'));
      } else if (soundType == 'fast') {
        await _previewPlayer.play(AssetSource('audio/ezan_fast.mp3'));
      } else if (soundType == 'emotional') {
        await _previewPlayer.play(AssetSource('audio/ezan_emotional.mp3'));
      } else if (soundType == 'chime') {
        await _previewPlayer.play(AssetSource('audio/click.mp3'));
      }
    } catch (e) {
      debugPrint('Error playing preview: $e');
      if (mounted) {
        setState(() {
          _isPlayingPreview = false;
          _currentlyPlayingSound = null;
        });
      }
    }
  }

  String _getTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Ezan & Bildirim Ayarları';
      case 'de': return 'Ezan & Benachrichtigungen';
      case 'fr': return 'Paramètres d\'Adhan & Notifications';
      case 'es': return 'Ajustes de Adhan y Notificaciones';
      case 'id': return 'Pengaturan Adzan & Notifikasi';
      case 'ru': return 'Настройки Азана и Уведомлений';
      case 'it': return 'Impostazioni Adhan e Notifiche';
      case 'ur': return 'اذان اور اطلاعات کی ترجیحات';
      default: return 'Adhan & Notification Settings';
    }
  }

  String _getSubtitle(String lang) {
    switch (lang) {
      case 'tr': return 'Namaz vakitlerinde ezan ve sesli bildirimler alın.';
      case 'de': return 'Erhalten Sie Gebetszeit-Benachrichtigungen mit Ezan-Ton.';
      case 'fr': return 'Recevez des notifications sonores aux heures de prière.';
      case 'es': return 'Reciba notificaciones sonoras en los horarios de oración.';
      case 'id': return 'Dapatkan notifikasi suara adzan pada waktu shalat.';
      case 'ru': return 'Получайте звуковые уведомления во время намаза.';
      case 'it': return 'Ricevi notifiche sonore agli orari delle preghiere.';
      case 'ur': return 'نماز کے اوقات میں اذان کی آواز کی اطلاعات حاصل کریں۔';
      default: return 'Receive sound notifications at exact prayer times.';
    }
  }

  String _getMasterToggleLabel(String lang) {
    switch (lang) {
      case 'tr': return 'Namaz Vakti Bildirimleri';
      case 'de': return 'Gebetszeit-Benachrichtigungen';
      case 'fr': return 'Notifications d\'heure de prière';
      case 'es': return 'Notificaciones de horarios';
      case 'id': return 'Notifikasi Waktu Shalat';
      case 'ru': return 'Уведомления о времени намаза';
      case 'it': return 'Notifiche orario preghiera';
      case 'ur': return 'نماز کے اوقات کی اطلاعات';
      default: return 'Prayer Time Notifications';
    }
  }

  String _getPresetsSectionTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Hızlı Preset / Genel Ezan Seçimi';
      case 'de': return 'Schnell-Preset / Allgemeiner Ezan';
      case 'fr': return 'Préréglage rapide / Adhan général';
      case 'es': return 'Ajuste rápido / Adhan general';
      case 'id': return 'Preset Cepat / Adzan Umum';
      case 'ru': return 'Быстрый пресет / Общий Азан';
      case 'it': return 'Preset rapido / Adhan generale';
      case 'ur': return 'فوری پریسیٹ / عمومی اذان';
      default: return 'Quick Presets / Global Adhan';
    }
  }

  String _getPrayersSectionTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Vakitlere Özel Ezan & Bildirim Ayarları';
      case 'de': return 'Zeitspezifische Ezan-Einstellungen';
      case 'fr': return 'Réglages d\'Adhan par prière';
      case 'es': return 'Ajustes de Adhan por oración';
      case 'id': return 'Pengaturan Adzan per Waktu Shalat';
      case 'ru': return 'Индивидуальные настройки Азана';
      case 'it': return 'Impostazioni Adhan per singola preghiera';
      case 'ur': return 'ہر نماز کے لیے مخصوص اذان';
      default: return 'Per-Prayer Adhan & Sound Settings';
    }
  }

  String _getSaveButtonText(String lang) {
    switch (lang) {
      case 'tr': return 'Kaydet & Vakitleri Zamanla';
      case 'de': return 'Speichern & Zeitplan anwenden';
      case 'fr': return 'Enregistrer et planifier';
      case 'es': return 'Guardar y programar';
      case 'id': return 'Simpan & Jadwalkan';
      case 'ru': return 'Сохранить и запланировать';
      case 'it': return 'Salva e pianifica';
      case 'ur': return 'محفوظ کریں اور اوقات مقرر کریں';
      default: return 'Save & Schedule Notifications';
    }
  }

  String _getSoundName(String soundKey, String lang) {
    switch (soundKey) {
      case 'normal':
        switch (lang) {
          case 'tr': return 'Normal Makamlı Ezan';
          case 'de': return 'Normaler Melodischer Ezan';
          case 'fr': return 'Adhan Mélodique Normal';
          case 'es': return 'Adhan Melódico Normal';
          case 'id': return 'Adzan Merdu Normal';
          case 'ru': return 'Обычный азан';
          case 'it': return 'Adhan Melodico Normale';
          case 'ur': return 'عام اذان';
          default: return 'Normal Melodic Adhan';
        }
      case 'fast':
        switch (lang) {
          case 'tr': return 'Hızlı Ezan (Akşam Vakti Uyumlu)';
          case 'de': return 'Schneller Ezan (Maghrib Tempo)';
          case 'fr': return 'Adhan Rapide (Maghrib Tempo)';
          case 'es': return 'Adhan Rápido (Maghrib Tempo)';
          case 'id': return 'Adzan Cepat (Maghrib)';
          case 'ru': return 'Быстрый азан';
          case 'it': return 'Adhan Rapido (Maghrib)';
          case 'ur': return 'تیز رفتار اذان';
          default: return 'Fast Adhan (Maghrib Tempo)';
        }
      case 'emotional':
        switch (lang) {
          case 'tr': return 'Duygusal Ezan';
          case 'de': return 'Gefühlvoller Ezan';
          case 'fr': return 'Adhan Émotionnel';
          case 'es': return 'Adhan Emotivo';
          case 'id': return 'Adzan Syahdu';
          case 'ru': return 'Душевный азан';
          case 'it': return 'Adhan Emozionante';
          case 'ur': return 'رقت انگیز اذان';
          default: return 'Emotional Heartfelt Adhan';
        }
      case 'chime':
        switch (lang) {
          case 'tr': return 'Zil / Bip Sesi';
          case 'de': return 'Sanfter Glockenton';
          case 'fr': return 'Carillon doux';
          case 'es': return 'Tono suave';
          case 'id': return 'Nada Bip Halus';
          case 'ru': return 'Звуковой сигнал';
          case 'it': return 'Cinefilo / Bip';
          case 'ur': return 'گھنٹی / بیپ';
          default: return 'Soft Chime / Beep';
        }
      case 'silent':
        switch (lang) {
          case 'tr': return 'Sessiz / Yalnızca Titreşim';
          case 'de': return 'Stumm / Nur Vibration';
          case 'fr': return 'Silencieux / Vibreur';
          case 'es': return 'Silencioso / Solo vibración';
          case 'id': return 'Hening / Getar Saja';
          case 'ru': return 'Без звука / Вибрация';
          case 'it': return 'Silenzioso / Solo vibrazione';
          case 'ur': return 'خاموش / صرف وائبریشن';
          default: return 'Silent / Vibration Only';
        }
      default:
        return soundKey;
    }
  }

  String _getSoundSelectionTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Ezan Sesi Seçimi';
      case 'de': return 'Ezan-Tonauswahl';
      case 'fr': return 'Sélection du son d\'Adhan';
      case 'es': return 'Selección de sonido de Adhan';
      case 'id': return 'Pilihan Suara Adzan';
      case 'ru': return 'Выбор звука Азана';
      case 'it': return 'Selezione suono Adhan';
      case 'ur': return 'اذان کی آواز کا انتخاب';
      default: return 'Adhan Sound Selection';
    }
  }

  void _showPrayerSoundPickerModal({
    required BuildContext context,
    required String prayerTitle,
    required String currentSound,
    required Function(String) onSoundSelected,
    required String lang,
    required bool isDark,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF14221E) : Colors.white,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white24 : Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '$prayerTitle - ${_getSoundSelectionTitle(lang)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.darkEmerald,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...['normal', 'fast', 'emotional', 'chime', 'silent'].map((soundId) {
                    final isSelected = currentSound == soundId;
                    final isPlaying = _isPlayingPreview && _currentlyPlayingSound == soundId;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? (isDark ? const Color(0xFF1E4D3E) : const Color(0xFFE8F5E9))
                            : (isDark ? Colors.white.withOpacity(0.04) : Colors.grey.shade50),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected ? AppColors.premiumGold : (isDark ? Colors.white10 : Colors.grey.shade200),
                          width: isSelected ? 1.5 : 1.0,
                        ),
                      ),
                      child: ListTile(
                        onTap: () {
                          onSoundSelected(soundId);
                          Navigator.pop(ctx);
                        },
                        leading: Icon(
                          soundId == 'fast'
                              ? Icons.bolt_rounded
                              : soundId == 'emotional'
                                  ? Icons.favorite_rounded
                                  : soundId == 'chime'
                                      ? Icons.music_note_rounded
                                      : soundId == 'silent'
                                          ? Icons.vibration_rounded
                                          : Icons.volume_up_rounded,
                          color: isSelected ? AppColors.premiumGold : Colors.grey,
                        ),
                        title: Text(
                          _getSoundName(soundId, lang),
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                            fontSize: 13.5,
                            color: isDark ? Colors.white : AppColors.darkEmerald,
                          ),
                        ),
                        trailing: soundId == 'silent'
                            ? (isSelected ? const Icon(Icons.check_circle_rounded, color: AppColors.premiumGold) : null)
                            : Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isPlaying ? Icons.stop_circle_rounded : Icons.play_circle_fill_rounded,
                                      color: AppColors.premiumGold,
                                      size: 26,
                                    ),
                                    onPressed: () async {
                                      await _toggleAudioPreview(soundId);
                                      setModalState(() {});
                                    },
                                  ),
                                  if (isSelected)
                                    const Icon(Icons.check_circle_rounded, color: AppColors.premiumGold),
                                ],
                              ),
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.languageCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF121E1A) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 16,
        bottom: MediaQuery.of(context).padding.bottom + 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Drag Handle Bar
          Center(
            child: Container(
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                color: isDark ? Colors.white24 : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Header Container with Emerald Gradient
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: isDark
                    ? [const Color(0xFF0F382C), const Color(0xFF062018)]
                    : [AppColors.darkEmerald, const Color(0xFF0A4034)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.premiumGold.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.notifications_active_rounded, color: AppColors.premiumGold, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getTitle(lang),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getSubtitle(lang),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!_notificationsAllowed) ...[
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: Colors.red.shade200),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.warning_amber_rounded, color: Colors.red, size: 24),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              lang == 'tr'
                                  ? 'Cihaz bildirim izni kapalı! Ezanın çalabilmesi için izin vermelisiniz.'
                                  : 'Notification permission is disabled! Please allow to hear Adhan.',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () async {
                              await NotificationService.requestPermissions();
                              await _checkPermissionStatus();
                            },
                            child: Text(
                              lang == 'tr' ? 'İzin Ver' : 'Allow',
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  // Master Switch Card
                  Container(
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: appProvider.isNotificationsEnabled
                            ? AppColors.premiumGold
                            : (isDark ? Colors.white10 : Colors.grey.shade200),
                        width: appProvider.isNotificationsEnabled ? 1.5 : 1.0,
                      ),
                    ),
                    child: SwitchListTile(
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.emeraldGreen,
                      inactiveThumbColor: Colors.grey.shade400,
                      inactiveTrackColor: isDark ? Colors.white12 : Colors.grey.shade300,
                      value: appProvider.isNotificationsEnabled,
                      title: Text(
                        _getMasterToggleLabel(lang),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: isDark ? Colors.white : AppColors.darkEmerald,
                        ),
                      ),
                      secondary: Icon(
                        appProvider.isNotificationsEnabled
                            ? Icons.notifications_on_rounded
                            : Icons.notifications_off_rounded,
                        color: appProvider.isNotificationsEnabled ? AppColors.premiumGold : Colors.grey,
                      ),
                      onChanged: (val) {
                        appProvider.setNotificationSettings(isEnabled: val);
                      },
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Test Notification & Alarm Card
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkSurface : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.champagneGold.withOpacity(0.35),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.speed_rounded, color: AppColors.premiumGold, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              lang == 'tr' ? 'Bildirim ve Ezan Testi' : 'Notification & Adhan Test',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.5,
                                color: isDark ? Colors.white : AppColors.darkEmerald,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.emeraldGreen,
                                  side: const BorderSide(color: AppColors.emeraldGreen),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                ),
                                icon: const Icon(Icons.notifications_active, size: 16),
                                label: Text(
                                  lang == 'tr' ? 'Anında Çal' : 'Play Now',
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  await NotificationService.requestPermissions();
                                  await _checkPermissionStatus();
                                  await NotificationService.showInstantTestNotification(
                                    soundType: appProvider.adhanSoundType,
                                  );
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          lang == 'tr' ? '⚡ Test bildirimi gönderildi!' : '⚡ Test notification sent!',
                                        ),
                                        duration: const Duration(seconds: 2),
                                        backgroundColor: AppColors.emeraldGreen,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.emeraldGreen,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                ),
                                icon: const Icon(Icons.timer_outlined, size: 16),
                                label: Text(
                                  lang == 'tr' ? '10sn Alarm' : '10s Alarm',
                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                                onPressed: () async {
                                  await NotificationService.requestPermissions();
                                  await _checkPermissionStatus();
                                  await NotificationService.scheduleTestNotification(
                                    soundType: appProvider.adhanSoundType,
                                    seconds: 10,
                                  );
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          lang == 'tr'
                                              ? '⏳ Test alarmı kuruldu! Ekranı kilitleyip 10 saniye bekleyin.'
                                              : '⏳ Test alarm set! Lock screen and wait 10 seconds.',
                                        ),
                                        duration: const Duration(seconds: 5),
                                        backgroundColor: AppColors.emeraldGreen,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  if (appProvider.isNotificationsEnabled) ...[
                    // Quick Presets Section
                    Text(
                      _getPresetsSectionTitle(lang),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                      ),
                    ),
                    const SizedBox(height: 10),

                    _buildPresetOptionTile(
                      id: 'auto',
                      title: lang == 'tr' ? 'Otomatik (Akşam Hızlı Ezan, Diğerleri Normal) ⭐' : 'Automatic (Maghrib Fast Adhan, Others Normal) ⭐',
                      subtitle: lang == 'tr' ? 'Akşam namazında hızlı ezan, diğer vakitlerde makamlı ezan okunur.' : 'Plays fast Adhan for Maghrib, normal Adhan for other prayers.',
                      icon: Icons.auto_awesome_rounded,
                      appProvider: appProvider,
                      isDark: isDark,
                      onSelect: () {
                        appProvider.setNotificationSettings(soundType: 'auto');
                        appProvider.setPrayerSound(
                          fajr: 'normal',
                          dhuhr: 'normal',
                          asr: 'normal',
                          maghrib: 'fast',
                          isha: 'normal',
                        );
                      },
                    ),
                    const SizedBox(height: 8),

                    _buildPresetOptionTile(
                      id: 'normal',
                      title: _getSoundName('normal', lang),
                      subtitle: lang == 'tr' ? 'Tüm vakitlerde geleneksel makamlı ezan okunur.' : 'Traditional melodic Adhan for all prayers.',
                      icon: Icons.volume_up_rounded,
                      appProvider: appProvider,
                      isDark: isDark,
                      onSelect: () {
                        appProvider.setNotificationSettings(soundType: 'normal');
                        appProvider.setPrayerSound(
                          fajr: 'normal',
                          dhuhr: 'normal',
                          asr: 'normal',
                          maghrib: 'normal',
                          isha: 'normal',
                        );
                      },
                    ),
                    const SizedBox(height: 8),

                    _buildPresetOptionTile(
                      id: 'fast',
                      title: _getSoundName('fast', lang),
                      subtitle: lang == 'tr' ? 'Tüm vakitlerde hızlı tempo ezan okunur.' : 'Faster tempo Adhan for all prayers.',
                      icon: Icons.bolt_rounded,
                      appProvider: appProvider,
                      isDark: isDark,
                      onSelect: () {
                        appProvider.setNotificationSettings(soundType: 'fast');
                        appProvider.setPrayerSound(
                          fajr: 'fast',
                          dhuhr: 'fast',
                          asr: 'fast',
                          maghrib: 'fast',
                          isha: 'fast',
                        );
                      },
                    ),
                    const SizedBox(height: 8),

                    _buildPresetOptionTile(
                      id: 'emotional',
                      title: _getSoundName('emotional', lang),
                      subtitle: lang == 'tr' ? 'Tüm vakitlerde huzur veren duygusal ezan okunur.' : 'Soul-soothing emotional Adhan for all prayers.',
                      icon: Icons.favorite_rounded,
                      appProvider: appProvider,
                      isDark: isDark,
                      onSelect: () {
                        appProvider.setNotificationSettings(soundType: 'emotional');
                        appProvider.setPrayerSound(
                          fajr: 'emotional',
                          dhuhr: 'emotional',
                          asr: 'emotional',
                          maghrib: 'emotional',
                          isha: 'emotional',
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // Per-Prayer Sound Settings Section
                    Text(
                      _getPrayersSectionTitle(lang),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Fajr Sound Card
                    _buildPrayerSoundCard(
                      prayerKey: 'fajr',
                      prayerName: lang == 'tr' ? 'İmsak / Sabah Namazı' : lang == 'id' ? 'Shalat Subuh' : lang == 'ru' ? 'Намаз Фаджр' : lang == 'ur' ? 'نمازِ فجر' : 'Fajr Prayer',
                      isEnabled: appProvider.notifyFajr,
                      currentSound: appProvider.fajrSound,
                      appProvider: appProvider,
                      isDark: isDark,
                      lang: lang,
                      onToggle: (val) => appProvider.setNotificationSettings(fajr: val),
                      onSoundSelected: (snd) => appProvider.setPrayerSound(fajr: snd),
                    ),
                    const SizedBox(height: 8),

                    // Dhuhr Sound Card
                    _buildPrayerSoundCard(
                      prayerKey: 'dhuhr',
                      prayerName: lang == 'tr' ? 'Öğle Namazı' : lang == 'id' ? 'Shalat Dzuhur' : lang == 'ru' ? 'Намаз Зухр' : lang == 'ur' ? 'نمازِ ظہر' : 'Dhuhr Prayer',
                      isEnabled: appProvider.notifyDhuhr,
                      currentSound: appProvider.dhuhrSound,
                      appProvider: appProvider,
                      isDark: isDark,
                      lang: lang,
                      onToggle: (val) => appProvider.setNotificationSettings(dhuhr: val),
                      onSoundSelected: (snd) => appProvider.setPrayerSound(dhuhr: snd),
                    ),
                    const SizedBox(height: 8),

                    // Asr Sound Card
                    _buildPrayerSoundCard(
                      prayerKey: 'asr',
                      prayerName: lang == 'tr' ? 'İkindi Namazı' : lang == 'id' ? 'Shalat Ashar' : lang == 'ru' ? 'Намаз Аср' : lang == 'ur' ? 'نمازِ عصر' : 'Asr Prayer',
                      isEnabled: appProvider.notifyAsr,
                      currentSound: appProvider.asrSound,
                      appProvider: appProvider,
                      isDark: isDark,
                      lang: lang,
                      onToggle: (val) => appProvider.setNotificationSettings(asr: val),
                      onSoundSelected: (snd) => appProvider.setPrayerSound(asr: snd),
                    ),
                    const SizedBox(height: 8),

                    // Maghrib Sound Card
                    _buildPrayerSoundCard(
                      prayerKey: 'maghrib',
                      prayerName: lang == 'tr' ? 'Akşam Namazı' : lang == 'id' ? 'Shalat Maghrib' : lang == 'ru' ? 'Намаз Магриб' : lang == 'ur' ? 'نمازِ مغرب' : 'Maghrib Prayer',
                      isEnabled: appProvider.notifyMaghrib,
                      currentSound: appProvider.maghribSound,
                      appProvider: appProvider,
                      isDark: isDark,
                      lang: lang,
                      onToggle: (val) => appProvider.setNotificationSettings(maghrib: val),
                      onSoundSelected: (snd) => appProvider.setPrayerSound(maghrib: snd),
                    ),
                    const SizedBox(height: 8),

                    // Isha Sound Card
                    _buildPrayerSoundCard(
                      prayerKey: 'isha',
                      prayerName: lang == 'tr' ? 'Yatsı Namazı' : lang == 'id' ? 'Shalat Isya' : lang == 'ru' ? 'Намаз Иша' : lang == 'ur' ? 'نمازِ عشاء' : 'Isha Prayer',
                      isEnabled: appProvider.notifyIsha,
                      currentSound: appProvider.ishaSound,
                      appProvider: appProvider,
                      isDark: isDark,
                      lang: lang,
                      onToggle: (val) => appProvider.setNotificationSettings(isha: val),
                      onSoundSelected: (snd) => appProvider.setPrayerSound(isha: snd),
                    ),
                    const SizedBox(height: 16),

                    // Battery optimization guide card for OEM devices
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.premiumGold.withOpacity(0.08) : Colors.amber.shade50,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.premiumGold.withOpacity(0.35),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline_rounded, color: AppColors.premiumGold, size: 20),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              lang == 'tr'
                                  ? '💡 Önemli: Xiaomi, Samsung veya Huawei cihazlarda alarmın ekran kapalıyken aksamadan çalması için telefon ayarlarından pil tasarrufunu "Kısıtlama Yok" yapınız.'
                                  : '💡 Tip: For Samsung, Xiaomi, or Huawei devices, set battery saving to "No Restrictions" so alarms can ring reliably when screen is locked.',
                              style: TextStyle(
                                fontSize: 12,
                                height: 1.35,
                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Save & Schedule Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.emeraldGreen,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
            ),
            onPressed: () async {
              final granted = await NotificationService.requestPermissions();
              if (granted && appProvider.isNotificationsEnabled) {
                await NotificationService.schedulePrayerNotifications(
                  latitude: appProvider.userLatitude,
                  longitude: appProvider.userLongitude,
                  cityName: appProvider.userCityName,
                  lang: lang,
                  isEnabled: appProvider.isNotificationsEnabled,
                  notifyFajr: appProvider.notifyFajr,
                  notifyDhuhr: appProvider.notifyDhuhr,
                  notifyAsr: appProvider.notifyAsr,
                  notifyMaghrib: appProvider.notifyMaghrib,
                  notifyIsha: appProvider.notifyIsha,
                  soundType: appProvider.adhanSoundType,
                  fajrSound: appProvider.fajrSound,
                  dhuhrSound: appProvider.dhuhrSound,
                  asrSound: appProvider.asrSound,
                  maghribSound: appProvider.maghribSound,
                  ishaSound: appProvider.ishaSound,
                );
              }

              if (mounted) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      lang == 'tr'
                          ? 'Ezan & Bildirim ayarları kaydedildi ve vakitler zamanlandı!'
                          : 'Adhan & Notification settings saved and scheduled!',
                    ),
                    backgroundColor: AppColors.emeraldGreen,
                  ),
                );
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle_rounded, color: AppColors.premiumGold, size: 20),
                const SizedBox(width: 8),
                Text(
                  _getSaveButtonText(lang),
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPresetOptionTile({
    required String id,
    required String title,
    required String subtitle,
    required IconData icon,
    required AppProvider appProvider,
    required bool isDark,
    required VoidCallback onSelect,
  }) {
    final isSelected = appProvider.adhanSoundType == id;
    final isPlaying = _isPlayingPreview && _currentlyPlayingSound == id;

    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? (isDark ? const Color(0xFF1E4D3E) : const Color(0xFFE8F5E9))
            : (isDark ? Colors.white.withOpacity(0.04) : Colors.white),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isSelected ? AppColors.premiumGold : (isDark ? Colors.white10 : Colors.grey.shade200),
          width: isSelected ? 1.5 : 1.0,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        onTap: onSelect,
        leading: Icon(icon, color: isSelected ? AppColors.premiumGold : Colors.grey),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            fontSize: 13.5,
            color: isSelected
                ? (isDark ? Colors.white : AppColors.darkEmerald)
                : (isDark ? Colors.white70 : Colors.black87),
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 11, color: isDark ? Colors.white54 : Colors.grey.shade600),
        ),
        trailing: IconButton(
          icon: Icon(
            isPlaying ? Icons.stop_circle_rounded : Icons.play_circle_fill_rounded,
            color: AppColors.premiumGold,
            size: 28,
          ),
          tooltip: 'Dinle / Test Et',
          onPressed: () => _toggleAudioPreview(id),
        ),
      ),
    );
  }

  Widget _buildPrayerSoundCard({
    required String prayerKey,
    required String prayerName,
    required bool isEnabled,
    required String currentSound,
    required AppProvider appProvider,
    required bool isDark,
    required String lang,
    required Function(bool) onToggle,
    required Function(String) onSoundSelected,
  }) {
    final isPlaying = _isPlayingPreview && _currentlyPlayingSound == currentSound;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.04) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEnabled ? AppColors.emeraldGreen.withOpacity(0.4) : (isDark ? Colors.white10 : Colors.grey.shade300),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          // Enable Switch
          Switch(
            value: isEnabled,
            activeColor: Colors.white,
            activeTrackColor: AppColors.emeraldGreen,
            inactiveThumbColor: Colors.grey.shade400,
            inactiveTrackColor: isDark ? Colors.white12 : Colors.grey.shade300,
            onChanged: onToggle,
          ),
          const SizedBox(width: 8),

          // Prayer Details & Current Sound Badge
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prayerName,
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.bold,
                    color: isEnabled
                        ? (isDark ? Colors.white : AppColors.darkEmerald)
                        : Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                InkWell(
                  onTap: isEnabled
                      ? () => _showPrayerSoundPickerModal(
                            context: context,
                            prayerTitle: prayerName,
                            currentSound: currentSound,
                            onSoundSelected: onSoundSelected,
                            lang: lang,
                            isDark: isDark,
                          )
                      : null,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white10 : AppColors.darkEmerald.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.premiumGold.withOpacity(0.5),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.music_note_rounded, size: 12, color: AppColors.premiumGold),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            _getSoundName(currentSound, lang),
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.premiumGold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Icon(Icons.arrow_drop_down_rounded, size: 16, color: AppColors.premiumGold),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Live Preview Button
          if (isEnabled && currentSound != 'silent')
            IconButton(
              icon: Icon(
                isPlaying ? Icons.stop_circle_rounded : Icons.play_circle_fill_rounded,
                color: AppColors.premiumGold,
                size: 28,
              ),
              tooltip: 'Dinle / Test Et',
              onPressed: () => _toggleAudioPreview(currentSound),
            ),
        ],
      ),
    );
  }
}
