import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../providers/app_provider.dart';
import '../constants/theme.dart';
import '../services/notification_service.dart';
import 'main_layout.dart';

class AdhanPlayingScreen extends StatefulWidget {
  final String? payload;
  final String? soundType;

  const AdhanPlayingScreen({super.key, this.payload, this.soundType});

  @override
  State<AdhanPlayingScreen> createState() => _AdhanPlayingScreenState();
}

class _AdhanPlayingScreenState extends State<AdhanPlayingScreen>
    with SingleTickerProviderStateMixin {
  late final AudioPlayer _audioPlayer;
  late final AnimationController _animController;
  late final Animation<double> _scaleAnimation;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.92, end: 1.08).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );

    // Play Adhan audio immediately on mount
    _startAdhan();
  }

  Future<void> _startAdhan() async {
    try {
      // Cancel any ongoing system notification sound to free audio focus
      await NotificationService.cancelAllNotifications();

      // Configure AudioContext for Alarm stream & background/lockscreen playback
      await _audioPlayer.setAudioContext(
        AudioContext(
          android: AudioContextAndroid(
            isSpeakerphoneOn: true,
            stayAwake: true,
            contentType: AndroidContentType.music,
            usageType: AndroidUsageType.alarm,
            audioFocus: AndroidAudioFocus.gainTransient,
          ),
          iOS: AudioContextIOS(
            category: AVAudioSessionCategory.playback,
          ),
        ),
      );

      // Extract sound type from widget or payload
      String sound = widget.soundType ?? 'normal';
      if (widget.payload != null && widget.payload!.contains('_')) {
        final parts = widget.payload!.split('_');
        if (parts.length >= 3) {
          sound = parts[2];
        }
      }
      if (sound == 'auto') sound = 'normal';

      String audioFile = 'ezan_normal.mp3';
      if (sound == 'fast') {
        audioFile = 'ezan_fast.mp3';
      } else if (sound == 'emotional') {
        audioFile = 'ezan_emotional.mp3';
      } else if (sound == 'chime') {
        audioFile = 'click.mp3';
      }

      await _audioPlayer.setReleaseMode(ReleaseMode.stop);
      await _audioPlayer.setVolume(1.0);
      await _audioPlayer.play(AssetSource('audio/$audioFile'));

      if (mounted) {
        setState(() {
          _isPlaying = true;
        });
      }
    } catch (e) {
      debugPrint('Adhan audio playback error: $e');
    }
  }

  Future<void> _stopAndExit() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      debugPrint('Error stopping audio player: $e');
    }

    // Cancel all notifications
    try {
      await NotificationService.cancelAllNotifications();
    } catch (_) {}

    if (mounted) {
      try {
        final provider = Provider.of<AppProvider>(context, listen: false);
        await provider.reschedulePrayerNotifications();
      } catch (_) {}
    }

    if (mounted) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainLayout()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.isDarkMode;

    String title = 'Ezan Okunuyor';
    String subtitle = 'Haydi Namaza, Haydi Kurtuluşa!';
    String stopLabel = 'Tamam';

    switch (provider.languageCode) {
      case 'tr':
        title = 'Ezan Okunuyor';
        subtitle = 'Haydi Namaza, Haydi Kurtuluşa!';
        stopLabel = 'Tamam';
        break;
      case 'de':
        title = 'Der Gebetsruf ertönt';
        subtitle = 'Auf zum Gebet, auf zum Heil!';
        stopLabel = 'Beenden';
        break;
      case 'fr':
        title = 'L\'Adhan retentit';
        subtitle = 'Venez à la prière, venez au salut !';
        stopLabel = 'Arrêter';
        break;
      case 'es':
        title = 'El Adhān está sonando';
        subtitle = '¡Venid a la oración, venid a la salvación!';
        stopLabel = 'Detener';
        break;
      case 'id':
        title = 'Adzan Berkumandang';
        subtitle = 'Marilah Menuju Shalat, Marilah Menuju Kemenangan!';
        stopLabel = 'Selesai';
        break;
      case 'ru':
        title = 'Звучит Азан';
        subtitle = 'Спешите на молитву, спешите к спасению!';
        stopLabel = 'Остановить';
        break;
      case 'it':
        title = 'L\'Adhan sta suonando';
        subtitle = 'Venite alla preghiera, venite alla salvezza!';
        stopLabel = 'Ferma';
        break;
      case 'ur':
        title = 'اذان ہو رہی ہے';
        subtitle = 'نماز کی طرف آؤ، فلاح کی طرف آؤ!';
        stopLabel = 'مکمل';
        break;
      default:
        title = 'Adhan is Playing';
        subtitle = 'Come to prayer, come to success!';
        stopLabel = 'Stop';
        break;
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _stopAndExit();
      },
      child: Scaffold(
        backgroundColor: isDark ? const Color(0xFF0A191E) : const Color(0xFFFEF8E5),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Pulsing Mosque Icon
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      padding: const EdgeInsets.all(36),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.premiumGold.withOpacity(0.15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.premiumGold.withOpacity(0.2),
                            blurRadius: 30,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.mosque_rounded,
                        size: 110,
                        color: AppColors.premiumGold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Title
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                      color: isDark ? Colors.white : AppColors.darkEmerald,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Subtitle
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 60),

                  // Big prominent Stop button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: _stopAndExit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.emeraldGreen,
                        foregroundColor: Colors.white,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      icon: const Icon(Icons.stop_circle_rounded, size: 28),
                      label: Text(
                        stopLabel,
                        style: const TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
