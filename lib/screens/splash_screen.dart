import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';
import '../services/ad_service.dart';
import '../services/location_service.dart';
import '../services/notification_service.dart';
import '../widgets/location_selection_sheet.dart';
import 'main_layout.dart';
import 'adhan_playing_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _navigated = false;
  bool _isFirstLaunch = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AdService.initialize();
    });
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final setupDone = prefs.getBool('setup_completed') ?? false;

      if (!mounted) return;

      if (setupDone) {
        final initialPayload = await NotificationService.checkInitialNotification();
        await AdService.initialize();
        if (!mounted) return;

        if (initialPayload != null && initialPayload.startsWith('adhan_')) {
          if (mounted && !_navigated) {
            _navigated = true;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => AdhanPlayingScreen(payload: initialPayload)),
            );
            return;
          }
        }

        // Zaten kurulmuşsa 1 saniye splash görselini gösterip otomatik ana sayfaya geç
        await Future.delayed(const Duration(milliseconds: 1000));
        if (mounted && !_navigated) {
          _navigated = true;
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainLayout()),
          );
        }
      } else {
        // İlk açılışsa butonları göster
        setState(() {
          _isFirstLaunch = true;
        });
      }
    } catch (e) {
      if (mounted && !_navigated) {
        _navigated = true;
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MainLayout()),
        );
      }
    }
  }

  Future<void> _handleStartTap(AppProvider appProvider) async {
    await AdService.initialize();
    if (!mounted) return;
    // Show location selection sheet on first launch so user can choose GPS or world city
    await LocationSelectionSheet.show(context);
    await _proceedToMainApp(appProvider);
  }

  Future<void> _proceedToMainApp(AppProvider appProvider) async {
    if (_navigated) return;
    await AdService.initialize();
    if (!mounted || _navigated) return;
    _navigated = true;

    // Do NOT set setupCompleted here; HomeScreen's wizard will complete it after Language, Mezhep, and Gender!
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const MainLayout()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.languageCode;
    final startButton = lang == 'tr' ? 'Başlayalım' : lang == 'de' ? 'Los geht\'s' : lang == 'fr' ? 'Commencer' : lang == 'es' ? 'Empezar' : lang == 'id' ? 'Ayo Mulai' : lang == 'ru' ? 'Начнем' : lang == 'it' ? 'Iniziamo' : lang == 'ur' ? 'شروع کریں' : 'Let\'s Start';
    final laterButton = lang == 'tr' ? 'Daha Sonra' : lang == 'de' ? 'Später' : lang == 'fr' ? 'Plus tard' : lang == 'es' ? 'Más tarde' : lang == 'id' ? 'Nanti Saja' : lang == 'ru' ? 'Позже' : lang == 'it' ? 'Più tardi' : lang == 'ur' ? 'بعد میں' : 'Later';
    final splashImage = lang == 'tr' ? 'assets/images/splash_bg.png' : 'assets/images/splash_bg_en.png';

    return Scaffold(
      backgroundColor: const Color(0xFF01352D),
      body: Stack(
        children: [
          // Full-screen background mockup image
          Positioned.fill(
            child: Image.asset(
              splashImage,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                color: const Color(0xFF01352D),
              ),
            ),
          ),
          // Action Buttons at the bottom (only shown on first launch)
          if (_isFirstLaunch)
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightBg,
                            foregroundColor: AppColors.darkEmerald,
                            minimumSize: const Size(double.infinity, 52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () => _handleStartTap(appProvider),
                          child: Text(
                            startButton,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        TextButton(
                          onPressed: () => _proceedToMainApp(appProvider),
                          child: Text(
                            laterButton,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
