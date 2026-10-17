import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/theme.dart';
import '../data/prayer_database.dart';
import '../models/prayer_models.dart' hide Prayer;
import '../providers/app_provider.dart';
import '../services/ad_service.dart';
import 'prayer_guide_screen.dart';
import 'abdest_screen.dart';
import 'library_screen.dart';
import 'namaz_meaning_screen.dart';
import 'namaz_conditions_screen.dart';
import 'zikirmatik_screen.dart';
import 'dart:async';
import 'package:adhan/adhan.dart';
import '../services/prayer_times_service.dart';
import 'prayer_times_screen.dart';
import 'qibla_compass_screen.dart';
import '../widgets/location_selection_sheet.dart';
import '../widgets/notification_settings_sheet.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback? onSettingsTap;
  const HomeScreen({super.key, this.onSettingsTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 0;
  bool _initialized = false;
  Timer? _liveTimer;
  final ScrollController _scrollController = ScrollController();
  bool _showScrollCue = true;

  @override
  void initState() {
    super.initState();
    _checkAndShowAdNotice();
    _checkNotificationPermissions();
    _startLiveTimer();
    _scrollController.addListener(_onScroll);
  }

  Future<void> _checkNotificationPermissions() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasAsked = prefs.getBool('has_prompted_notif_perm') ?? false;
      final setupCompleted = prefs.getBool('setup_completed') ?? false;
      if (!hasAsked && setupCompleted) {
        await prefs.setBool('has_prompted_notif_perm', true);
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          if (!mounted) return;
          final granted = await NotificationService.requestPermissions();
          if (granted && mounted) {
            final provider = Provider.of<AppProvider>(context, listen: false);
            await provider.reschedulePrayerNotifications();
          }
        });
      }
    } catch (e) {
      debugPrint('Error checking notification permissions: $e');
    }
  }

  void _onScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 30 && _showScrollCue) {
        setState(() => _showScrollCue = false);
      } else if (_scrollController.offset <= 30 && !_showScrollCue) {
        setState(() => _showScrollCue = true);
      }
    }
  }

  @override
  void dispose() {
    _liveTimer?.cancel();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _startLiveTimer() {
    _liveTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) setState(() {});
    });
  }

  Future<void> _checkAndShowAdNotice() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final hasShownNotice = prefs.getBool('has_shown_ad_notice') ?? false;
      final setupCompleted = prefs.getBool('setup_completed') ?? false;
      
      // Sadece kurulumu daha önce tamamlamış mevcut kullanıcılar için ana sayfada göster.
      // Sıfır kurulumda dil seçimi yapıldıktan hemen sonra kullanıcının seçtiği dilde gösterilir.
      if (!hasShownNotice && setupCompleted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _showAdNoticeDialog();
        });
      }
    } catch (e) {
      debugPrint('Error checking ad notice: $e');
    }
  }

  Future<void> _showAdNoticeDialog([AppProvider? customProvider]) async {
    if (!mounted) return;
    try {
      final appProvider = customProvider ?? Provider.of<AppProvider>(context, listen: false);
      final isDark = appProvider.isDarkMode;

      await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: isDark ? AppColors.darkEmerald : Colors.white,
            title: Row(
              children: [
                const Icon(Icons.info_outline, color: AppColors.premiumGold, size: 28),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    appProvider.translate('ad_notice_title'),
                    style: TextStyle(
                      color: isDark ? Colors.white : AppColors.darkEmerald,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            content: Text(
              appProvider.translate('ad_notice_content'),
              style: TextStyle(
                color: isDark ? Colors.white70 : Colors.black87,
                fontSize: 14.5,
                height: 1.4,
              ),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.premiumGold,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setBool('has_shown_ad_notice', true);
                  if (ctx.mounted) {
                    Navigator.of(ctx).pop();
                  }
                },
                child: Text(
                  appProvider.translate('ad_notice_button'),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      debugPrint('Error showing ad notice dialog: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDarkMode;

    if (!_initialized) {
      _currentStep = appProvider.setupCompleted ? 3 : 0;
      _initialized = true;
    } else if (!appProvider.setupCompleted && _currentStep == 3) {
      _currentStep = 0;
    }

    return PopScope(
      canPop: appProvider.setupCompleted || _currentStep == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        setState(() {
          _currentStep = _currentStep - 1;
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.06, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                ),
              );
            },
            child: _buildCurrentStepWidget(context, appProvider, isDark),
          ),
        ),
      ),
    );
  }

  Widget _buildCurrentStepWidget(BuildContext context, AppProvider provider, bool isDark) {
    switch (_currentStep) {
      case 0:
        return _buildLanguageStep(context, provider, isDark);
      case 1:
        return _buildMezhepStep(context, provider, isDark);
      case 2:
        return _buildGenderStep(context, provider, isDark);
      case 3:
      default:
        return _buildDashboardStep(context, provider, isDark);
    }
  }

  // STEP 0: LANGUAGE SELECTION
  Widget _buildLanguageStep(BuildContext context, AppProvider provider, bool isDark) {
    final languages = [
      {'code': 'tr', 'name': 'Türkçe', 'flag': '🇹🇷'},
      {'code': 'en', 'name': 'English', 'flag': '🇬🇧'},
      {'code': 'de', 'name': 'Deutsch', 'flag': '🇩🇪'},
      {'code': 'fr', 'name': 'Français', 'flag': '🇫🇷'},
      {'code': 'es', 'name': 'Español', 'flag': '🇪🇸'},
      {'code': 'id', 'name': 'Bahasa Indonesia', 'flag': '🇮🇩'},
      {'code': 'ru', 'name': 'Русский', 'flag': '🇷🇺'},
      {'code': 'it', 'name': 'Italiano', 'flag': '🇮🇹'},
      {'code': 'ur', 'name': 'اردو', 'flag': '🇵🇰'},
    ];

    return Center(
      key: const ValueKey('language_step'),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.language,
              size: 70,
              color: AppColors.premiumGold,
            ),
            const SizedBox(height: 20),
            Text(
              provider.translate('select_language'),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.darkEmerald,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                provider.translate('select_language_desc'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: isDark ? Colors.white70 : Colors.black54,
                  height: 1.3,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final lang = languages[index];
                  final isSelected = provider.languageCode == lang['code'];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    color: isSelected
                        ? AppColors.premiumGold
                        : (isDark ? AppColors.darkSurface : Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: BorderSide(
                        color: isSelected
                            ? Colors.transparent
                            : AppColors.champagneGold.withOpacity(0.3),
                      ),
                    ),
                    child: ListTile(
                      leading: Text(
                        lang['flag']!,
                        style: const TextStyle(fontSize: 24),
                      ),
                      title: Text(
                        lang['name']!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isSelected
                              ? AppColors.darkEmerald
                              : (isDark ? Colors.white : AppColors.darkEmerald),
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: AppColors.darkEmerald)
                          : null,
                      onTap: () async {
                        await provider.setLanguageCode(lang['code']!);
                        final prefs = await SharedPreferences.getInstance();
                        final hasShownNotice = prefs.getBool('has_shown_ad_notice') ?? false;
                        if (!hasShownNotice && context.mounted) {
                          await _showAdNoticeDialog(provider);
                        }
                        if (mounted) {
                          setState(() => _currentStep = 1);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // STEP 1: MEZHEP SELECTION CARD
  Widget _buildMezhepStep(BuildContext context, AppProvider provider, bool isDark) {
    return Center(
      key: const ValueKey('mezhep_step'),
      child: SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBackChip(
          label: '${provider.translate('language_setting')}: ${provider.languageCode.toUpperCase()}',
          onTap: () => setState(() => _currentStep = 0),
          isDark: isDark,
        ),
        const SizedBox(height: 25),
        const Icon(
          Icons.mosque_outlined,
          size: 70,
          color: AppColors.premiumGold,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.translate('select_mezhep'),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : AppColors.darkEmerald,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: Icon(
                Icons.info_outline,
                size: 20,
                color: isDark ? AppColors.premiumGold : AppColors.darkEmerald.withOpacity(0.7),
              ),
              onPressed: () => _showMezhepInfoSheet(context, isDark),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            provider.translate('select_mezhep_desc'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              color: isDark ? Colors.white70 : Colors.black54,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Expanded(
                    child: _buildSelectionCard(
                      title: provider.translate('hanafi_title'),
                      subtitle: provider.translate('hanafi_desc'),
                      icon: Icons.menu_book,
                      isSelected: provider.selectedMezhep == Mezhep.hanafi,
                      onTap: () {
                        provider.setSelectedMezhep(Mezhep.hanafi);
                        setState(() => _currentStep = 2);
                      },
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSelectionCard(
                      title: provider.translate('shafii_title'),
                      subtitle: provider.translate('shafii_desc'),
                      icon: Icons.library_books,
                      isSelected: provider.selectedMezhep == Mezhep.shafii,
                      onTap: () {
                        provider.setSelectedMezhep(Mezhep.shafii);
                        setState(() => _currentStep = 2);
                      },
                      isDark: isDark,
                    ),
                  ),
                ],
                ),
              ),
              const SizedBox(height: 16),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                  Expanded(
                    child: _buildSelectionCard(
                      title: provider.translate('maliki_title'),
                      subtitle: provider.translate('maliki_desc'),
                      icon: Icons.book,
                      isSelected: provider.selectedMezhep == Mezhep.maliki,
                      onTap: () {
                        provider.setSelectedMezhep(Mezhep.maliki);
                        setState(() => _currentStep = 2);
                      },
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildSelectionCard(
                      title: provider.translate('hanbali_title'),
                      subtitle: provider.translate('hanbali_desc'),
                      icon: Icons.my_library_books,
                      isSelected: provider.selectedMezhep == Mezhep.hanbali,
                      onTap: () {
                        provider.setSelectedMezhep(Mezhep.hanbali);
                        setState(() => _currentStep = 2);
                      },
                      isDark: isDark,
                    ),
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    ),
    );
  }

  // STEP 2: GENDER SELECTION CARD
  Widget _buildGenderStep(BuildContext context, AppProvider provider, bool isDark) {
    return Center(
      key: const ValueKey('gender_step'),
      child: SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBackChip(
          label: '${provider.translate('tab_settings')}: ${provider.selectedMezhep.getLocalizedName(provider.languageCode)}',
          onTap: () => setState(() => _currentStep = 1),
          isDark: isDark,
        ),
        const SizedBox(height: 25),
        const Icon(
          Icons.people_outline,
          size: 70,
          color: AppColors.premiumGold,
        ),
        const SizedBox(height: 20),
        Text(
          provider.translate('select_gender'),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : AppColors.darkEmerald,
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            provider.translate('select_gender_desc'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.5,
              color: isDark ? Colors.white70 : Colors.black54,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              Expanded(
                child: _buildSelectionCard(
                  title: provider.translate('male_title'),
                  subtitle: provider.translate('male_desc'),
                  icon: Icons.male,
                  isSelected: provider.selectedGender == Gender.male,
                  onTap: () async {
                    provider.setSelectedGender(Gender.male);
                    provider.setSetupCompleted(true);
                    setState(() => _currentStep = 3);
                    await NotificationService.requestPermissions();
                    await provider.reschedulePrayerNotifications();
                  },
                  isDark: isDark,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildSelectionCard(
                  title: provider.translate('female_title'),
                  subtitle: provider.translate('female_desc'),
                  icon: Icons.female,
                  isSelected: provider.selectedGender == Gender.female,
                  onTap: () async {
                    provider.setSelectedGender(Gender.female);
                    provider.setSetupCompleted(true);
                    setState(() => _currentStep = 3);
                    await NotificationService.requestPermissions();
                    await provider.reschedulePrayerNotifications();
                  },
                  isDark: isDark,
                ),
              ),
            ],
            ),
          ),
        ),
      ],
    ),
    ),
    );
  }

  // STEP 2: DASHBOARD
  Widget _buildDashboardStep(BuildContext context, AppProvider provider, bool isDark) {
    if (!provider.setupCompleted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _currentStep = 0);
      });
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final gridAspectRatio = screenHeight < 680 ? 0.74 : (screenHeight < 750 ? 0.78 : (screenHeight < 840 ? 0.82 : 0.85));

    return Stack(
      children: [
        SingleChildScrollView(
          key: const ValueKey('dashboard_step'),
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row with Title on Left and Settings Gear on Right
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.translate('app_title'),
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : AppColors.darkEmerald,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Text(
                            provider.translate('welcome'),
                            style: TextStyle(
                              fontSize: 14.5,
                              color: isDark ? Colors.white70 : AppColors.darkEmerald.withOpacity(0.85),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 32,
                            height: 3,
                            decoration: BoxDecoration(
                              color: AppColors.premiumGold,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: isDark ? Colors.white70 : AppColors.darkEmerald,
                      size: 26,
                    ),
                    onPressed: widget.onSettingsTap,
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Top Prayer Times Split Card with Mosque Arch Image & Live Data
              _buildTopPrayerTimesCard(context, provider, isDark),
              const SizedBox(height: 16),

              // 6 Card Grid Layout (3 columns)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: gridAspectRatio,
                children: [
                  _buildDashboardGridCard(
                    title: provider.translate('namaz_meanings'),
                    imageAsset: 'assets/images/home_menu_meaning.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NamazMeaningScreen()),
                      );
                    },
                    isDark: isDark,
                  ),
                  _buildDashboardGridCard(
                    title: provider.translate('namaz_conditions'),
                    imageAsset: 'assets/images/home_menu_conditions.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NamazConditionsScreen()),
                      );
                    },
                    isDark: isDark,
                  ),
                  _buildDashboardGridCard(
                    title: provider.translate('abdest_guide'),
                    imageAsset: 'assets/images/home_menu_abdest.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const AbdestScreen()),
                      );
                    },
                    isDark: isDark,
                  ),
                  _buildDashboardGridCard(
                    title: provider.translate('prayer_guide'),
                    imageAsset: 'assets/images/home_menu_guide.png',
                    onTap: () => _showGenderSelectionSheet(context, provider),
                    isDark: isDark,
                  ),
                  _buildDashboardGridCard(
                    title: _getQiblaCompassTitle(provider.languageCode),
                    iconData: Icons.explore_rounded,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const QiblaCompassScreen()),
                      ).then((_) => AdService.showInterstitialAd());
                    },
                    isDark: isDark,
                  ),
                  _buildDashboardGridCard(
                    title: provider.languageCode == 'tr' ? 'Namaz Sureleri' :
                           provider.languageCode == 'en' ? 'Prayer Surahs' :
                           provider.languageCode == 'de' ? 'Gebetssuren' :
                           provider.languageCode == 'fr' ? 'Sourates de prière' :
                           provider.languageCode == 'id' ? 'Surah Shalat' :
                           provider.languageCode == 'ru' ? 'Суры для намаза' :
                           provider.languageCode == 'it' ? 'Sure della Preghiera' :
                           provider.languageCode == 'ur' ? 'نماز کی سورتیں' :
                           provider.languageCode == 'es' ? 'Suras de rezo' : 'Prayer Surahs',
                    imageAsset: 'assets/images/home_menu_surahs.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LibraryScreen(filterSurahs: true)),
                      );
                    },
                    isDark: isDark,
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Visual Scroll Down Indicator / Cue
              _buildScrollDownHint(provider.languageCode, isDark),
              const SizedBox(height: 8),

              // 3 Feature Banner Cards (Dualar, Namaz Vakitleri & Ezan Sesleri)
              Row(
                children: [
                  Expanded(
                    child: _buildFeatureBannerCard(
                      title: provider.languageCode == 'tr' ? 'Dualar' :
                             provider.languageCode == 'en' ? 'Supplications' :
                             provider.languageCode == 'de' ? 'Bittgebete' :
                             provider.languageCode == 'fr' ? 'Invocations' :
                             provider.languageCode == 'id' ? 'Doa-doa' :
                             provider.languageCode == 'ru' ? 'Мольбы' :
                             provider.languageCode == 'it' ? 'Suppliche' :
                             provider.languageCode == 'ur' ? 'دعائیں' :
                             provider.languageCode == 'es' ? 'Súplicas' : 'Supplications',
                      imageAsset: 'assets/images/home_menu_prayers.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LibraryScreen(filterSurahs: false)),
                        );
                      },
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildFeatureBannerCard(
                      title: _getPrayerTimesTitle(provider.languageCode),
                      iconData: Icons.access_time_filled_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PrayerTimesScreen()),
                        ).then((_) => AdService.showInterstitialAd());
                      },
                      isDark: isDark,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildFeatureBannerCard(
                      title: _getAdhanSoundsTitle(provider.languageCode),
                      iconData: Icons.notifications_active_rounded,
                      onTap: () {
                        NotificationSettingsSheet.show(context);
                      },
                      isDark: isDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Zikirmatik Banner Card
              _buildZikirmatikBanner(context, provider, isDark),
              const SizedBox(height: 30),
            ],
          ),
        ),

        // Floating Action Scroll Cue (visible at top of screen for ALL phone heights)
        Positioned(
          bottom: 12,
          left: 0,
          right: 0,
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showScrollCue ? 1.0 : 0.0,
            child: IgnorePointer(
              ignoring: !_showScrollCue,
              child: Center(
                child: InkWell(
                  onTap: () {
                    if (_scrollController.hasClients) {
                      _scrollController.animateTo(
                        260,
                        duration: const Duration(milliseconds: 450),
                        curve: Curves.easeOutCubic,
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF0F382C) : AppColors.darkEmerald,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                      border: Border.all(color: AppColors.premiumGold, width: 1.2),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.arrow_downward_rounded, color: AppColors.premiumGold, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          provider.languageCode == 'tr' ? 'Diğer Hizmetler & Dualar' :
                          provider.languageCode == 'de' ? 'Weitere Dienste & Bittgebete' :
                          provider.languageCode == 'fr' ? 'Autres services & Invocations' :
                          provider.languageCode == 'es' ? 'Otros servicios y Oraciones' :
                          provider.languageCode == 'id' ? 'Layanan Lain & Doa' :
                          provider.languageCode == 'ru' ? 'Другие сервисы и мольбы' :
                          provider.languageCode == 'it' ? 'Altri servizi e Suppliche' :
                          provider.languageCode == 'ur' ? 'دیگر خدمات اور دعائیں' : 'Other Services & Supplications',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Icon(Icons.arrow_downward_rounded, color: AppColors.premiumGold, size: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildScrollDownHint(String lang, bool isDark) {
    final hintText = lang == 'tr' ? 'Diğer Hizmetler & Dualar' :
                     lang == 'de' ? 'Weitere Dienste & Bittgebete' :
                     lang == 'fr' ? 'Autres services & Invocations' :
                     lang == 'es' ? 'Otros servicios y Oraciones' :
                     lang == 'id' ? 'Layanan Lain & Doa' :
                     lang == 'ru' ? 'Другие сервисы и мольбы' :
                     lang == 'it' ? 'Altri servizi e Suppliche' :
                     lang == 'ur' ? 'دیگر خدمات اور دعائیں' : 'Other Services & Supplications';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InkWell(
        onTap: () {
          if (_scrollController.hasClients) {
            _scrollController.animateTo(
              280,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOutCubic,
            );
          }
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: isDark ? const Color(0xFF2C3B4E) : AppColors.champagneGold.withOpacity(0.6),
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      hintText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.3,
                        color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                      size: 18,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Divider(
                  color: isDark ? const Color(0xFF2C3B4E) : AppColors.champagneGold.withOpacity(0.6),
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopPrayerTimesCard(BuildContext context, AppProvider provider, bool isDark) {
    final now = DateTime.now();
    final prayerTimes = PrayerTimesService.getPrayerTimes(
      latitude: provider.userLatitude,
      longitude: provider.userLongitude,
      date: now,
      madhab: provider.selectedMezhep == Mezhep.shafii ? Madhab.shafi : Madhab.hanafi,
    );

    Prayer nextPrayer = prayerTimes.nextPrayer();
    DateTime? nextTime = prayerTimes.timeForPrayer(nextPrayer);
    
    if (nextPrayer == Prayer.none || nextTime == null) {
      final tomorrow = now.add(const Duration(days: 1));
      final tomorrowTimes = PrayerTimesService.getPrayerTimes(
        latitude: provider.userLatitude,
        longitude: provider.userLongitude,
        date: tomorrow,
        madhab: provider.selectedMezhep == Mezhep.shafii ? Madhab.shafi : Madhab.hanafi,
      );
      nextPrayer = Prayer.fajr;
      nextTime = tomorrowTimes.fajr;
    }

    final diff = nextTime.difference(now);
    final countdownStr = _formatCountdownString(diff, provider.languageCode);
    final dateStr = _formatTodayDate(provider.languageCode, now);

    final prayersList = [
      {'prayer': Prayer.fajr, 'time': prayerTimes.fajr, 'icon': Icons.nights_stay_rounded},
      {'prayer': Prayer.sunrise, 'time': prayerTimes.sunrise, 'icon': Icons.wb_twilight_rounded},
      {'prayer': Prayer.dhuhr, 'time': prayerTimes.dhuhr, 'icon': Icons.wb_sunny_rounded},
      {'prayer': Prayer.asr, 'time': prayerTimes.asr, 'icon': Icons.wb_cloudy_rounded},
      {'prayer': Prayer.maghrib, 'time': prayerTimes.maghrib, 'icon': Icons.wb_twilight_sharp},
      {'prayer': Prayer.isha, 'time': prayerTimes.isha, 'icon': Icons.bedtime_rounded},
    ];

    final currentActivePrayer = _getCurrentActivePrayer(prayerTimes, now);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF131C2E) : const Color(0xFFFFFDF5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? const Color(0xFF2C3B4E) : const Color(0xFFEADBCE),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Top Bar Header inside Card
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: isDark ? const Color(0xFF1A263B) : const Color(0xFFF7F2E6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Icons.mosque_rounded, color: AppColors.darkEmerald, size: 18),
                      const SizedBox(width: 6),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            provider.languageCode == 'tr' ? 'Bugünün Namaz Vakitleri' :
                            provider.languageCode == 'en' ? 'Today\'s Prayer Times' :
                            provider.languageCode == 'de' ? 'Heutige Gebetszeiten' :
                            provider.languageCode == 'fr' ? 'Heures de prière d\'aujourd\'hui' :
                            provider.languageCode == 'es' ? 'Horarios de hoy' :
                            provider.languageCode == 'id' ? 'Jadwal Shalat Hari Ini' :
                            provider.languageCode == 'ru' ? 'Время намаза на сегодня' :
                            provider.languageCode == 'it' ? 'Orari di oggi' :
                            provider.languageCode == 'ur' ? 'آج کے اوقات' : 'Today\'s Prayer Times',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: isDark ? Colors.white : AppColors.darkEmerald,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                // QUICK ADHAN SOUND SELECTOR BUTTON
                InkWell(
                  onTap: () => NotificationSettingsSheet.show(context),
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.premiumGold.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.premiumGold.withOpacity(0.4),
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.volume_up_rounded, color: AppColors.premiumGold, size: 13),
                        const SizedBox(width: 3),
                        Text(
                          provider.languageCode == 'tr' ? 'Ezan Sesi' :
                          provider.languageCode == 'de' ? 'Ezan-Ton' :
                          provider.languageCode == 'fr' ? 'Son Adhan' :
                          provider.languageCode == 'es' ? 'Sonido Adhan' :
                          provider.languageCode == 'id' ? 'Suara Adzan' :
                          provider.languageCode == 'ru' ? 'Звук Азана' :
                          provider.languageCode == 'it' ? 'Suono Adhan' :
                          provider.languageCode == 'ur' ? 'اذان کی آواز' : 'Adhan Sound',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppColors.premiumGold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: InkWell(
                    onTap: () => LocationSelectionSheet.show(context),
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white.withOpacity(0.08) : AppColors.darkEmerald.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.location_on_rounded, color: AppColors.premiumGold, size: 13),
                          const SizedBox(width: 3),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                provider.userCityName,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.w600,
                                  color: isDark ? Colors.white70 : AppColors.darkEmerald,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.premiumGold, size: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Card Split Area (Left Prayer Times List + Right Arch Illustration with Floating Card)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 232,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // LEFT SIDE: 6 Daily Prayer Times
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: prayersList.map((item) {
                        final pEnum = item['prayer'] as Prayer;
                        final pTime = item['time'] as DateTime?;
                        final pIcon = item['icon'] as IconData;
                        final nameStr = _getPrayerDisplayName(pEnum, provider.languageCode);
                        final timeStr = PrayerTimesService.formatTime(pTime);

                        final isCurrent = currentActivePrayer == pEnum;
                        final isPassed = pTime != null && now.isAfter(pTime) && !isCurrent;

                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 1),
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3.5),
                          decoration: BoxDecoration(
                            color: isCurrent
                                ? (isDark ? const Color(0xFF1E4D3E) : const Color(0xFFE8F5E9))
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: isCurrent
                                ? Border.all(color: AppColors.emeraldGreen.withOpacity(0.4), width: 1)
                                : null,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                pIcon,
                                size: 13,
                                color: isCurrent
                                    ? AppColors.darkEmerald
                                    : (isDark ? Colors.white60 : Colors.black54),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    nameStr,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                                      color: isCurrent
                                          ? (isDark ? Colors.white : AppColors.darkEmerald)
                                          : (isDark ? Colors.white70 : Colors.black87),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                timeStr,
                                style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: isCurrent ? FontWeight.bold : FontWeight.w600,
                                  fontFeatures: const [FontFeature.tabularFigures()],
                                  color: isCurrent
                                      ? (isDark ? Colors.white : AppColors.darkEmerald)
                                      : (isDark ? Colors.white70 : Colors.black87),
                                ),
                              ),
                              const SizedBox(width: 3),
                              SizedBox(
                                width: 13,
                                height: 13,
                                child: isCurrent
                                    ? const Icon(Icons.access_time_rounded, size: 12, color: AppColors.darkEmerald)
                                    : isPassed
                                        ? const Icon(Icons.check_rounded, size: 12, color: Color(0xFF2E7D32))
                                        : const SizedBox.shrink(),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(width: 8),

                  // RIGHT SIDE: Arch Illustration & Floating Next Prayer Box
                  Expanded(
                    flex: 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          // Arch Image Asset uploaded by user
                          Image.asset(
                            'assets/images/mosque_arch_bg.png',
                            fit: BoxFit.cover,
                          ),

                          // Date text at top right
                          Positioned(
                            top: 8,
                            right: 8,
                            left: 8,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.92),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.06),
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_month_outlined, size: 12, color: AppColors.darkEmerald),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        dateStr,
                                        style: const TextStyle(
                                          fontSize: 10.5,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkEmerald,
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Floating Bottom Card: Next Prayer & Live Countdown
                          Positioned(
                            bottom: 6,
                            left: 4,
                            right: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFDF5).withOpacity(0.96),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.14),
                                    blurRadius: 8,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                border: Border.all(
                                  color: AppColors.premiumGold.withOpacity(0.6),
                                  width: 1.2,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColors.premiumGold.withOpacity(0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.mosque_rounded,
                                      color: AppColors.darkEmerald,
                                      size: 14,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            provider.languageCode == 'tr' ? 'Sıradaki Namaz' :
                                            provider.languageCode == 'de' ? 'Nächstes Gebet' :
                                            provider.languageCode == 'fr' ? 'Prochaine prière' :
                                            provider.languageCode == 'es' ? 'Siguiente oración' :
                                            provider.languageCode == 'id' ? 'Shalat Berikutnya' :
                                            provider.languageCode == 'ru' ? 'Следующий намаз' :
                                            provider.languageCode == 'it' ? 'Prossima preghiera' :
                                            provider.languageCode == 'ur' ? 'اگلی نماز' : 'Next Prayer',
                                            style: TextStyle(
                                              fontSize: 9.5,
                                              color: Colors.black.withOpacity(0.55),
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.2,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 1),
                                        FittedBox(
                                          fit: BoxFit.scaleDown,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${_getPrayerDisplayName(nextPrayer, provider.languageCode)} ${PrayerTimesService.formatTime(nextTime)}',
                                            style: const TextStyle(
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.w800,
                                              color: AppColors.darkEmerald,
                                              letterSpacing: 0.1,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_time_rounded, size: 12, color: AppColors.darkEmerald),
                                            const SizedBox(width: 3),
                                            Expanded(
                                              child: FittedBox(
                                                fit: BoxFit.scaleDown,
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  countdownStr,
                                                  style: const TextStyle(
                                                    fontSize: 10.8,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black87,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const PrayerTimesScreen(),
                                        ),
                                      ).then((_) => AdService.showInterstitialAd());
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: const BoxDecoration(
                                        color: AppColors.darkEmerald,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Prayer _getCurrentActivePrayer(PrayerTimes prayerTimes, DateTime now) {
    if (now.isBefore(prayerTimes.fajr)) return Prayer.isha;
    if (now.isBefore(prayerTimes.sunrise)) return Prayer.fajr;
    if (now.isBefore(prayerTimes.dhuhr)) return Prayer.sunrise;
    if (now.isBefore(prayerTimes.asr)) return Prayer.dhuhr;
    if (now.isBefore(prayerTimes.maghrib)) return Prayer.asr;
    if (now.isBefore(prayerTimes.isha)) return Prayer.maghrib;
    return Prayer.isha;
  }

  String _formatTodayDate(String lang, DateTime date) {
    final days = {
      'tr': ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'],
      'en': ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'],
      'de': ['Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag', 'Sonntag'],
      'fr': ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'],
      'es': ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'],
      'id': ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'],
      'ru': ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'],
      'it': ['Lunedì', 'Martedì', 'Mercoledì', 'Giovedì', 'Venerdì', 'Sabato', 'Domenica'],
      'ur': ['پیر', 'منگل', 'بدھ', 'جمعرات', 'جمعہ', 'ہفتہ', 'اتوار'],
    };

    final months = {
      'tr': ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'],
      'en': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
      'de': ['Jan.', 'Feb.', 'März', 'Apr.', 'Mai', 'Juni', 'Juli', 'Aug.', 'Sept.', 'Okt.', 'Nov.', 'Dez.'],
      'fr': ['janv.', 'févr.', 'mars', 'avril', 'mai', 'juin', 'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.'],
      'es': ['ene.', 'feb.', 'mar.', 'abr.', 'may.', 'jun.', 'jul.', 'ago.', 'sep.', 'oct.', 'nov.', 'dic.'],
      'id': ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'],
      'ru': ['янв.', 'февр.', 'марта', 'апр.', 'мая', 'июня', 'июля', 'авг.', 'сент.', 'окт.', 'нояб.', 'дек.'],
      'it': ['gen', 'feb', 'mar', 'apr', 'mag', 'giu', 'lug', 'ago', 'set', 'ott', 'nov', 'dic'],
      'ur': ['جنوری', 'فروری', 'مارچ', 'اپریل', 'مئی', 'جون', 'جولائی', 'اگست', 'ستمبر', 'اکتوبر', 'نومبر', 'دسمبر'],
    };

    final dList = days[lang] ?? days['en']!;
    final mList = months[lang] ?? months['en']!;

    final dayName = dList[date.weekday - 1];
    final monthName = mList[date.month - 1];

    if (lang == 'tr') {
      return '${date.day} $monthName ${date.year} / $dayName';
    } else if (lang == 'ur') {
      return '$dayName، ${date.day} $monthName ${date.year}';
    } else if (lang == 'de' || lang == 'ru') {
      return '$dayName, ${date.day} $monthName ${date.year}';
    } else if (lang == 'fr' || lang == 'it') {
      return '$dayName ${date.day} $monthName ${date.year}';
    } else if (lang == 'es') {
      return '$dayName, ${date.day} de $monthName de ${date.year}';
    } else {
      return '$dayName, $monthName ${date.day}, ${date.year}';
    }
  }

  String _formatCountdownString(Duration diff, String lang) {
    final hours = diff.inHours;
    final minutes = diff.inMinutes.remainder(60);

    final hStr = hours > 0 ? '${hours.toString().padLeft(2, '0')} ' : '';
    final mStr = '${minutes.toString().padLeft(2, '0')} ';

    switch (lang) {
      case 'tr':
        return '${hStr}saat ${mStr}dakika kaldı';
      case 'de':
        return '${hStr}Std. ${mStr}Min. verbleibend';
      case 'fr':
        return '${hStr}h ${mStr}min restantes';
      case 'es':
        return 'Quedan ${hStr}h ${mStr}min';
      case 'id':
        return 'Sisa ${hStr}jam ${mStr}menit';
      case 'ru':
        return 'Осталось ${hStr}ч ${mStr}мин';
      case 'it':
        return 'Rimani ${hStr}h ${mStr}min';
      case 'ur':
        return '${hStr}گھنٹے ${mStr}منٹ باقی';
      default:
        return '${hStr}hrs ${mStr}mins left';
    }
  }

  String _getPrayerDisplayName(Prayer prayer, String lang) {
    switch (prayer) {
      case Prayer.fajr:
        switch (lang) {
          case 'tr': return 'İmsak';
          case 'id': return 'Subuh';
          case 'ru': return 'Фаджр';
          case 'ur': return 'فجر';
          default: return 'Fajr';
        }
      case Prayer.sunrise:
        switch (lang) {
          case 'tr': return 'Güneş';
          case 'de': return 'Sonnenaufgang';
          case 'fr': return 'Lever du soleil';
          case 'es': return 'Salida del sol';
          case 'id': return 'Terbit';
          case 'ru': return 'Восход';
          case 'it': return 'Alba';
          case 'ur': return 'طلوع آفتاب';
          default: return 'Sunrise';
        }
      case Prayer.dhuhr:
        switch (lang) {
          case 'tr': return 'Öğle';
          case 'id': return 'Dzuhur';
          case 'ru': return 'Зухр';
          case 'ur': return 'ظہر';
          default: return 'Dhuhr';
        }
      case Prayer.asr:
        switch (lang) {
          case 'tr': return 'İkindi';
          case 'id': return 'Ashar';
          case 'ru': return 'Аср';
          case 'ur': return 'عصر';
          default: return 'Asr';
        }
      case Prayer.maghrib:
        switch (lang) {
          case 'tr': return 'Akşam';
          case 'id': return 'Maghrib';
          case 'ru': return 'Магриб';
          case 'ur': return 'مغرب';
          default: return 'Maghrib';
        }
      case Prayer.isha:
        switch (lang) {
          case 'tr': return 'Yatsı';
          case 'id': return 'Isya';
          case 'ru': return 'Иша';
          case 'ur': return 'عشاء';
          default: return 'Isha';
        }
      default:
        return '';
    }
  }

  String _getPrayerTimesTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Namaz Vakitleri';
      case 'de': return 'Gebetszeiten';
      case 'fr': return 'Heures de Prière';
      case 'es': return 'Horarios Oración';
      case 'id': return 'Jadwal Shalat';
      case 'ru': return 'Время намаза';
      case 'it': return 'Orari Preghiera';
      case 'ur': return 'اوقات نماز';
      default: return 'Prayer Times';
    }
  }

  String _getQiblaCompassTitle(String lang) {
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

  String _getAdhanSoundsTitle(String lang) {
    switch (lang) {
      case 'tr': return 'Ezan Sesleri';
      case 'de': return 'Ezan-Töne';
      case 'fr': return 'Sons d\'Adhan';
      case 'es': return 'Sonidos Adhan';
      case 'id': return 'Suara Adzan';
      case 'ru': return 'Звуки Азана';
      case 'it': return 'Suoni Adhan';
      case 'ur': return 'اذان کی آوازیں';
      default: return 'Adhan Sounds';
    }
  }

  Widget _buildDashboardGridCard({
    required String title,
    String? imageAsset,
    IconData? iconData,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
      color: isDark ? const Color(0xFF1B2638) : const Color(0xFFFFFDF2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark ? const Color(0xFF2C3B4E) : const Color(0xFFEADBCE),
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 2),
              Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF263347) : const Color(0xFFEFE8D8),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: imageAsset != null
                    ? Image.asset(
                        imageAsset,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        iconData ?? Icons.star,
                        color: AppColors.darkEmerald,
                        size: 22,
                      ),
              ),
              const SizedBox(height: 3),
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11.5,
                          color: isDark ? Colors.white : AppColors.darkEmerald,
                          height: 1.15,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                size: 13,
                color: AppColors.darkEmerald,
              ),
              const SizedBox(height: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureBannerCard({
    required String title,
    String? imageAsset,
    IconData? iconData,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withOpacity(isDark ? 0.3 : 0.04),
      color: isDark ? const Color(0xFF1B2638) : const Color(0xFFFFFDF2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDark ? const Color(0xFF2C3B4E) : const Color(0xFFEADBCE),
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF263347) : const Color(0xFFEFE8D8),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: imageAsset != null
                    ? Image.asset(
                        imageAsset,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        iconData ?? Icons.star,
                        color: AppColors.darkEmerald,
                        size: 22,
                      ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 28,
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.center,
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 11.5,
                        color: isDark ? Colors.white : AppColors.darkEmerald,
                        height: 1.15,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              const Icon(
                Icons.chevron_right_rounded,
                size: 14,
                color: AppColors.darkEmerald,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildZikirmatikBanner(BuildContext context, AppProvider provider, bool isDark) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: AppColors.premiumGold, width: 1.2),
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF0F172A), const Color(0xFF022C22)]
                : [const Color(0xFFFFFDF5), const Color(0xFFFFF7DC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ZikirmatikScreen()),
            ).then((_) {
              AdService.showInterstitialAd();
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
            child: Row(
              children: [
                // Styled Digital Tasbih Counter Illustration
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppColors.premiumGold.withOpacity(0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.premiumGold.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                    ),
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E293B) : Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          )
                        ],
                        border: Border.all(
                          color: AppColors.premiumGold.withOpacity(0.6),
                          width: 1.5,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.fingerprint_rounded,
                            color: AppColors.premiumGold,
                            size: 18,
                          ),
                          Text(
                            '33',
                            style: TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.bold,
                              color: AppColors.premiumGold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                // Texts & Badges
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              provider.translate('zikirmatik'),
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: isDark ? Colors.white : AppColors.darkEmerald,
                                height: 1.2,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.premiumGold,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              provider.languageCode == 'tr' ? 'YENİ' :
                              provider.languageCode == 'id' ? 'BARU' :
                              provider.languageCode == 'ru' ? 'НОВОЕ' :
                              provider.languageCode == 'it' ? 'NUOVO' :
                              provider.languageCode == 'ur' ? 'نیا' : 'NEW',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8.5,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        provider.translate('zikirmatik_desc'),
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white70 : Colors.black87,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.premiumGold,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // WIDGET BUILDER: Step Card Selection
  Widget _buildSelectionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? AppColors.premiumGold
                : (isDark ? Colors.white10 : Colors.black12),
            width: isSelected ? 2.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.premiumGold.withOpacity(0.15)
                  : Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.premiumGold.withOpacity(0.15)
                    : (isDark ? Colors.white10 : Colors.grey.shade100),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.premiumGold : (isDark ? Colors.white54 : Colors.black45),
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.5,
                color: isDark ? Colors.white : AppColors.darkEmerald,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 11,
                color: isDark ? Colors.white70 : Colors.black54,
                height: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // WIDGET BUILDER: Back button Chip
  Widget _buildBackChip({required String label, required VoidCallback onTap, required bool isDark}) {
    return ActionChip(
      avatar: const Icon(Icons.arrow_back, size: 14, color: AppColors.premiumGold),
      label: Text(
        label,
        style: const TextStyle(color: AppColors.premiumGold, fontSize: 12, fontWeight: FontWeight.bold),
      ),
      backgroundColor: AppColors.premiumGold.withOpacity(0.1),
      side: BorderSide(color: AppColors.premiumGold.withOpacity(0.3)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onTap,
    );
  }

  void _showGenderSelectionSheet(BuildContext context, AppProvider provider) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allow it to expand fully if needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        Gender? tempSelectedGender;
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final maleSelected = tempSelectedGender == Gender.male;
            final femaleSelected = tempSelectedGender == Gender.female;

            return SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                  left: 20.0,
                  right: 20.0,
                  top: 20.0,
                ),
                child: SingleChildScrollView( // Prevent overflow in landscape
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text(
                      provider.translate('select_gender'),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.emeraldGreen,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      provider.translate('select_gender_desc'),
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: maleSelected ? 4 : 1,
                            color: maleSelected
                                ? (isDark ? Colors.blue.withOpacity(0.25) : const Color(0xFFE3F2FD))
                                : (isDark ? AppColors.darkSurface : Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: maleSelected ? Colors.blue : AppColors.emeraldGreen,
                                width: 1.5,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                setSheetState(() {
                                    tempSelectedGender = Gender.male;
                                });
                                provider.setSelectedGender(Gender.male);
                                Future.delayed(const Duration(milliseconds: 250), () {
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                    _showPrayerTimeSelectionSheet(context, provider);
                                  }
                                });
                              },
                              splashColor: Colors.blue.withOpacity(0.4),
                              highlightColor: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/cinsiyet_erkek.png',
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      provider.translate('male_title'),
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Card(
                            elevation: femaleSelected ? 4 : 1,
                            color: femaleSelected
                                ? (isDark ? Colors.blue.withOpacity(0.25) : const Color(0xFFE3F2FD))
                                : (isDark ? AppColors.darkSurface : Colors.white),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: femaleSelected ? Colors.blue : AppColors.emeraldGreen,
                                width: 1.5,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                setSheetState(() {
                                  tempSelectedGender = Gender.female;
                                });
                                provider.setSelectedGender(Gender.female);
                                Future.delayed(const Duration(milliseconds: 250), () {
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                    _showPrayerTimeSelectionSheet(context, provider);
                                  }
                                });
                              },
                              splashColor: Colors.blue.withOpacity(0.4),
                              highlightColor: Colors.blue.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(16),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 20.0),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/cinsiyet_kadin.png',
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      provider.translate('female_title'),
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ), // end of SingleChildScrollView
              ), // end of Padding
            );
          },
        );
      },
    );
  }

  void _showPrayerTimeSelectionSheet(BuildContext context, AppProvider provider) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.78,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SafeArea(
                child: DefaultTabController(
                  length: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 16.0, 20.0, 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Handlebar for draggable sheet
                        Center(
                          child: Container(
                            width: 40,
                            height: 4,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              color: isDark ? Colors.white24 : Colors.black12,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Text(
                          provider.translate('select_prayer_prompt'),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: AppColors.emeraldGreen,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // TabBar
                        TabBar(
                          labelColor: AppColors.emeraldGreen,
                          unselectedLabelColor: isDark ? Colors.white70 : Colors.black54,
                          indicatorColor: AppColors.emeraldGreen,
                          indicatorWeight: 3,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          tabs: [
                            Tab(text: provider.translate('tab_vakit')),
                            Tab(text: provider.translate('tab_bayram')),
                            Tab(text: provider.translate('tab_cenaze')),
                          ],
                        ),
                        const SizedBox(height: 15),
                        // TabBarView
                        Expanded(
                          child: TabBarView(
                            children: [
                              // Tab 1: Vakit Namazları (Sabah, Ogle, Ikindi, Aksam, Yatsi, Cuma)
                              _buildVakitNamazlariGrid(scrollController, provider),
                              // Tab 2: Bayram
                              _buildSingleNamazCard(context, PrayerTime.bayram, provider),
                              // Tab 3: Cenaze
                              _buildSingleNamazCard(context, PrayerTime.cenaze, provider),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        );
      },
    );
  }

  Widget _buildVakitNamazlariGrid(ScrollController scrollController, AppProvider provider) {
    final vakitList = [
      PrayerTime.sabah,
      PrayerTime.ogle,
      PrayerTime.ikindi,
      PrayerTime.aksam,
      PrayerTime.yatsi,
      PrayerTime.cuma,
    ];

    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.25,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: vakitList.length,
      itemBuilder: (context, idx) {
        final time = vakitList[idx];
        String assetName = '';
        switch (time) {
          case PrayerTime.sabah:
            assetName = 'sabah.png';
            break;
          case PrayerTime.ogle:
            assetName = 'ogle.png';
            break;
          case PrayerTime.ikindi:
            assetName = 'ikindi.png';
            break;
          case PrayerTime.aksam:
            assetName = 'aksam.png';
            break;
          case PrayerTime.yatsi:
            assetName = 'yatsi.png';
            break;
          case PrayerTime.cuma:
            assetName = 'cuma.png';
            break;
          default:
            assetName = 'ogle.png';
        }

        return _buildNamazItemCard(context, time, assetName, provider);
      },
    );
  }

  Widget _buildSingleNamazCard(BuildContext context, PrayerTime time, AppProvider provider) {
    String assetName = '';
    String subTitle = '';
    String infoText = '';
    final lang = provider.languageCode;
    
    if (time == PrayerTime.bayram) {
      assetName = 'kurban_bayrami_3008.jpg';
      subTitle = time.getLocalizedName(lang);
      if (lang == 'tr') {
        infoText = 'Ramazan ve Kurban Bayramı namazlarının kılınışı tamamen aynıdır. Yılda iki defa sabah kılınan, zevaid tekbirleri içeren 2 rekatlık namazdır.';
      } else if (lang == 'de') {
        infoText = 'Die Festgebete zu Eid al-Fitr und Eid al-Adha werden genau gleich verrichtet. Es ist ein 2-Rak\'ah-Gebet, das zweimal im Jahr morgens verrichtet wird und zusätzliche Takbire enthält.';
      } else if (lang == 'fr') {
        infoText = 'Les prières de l\'Aïd al-Fitr et de l\'Aïd al-Adha sont accomplies exactement de la même manière. C\'est une prière de 2 rakats accomplie deux fois par an le matin, contenant des takbirs supplémentaires.';
      } else if (lang == 'es') {
        infoText = 'Las oraciones de Eid al-Fitr y Eid al-Adha se realizan exactamente de la misma manera. Es una oración de 2 rakats que se realiza dos veces al año por la mañana, con takbirs adicionales.';
      } else if (lang == 'id') {
        infoText = 'Salat Idul Fitri dan Idul Adha dikerjakan dengan cara yang sama persis. Ini adalah shalat 2 rakaat yang dilakukan dua kali setahun di pagi hari, berisi takbir tambahan.';
      } else if (lang == 'ru') {
        infoText = 'Праздничные молитвы Ид аль-Фитр и Ид аль-Адха совершаются совершенно одинаково. Это двухракаатная молитва, совершаемая дважды в год утром и содержащая дополнительные такбиры.';
      } else if (lang == 'it') {
        infoText = 'Le preghiere di Eid al-Fitr e Eid al-Adha vengono eseguite esattamente allo stesso modo. Si tratta di una preghiera di 2 rakat eseguita due volte all\'anno al mattino, contenente takbir aggiuntivi.';
      } else if (lang == 'ur') {
        infoText = 'عید الفطر اور عید الاضحیٰ کی نمازیں بالکل ایک ہی طریقے سے پڑھی جاتی ہیں۔ یہ 2 رکعت کی نماز ہے جو سال میں دو بار صبح کے وقت ادا کی جاتی ہے، جس میں اضافی تکبیرات شامل ہوتی ہیں۔';
      } else {
        infoText = 'The Eid al-Fitr and Eid al-Adha prayers are prayed exactly the same way. It is a 2-rakat prayer performed twice a year in the morning, containing additional takbirs.';
      }
    } else {
      assetName = 'cenaze.png';
      subTitle = time.getLocalizedName(lang);
      if (lang == 'tr') {
        infoText = 'Vefat eden din kardeşimiz için kılınan, rükûsuz ve secdesiz, ayakta yapılan farz-ı kifaye namazdır.';
      } else if (lang == 'de') {
        infoText = 'Es ist ein Gemeinschaftspflichtgebet (Fard al-Kifayah), das im Stehen ohne Ruku und Sujud für einen verstorbenen Muslim verrichtet wird.';
      } else if (lang == 'fr') {
        infoText = 'C\'est une prière d\'obligation collective (fard al-kifayah) accomplie debout, sans inclinaison (ruku) ni prosternation (sujud), pour notre défunt frère musulman.';
      } else if (lang == 'es') {
        infoText = 'Es una oración de obligación colectiva (fard al-kifayah) que se realiza de pie, sin inclinación (ruku) ni postración (sujud), por nuestro difunto hermano musulmán.';
      } else if (lang == 'id') {
        infoText = 'Ini adalah shalat fardhu kifayah yang dilakukan sambil berdiri, tanpa rukuk atau sujud, untuk saudara sesama Muslim kita yang telah meninggal.';
      } else if (lang == 'ru') {
        infoText = 'Это коллективная обязанность (фард аль-кифая), молитва, совершаемая стоя, без поясных поклонов (руку) и земных поклонов (суджуд), за нашего умершего брата-мусульманина.';
      } else if (lang == 'it') {
        infoText = 'È una preghiera di obbligo collettivo (fard al-kifayah) eseguita in piedi, senza inchinarsi (ruku) o prostrarsi (sujud), per il nostro defunto fratello musulmano.';
      } else if (lang == 'ur') {
        infoText = 'یہ ایک فرض کفایہ نماز ہے جو کھڑے ہو کر بغیر رکوع یا سجدہ کے ہمارے وفات پا جانے والے مسلمان بھائی کے لیے ادا کی جاتی ہے۔';
      } else {
        infoText = 'It is a collective obligation (fard al-kifayah) prayer performed standing, without bowing (ruku) or prostration (sujud), for our deceased fellow Muslim.';
      }
    }

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 250,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('assets/images/$assetName'),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pop(context); // Close selection sheet
              _showPartSelectionDialog(context, time, provider);
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.85),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    subTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      shadows: [
                        Shadow(color: Colors.black87, offset: Offset(0, 1), blurRadius: 4),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _getRekatSummary(time, provider.selectedMezhep, lang),
                    style: const TextStyle(
                      color: AppColors.premiumGold,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    infoText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      height: 1.3,
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

  Widget _buildNamazItemCard(BuildContext context, PrayerTime time, String assetName, AppProvider provider) {
    final lang = provider.languageCode;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage('assets/images/$assetName'),
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.pop(context); // Close time selection sheet
            _showPartSelectionDialog(context, time, provider);
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.85),
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  time.getLocalizedName(lang),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        offset: Offset(0, 1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _getRekatSummary(time, provider.selectedMezhep, lang).split(' (').first,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    shadows: [
                      Shadow(
                        color: Colors.black87,
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  _getRekatSummary(time, provider.selectedMezhep, lang).contains('(')
                      ? _getRekatSummary(time, provider.selectedMezhep, lang).substring(_getRekatSummary(time, provider.selectedMezhep, lang).indexOf('(') + 1, _getRekatSummary(time, provider.selectedMezhep, lang).indexOf(')'))
                      : '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 9,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getRekatSummary(PrayerTime time, Mezhep mezhep, String lang) {
    if (lang == 'tr') {
      switch (time) {
        case PrayerTime.sabah: return '4 Rekat (2 Sünnet, 2 Farz)';
        case PrayerTime.ogle: return '10 Rekat (4 İlk Sünnet, 4 Farz, 2 Son Sünnet)';
        case PrayerTime.ikindi: return '8 Rekat (4 Sünnet, 4 Farz)';
        case PrayerTime.aksam: return '5 Rekat (3 Farz, 2 Sünnet)';
        case PrayerTime.yatsi: return '13 Rekat (4 İlk Sünnet, 4 Farz, 2 Son Sünnet, 3 Vitir)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rekat (4 İlk Sünnet, 2 Farz, 4 Son Sünnet)'
              : '6 Rekat (2 İlk Sünnet, 2 Farz, 2 Son Sünnet)';
        case PrayerTime.bayram: return '2 Rekat (Zevaid Tekbirli)';
        case PrayerTime.cenaze: return '4 Tekbir (Rükûsuz ve Secdesiz)';
      }
    } else if (lang == 'de') {
      switch (time) {
        case PrayerTime.sabah: return '4 Rak\'ah (2 Sunnah, 2 Fard)';
        case PrayerTime.ogle: return '10 Rak\'ah (4 Erste Sunnah, 4 Fard, 2 Letzte Sunnah)';
        case PrayerTime.ikindi: return '8 Rak\'ah (4 Sunnah, 4 Fard)';
        case PrayerTime.aksam: return '5 Rak\'ah (3 Fard, 2 Sunnah)';
        case PrayerTime.yatsi: return '13 Rak\'ah (4 Erste Sunnah, 4 Fard, 2 Letzte Sunnah, 3 Witr)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rak\'ah (4 Erste Sunnah, 2 Fard, 4 Letzte Sunnah)'
              : '6 Rak\'ah (2 Erste Sunnah, 2 Fard, 2 Letzte Sunnah)';
        case PrayerTime.bayram: return '2 Rak\'ah (mit Zevaid-Takbiren)';
        case PrayerTime.cenaze: return '4 Takbire (ohne Ruku und Niederwerfung)';
      }
    } else if (lang == 'fr') {
      switch (time) {
        case PrayerTime.sabah: return '4 Rakat (2 Sunnah, 2 Fard)';
        case PrayerTime.ogle: return '10 Rakat (4 Première Sunnah, 4 Fard, 2 Dernière Sunnah)';
        case PrayerTime.ikindi: return '8 Rakat (4 Sunnah, 4 Fard)';
        case PrayerTime.aksam: return '5 Rakat (3 Fard, 2 Sunnah)';
        case PrayerTime.yatsi: return '13 Rakat (4 Première Sunnah, 4 Fard, 2 Dernière Sunnah, 3 Witr)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rakat (4 Première Sunnah, 2 Fard, 4 Dernière Sunnah)'
              : '6 Rakat (2 Première Sunnah, 2 Fard, 2 Dernière Sunnah)';
        case PrayerTime.bayram: return '2 Rakat (avec Takbirs Zevaid)';
        case PrayerTime.cenaze: return '4 Takbirs (sans Ruku ni Prosternation)';
      }
    } else if (lang == 'es') {
      switch (time) {
        case PrayerTime.sabah: return '4 Rakat (2 Sunnah, 2 Fard)';
        case PrayerTime.ogle: return '10 Rakat (4 Primera Sunnah, 4 Fard, 2 Última Sunnah)';
        case PrayerTime.ikindi: return '8 Rakat (4 Sunnah, 4 Fard)';
        case PrayerTime.aksam: return '5 Rakat (3 Fard, 2 Sunnah)';
        case PrayerTime.yatsi: return '13 Rakat (4 Primera Sunnah, 4 Fard, 2 Última Sunnah, 3 Witr)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rakat (4 Primera Sunnah, 2 Fard, 4 Última Sunnah)'
              : '6 Rakat (2 Primera Sunnah, 2 Fard, 2 Última Sunnah)';
        case PrayerTime.bayram: return '2 Rakat (con Takbirs Zevaid)';
        case PrayerTime.cenaze: return '4 Takbirs (sin Ruku ni Postración)';
      }
    } else if (lang == 'id') {
      switch (time) {
        case PrayerTime.sabah: return '4 Rakaat (2 Sunnah, 2 Fardhu)';
        case PrayerTime.ogle: return '10 Rakaat (4 Sunnah Qabliyah, 4 Fardhu, 2 Sunnah Ba\'diyah)';
        case PrayerTime.ikindi: return '8 Rakaat (4 Sunnah, 4 Fardhu)';
        case PrayerTime.aksam: return '5 Rakaat (3 Fardhu, 2 Sunnah)';
        case PrayerTime.yatsi: return '13 Rakaat (4 Sunnah Qabliyah, 4 Fardhu, 2 Sunnah Ba\'diyah, 3 Witir)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rakaat (4 Sunnah Qabliyah, 2 Fardhu, 4 Sunnah Ba\'diyah)'
              : '6 Rakaat (2 Sunnah Qabliyah, 2 Fardhu, 2 Sunnah Ba\'diyah)';
        case PrayerTime.bayram: return '2 Rakaat (dengan Takbir Zawaid)';
        case PrayerTime.cenaze: return '4 Takbir (tanpa Ruku dan Sujud)';
      }
    } else if (lang == 'ru') {
      switch (time) {
        case PrayerTime.sabah: return '4 Ракаата (2 Сунна, 2 Фард)';
        case PrayerTime.ogle: return '10 Ракаатов (4 Первая Сунна, 4 Фард, 2 Последняя Сунна)';
        case PrayerTime.ikindi: return '8 Ракаатов (4 Сунна, 4 Фард)';
        case PrayerTime.aksam: return '5 Ракаатов (3 Фард, 2 Сунна)';
        case PrayerTime.yatsi: return '13 Ракаатов (4 Первая Сунна, 4 Фард, 2 Последняя Сунна, 3 Витр)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Ракаатов (4 Первая Сунна, 2 Фард, 4 Последняя Сунна)'
              : '6 Ракаатов (2 Первая Сунна, 2 Фард, 2 Последняя Сунна)';
        case PrayerTime.bayram: return '2 Ракаата (с дополнительными такбирами)';
        case PrayerTime.cenaze: return '4 Такбира (без Руку и Суджуда)';
      }
    } else if (lang == 'it') {
      switch (time) {
        case PrayerTime.sabah: return '4 Rakat (2 Sunnah, 2 Fard)';
        case PrayerTime.ogle: return '10 Rakat (4 Prima Sunnah, 4 Fard, 2 Ultima Sunnah)';
        case PrayerTime.ikindi: return '8 Rakat (4 Sunnah, 4 Fard)';
        case PrayerTime.aksam: return '5 Rakat (3 Fard, 2 Sunnah)';
        case PrayerTime.yatsi: return '13 Rakat (4 Prima Sunnah, 4 Fard, 2 Ultima Sunnah, 3 Witr)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rakat (4 Prima Sunnah, 2 Fard, 4 Ultima Sunnah)'
              : '6 Rakat (2 Prima Sunnah, 2 Fard, 2 Ultima Sunnah)';
        case PrayerTime.bayram: return '2 Rakat (con Takbir Zevaid)';
        case PrayerTime.cenaze: return '4 Takbir (senza Ruku o Prostrazione)';
      }
    } else if (lang == 'ur') {
      switch (time) {
        case PrayerTime.sabah: return '4 رکعات (2 سنت، 2 فرض)';
        case PrayerTime.ogle: return '10 رکعات (4 پہلی سنت، 4 فرض، 2 آخری سنت)';
        case PrayerTime.ikindi: return '8 رکعات (4 سنت، 4 فرض)';
        case PrayerTime.aksam: return '5 رکعات (3 فرض، 2 سنت)';
        case PrayerTime.yatsi: return '13 رکعات (4 پہلی سنت، 4 فرض، 2 آخری سنت، 3 وتر)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 رکعات (4 پہلی سنت، 2 فرض، 4 آخری سنت)'
              : '6 رکعات (2 پہلی سنت، 2 فرض، 2 آخری سنت)';
        case PrayerTime.bayram: return '2 رکعات (زائد تکبیرات کے ساتھ)';
        case PrayerTime.cenaze: return '4 تکبیرات (بغیر رکوع اور سجدہ)';
      }
    } else { // default to 'en'
      switch (time) {
        case PrayerTime.sabah: return '4 Rakat (2 Sunnah, 2 Fard)';
        case PrayerTime.ogle: return '10 Rakat (4 First Sunnah, 4 Fard, 2 Last Sunnah)';
        case PrayerTime.ikindi: return '8 Rakat (4 Sunnah, 4 Fard)';
        case PrayerTime.aksam: return '5 Rakat (3 Fard, 2 Sunnah)';
        case PrayerTime.yatsi: return '13 Rakat (4 First Sunnah, 4 Fard, 2 Last Sunnah, 3 Witr)';
        case PrayerTime.cuma:
          return mezhep == Mezhep.hanafi
              ? '10 Rakat (4 First Sunnah, 2 Fard, 4 Last Sunnah)'
              : '6 Rakat (2 First Sunnah, 2 Fard, 2 Last Sunnah)';
        case PrayerTime.bayram: return '2 Rakat (with Zevaid Takbirs)';
        case PrayerTime.cenaze: return '4 Takbirs (no Ruku or Prostration)';
      }
    }
  }

  // BOTTOM SHEET: Select part (Fard vs Sunnah)
  void _showPartSelectionDialog(BuildContext context, PrayerTime time, AppProvider provider) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        final lang = provider.languageCode;
        final prayer = PrayerDatabase.getPrayer(
          provider.selectedMezhep,
          provider.selectedGender,
          time,
          lang,
        );
        final prayerData = prayer.parts.map((p) => p.name).toList();

        final headerText = lang == 'tr' ? '${time.getLocalizedName(lang)} Namazı Kılınışı' :
                           lang == 'de' ? '${time.getLocalizedName(lang)} Gebet' :
                           lang == 'fr' ? 'Prière du ${time.getLocalizedName(lang)}' :
                           lang == 'es' ? 'Oración del ${time.getLocalizedName(lang)}' :
                           lang == 'id' ? 'Panduan Shalat ${time.getLocalizedName(lang)}' :
                           lang == 'ru' ? 'Руководство к намазу ${time.getLocalizedName(lang)}' :
                           lang == 'it' ? 'Guida alla Preghiera di ${time.getLocalizedName(lang)}' :
                           lang == 'ur' ? '${time.getLocalizedName(lang)} کی نماز کا طریقہ' :
                           '${time.getLocalizedName(lang)} Prayer Guide';

        final descText = lang == 'tr' ? 'Kılmak istediğiniz bölümü seçiniz:' :
                         lang == 'de' ? 'Wählen Sie den Abschnitt, den Sie beten möchten:' :
                         lang == 'fr' ? 'Sélectionnez la partie que vous souhaitez prier :' :
                         lang == 'es' ? 'Seleccione la sección que desea rezar:' :
                         lang == 'id' ? 'Pilih bagian yang ingin Anda shalat:' :
                         lang == 'ru' ? 'Выберите часть, которую вы хотите прочитать:' :
                         lang == 'it' ? 'Seleziona la parte che desideri pregare:' :
                         lang == 'ur' ? 'وہ حصہ منتخب کریں جو آپ پڑھنا چاہتے ہیں:' :
                         'Select the part you want to pray:';

        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 20.0,
              right: 20.0,
              top: 20.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    headerText,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.emeraldGreen,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    descText,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 15),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: prayerData.length,
                    itemBuilder: (context, idx) {
                      final partName = prayerData[idx];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 8),
                        color: Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            partName,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(Icons.chevron_right, color: AppColors.emeraldGreen),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrayerGuideScreen(
                                  time: time,
                                  partName: partName,
                                ),
                              ),
                            ).then((_) {
                              AdService.showInterstitialAd();
                            });
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  List<String> _mockHanafiParts(PrayerTime time, Gender gender) {
    switch (time) {
      case PrayerTime.sabah:
        return ['2 Rekat Sünnet', '2 Rekat Farz'];
      case PrayerTime.ogle:
        return ['4 Rekat İlk Sünnet', '4 Rekat Farz', '2 Rekat Son Sünnet'];
      case PrayerTime.ikindi:
        return ['4 Rekat Sünnet', '4 Rekat Farz'];
      case PrayerTime.aksam:
        return ['3 Rekat Farz', '2 Rekat Sünnet'];
      case PrayerTime.yatsi:
        return ['4 Rekat İlk Sünnet', '4 Rekat Farz', '2 Rekat Son Sünnet', '3 Rekat Vitir Vacip'];
      case PrayerTime.cuma:
        return ['4 Rekat İlk Sünnet', '2 Rekat Farz (Cemaatle)', '4 Rekat Son Sünnet'];
      case PrayerTime.bayram:
        return ['Bayram Namazı'];
      case PrayerTime.cenaze:
        return ['Cenaze Namazı'];
    }
  }

  List<String> _mockOtherParts(Mezhep mezhep, Gender gender, PrayerTime time) {
    switch (time) {
      case PrayerTime.sabah:
        return ['2 Rekat Sünnet', '2 Rekat Farz'];
      case PrayerTime.ogle:
        return ['4 Rekat İlk Sünnet', '4 Rekat Farz', '2 Rekat Son Sünnet'];
      case PrayerTime.ikindi:
        return ['4 Rekat Gaflet Sünneti', '4 Rekat Farz'];
      case PrayerTime.aksam:
        return ['3 Rekat Farz', '2 Rekat Sünnet'];
      case PrayerTime.yatsi:
        return ['4 Rekat İlk Sünnet', '4 Rekat Farz', '2 Rekat Son Sünnet', 'Vitir (2+1 Rekat)'];
      case PrayerTime.cuma:
        return ['2 Rekat İlk Sünnet', '2 Rekat Farz (Cemaatle)', '2 Rekat Son Sünnet'];
      case PrayerTime.bayram:
        return ['Bayram Namazı'];
      case PrayerTime.cenaze:
        return ['Cenaze Namazı'];
    }
  }

  // BOTTOM SHEET: Mezhep Info
  void _showMezhepInfoSheet(BuildContext context, bool isDark) {
    final lang = Provider.of<AppProvider>(context, listen: false).languageCode;
    
    final title = lang == 'tr' ? 'Fıkıh Mezhepleri Hakkında' : lang == 'de' ? 'Über islamische Rechtsschulen (Madhhab)' : lang == 'fr' ? 'À propos des écoles de jurisprudence' : lang == 'es' ? 'Acerca de las escuelas de jurisprudencia' : lang == 'id' ? 'Tentang Mazhab Fikih' : lang == 'ru' ? 'О мазхабах фикха' : lang == 'it' ? 'Sulle Scuole di Giurisprudenza' : lang == 'ur' ? 'فقہی مذاہب کے بارے میں' : 'About Schools of Jurisprudence (Madhhab)';
    
    final hanafiTitle = lang == 'tr' ? 'Hanefi Mezhebi' : lang == 'de' ? 'Hanafitische Schule' : lang == 'fr' ? 'École Hanafite' : lang == 'es' ? 'Escuela Hanafí' : lang == 'id' ? 'Mazhab Hanafi' : lang == 'ru' ? 'Ханафитский мазхаб' : lang == 'it' ? 'Scuola Hanafita' : lang == 'ur' ? 'فقہ حنفی' : 'Hanafi School';
    final hanafiDesc = lang == 'tr' ? 'İmam Ebu Hanife\'nin içtihatlarına dayanır. Dünya genelinde en çok tabi olunan mezheptir. Güney Asya, Orta Doğu, Balkanlar ve Orta Asya\'da oldukça yaygındır.' :
                       lang == 'de' ? 'Basiert auf den Urteilen von Imam Abu Hanifa. Es ist die weltweit am meisten befolgte Rechtsschule, sehr verbreitet in Südasien, im Nahen Osten, auf dem Balkan und in Zentralasien.' :
                       lang == 'fr' ? 'Basée sur les jugements de l\'Imam Abou Hanifa. C\'est l\'école la plus suivie au monde, très courante en Asie du Sud, au Moyen-Orient, dans les Balkans et en Asie centrale.' :
                       lang == 'es' ? 'Basada en los juicios del Imam Abu Hanifa. Es la escuela más seguida a nivel mundial, muy común en el sur de Asia, Medio Oriente, los Balcanes y Asia Central.' :
                       lang == 'id' ? 'Berdasarkan ijtihad Imam Abu Hanifah. Ini adalah mazhab yang paling banyak diikuti secara global, sangat umum di Asia Selatan, Timur Tengah, Balkan, dan Asia Tengah.' :
                       lang == 'ru' ? 'Основан на решениях имама Абу Ханифы. Это самый последовательный мазхаб в мире, очень распространен в Южной Азии, на Ближнем Востоке, на Балканах и в Центральной Азии.' :
                       lang == 'it' ? 'Basata sui giudizi dell\'Imam Abu Hanifa. È la scuola più seguita a livello globale, molto comune in Asia del Sud, Medio Oriente, Balcani e Asia Centrale.' :
                       lang == 'ur' ? 'امام ابو حنیفہ کے فیصلوں پر مبنی ہے۔ یہ دنیا بھر میں سب سے زیادہ پیروی کیا جانے والا مسلک ہے، جو جنوبی ایشیا، مشرق وسطیٰ، بلقان اور وسطی ایشیا میں بہت عام ہے۔' :
                       'Based on the rulings of Imam Abu Hanifa. It is the most widely followed school globally, highly common in South Asia, the Middle East, the Balkans, and Central Asia.';

    final shafiiTitle = lang == 'tr' ? 'Şafii Mezhebi' : lang == 'de' ? 'Schafiitische Schule' : lang == 'fr' ? 'École Chaféite' : lang == 'es' ? 'Escuela Shafi\'i' : lang == 'id' ? 'Mazhab Syafi\'i' : lang == 'ru' ? 'Шафиитский мазхаб' : lang == 'it' ? 'Scuola Shafi\'i' : lang == 'ur' ? 'فقہ شافعی' : 'Shafi\'i School';
    final shafiiDesc = lang == 'tr' ? 'İmam Şafii\'nin içtihatlarına dayanır. Doğu Anadolu, Güneydoğu Anadolu, Mısır ve Güneydoğu Asya\'da yaygındır.' :
                       lang == 'de' ? 'Basiert auf den Urteilen von Imam Schafii. Verbreitet in Osttürkei, Ägypten und Südostasien.' :
                       lang == 'fr' ? 'Basée sur les jugements de l\'Imam Chaféi. Répandue dans l\'est de la Turquie, en Égypte et en Asie du Sud-Est.' :
                       lang == 'es' ? 'Basada en los juicios del Imam Shafi\'i. Común en el este de Turquía, Egipto y el sudeste asiático.' :
                       lang == 'id' ? 'Berdasarkan ijtihad Imam Syafi\'i. Umum di Turki timur, Mesir, dan Asia Tenggara.' :
                       lang == 'ru' ? 'Основан на решениях имама аш-Шафии. Распространен в восточной Турции, Египте и Юго-Восточной Азии.' :
                       lang == 'it' ? 'Basata sui giudizi dell\'Imam Shafi\'i. Comune nella Turchia orientale, in Egitto e nel sud-est asiatico.' :
                       lang == 'ur' ? 'امام شافعی کے فیصلوں پر مبنی ہے۔ مشرقی ترکی، مصر اور جنوب مشرقی ایشیا میں عام ہے۔' :
                       'Based on the rulings of Imam Shafi\'i. Common in eastern Turkey, Egypt, and Southeast Asia.';

    final malikiTitle = lang == 'tr' ? 'Maliki Mezhebi' : lang == 'de' ? 'Malikitische Schule' : lang == 'fr' ? 'École Malikite' : lang == 'es' ? 'Escuela Malikí' : lang == 'id' ? 'Mazhab Maliki' : lang == 'ru' ? 'Маликитский мазхаб' : lang == 'it' ? 'Scuola Maliki' : lang == 'ur' ? 'فقہ مالکی' : 'Maliki School';
    final malikiDesc = lang == 'tr' ? 'İmam Malik\'in içtihatlarına dayanır. Kuzey Afrika ve Batı Afrika\'da yaygındır.' :
                       lang == 'de' ? 'Basiert auf den Urteilen von Imam Malik. Verbreitet in Nord- und Westafrika.' :
                       lang == 'fr' ? 'Basée sur les jugements de l\'Imam Malik. Répandue en Afrique du Nord et de l\'Ouest.' :
                       lang == 'es' ? 'Basada en los juicios del Imam Malik. Común en el norte y oeste de África.' :
                       lang == 'id' ? 'Berdasarkan ijtihad Imam Malik. Umum di Afrika Utara dan Barat.' :
                       lang == 'ru' ? 'Основан на решениях имама Малика. Распространен в Северной и Западной Африке.' :
                       lang == 'it' ? 'Basata sui giudizi dell\'Imam Malik. Comune in Nord e Africa occidentale.' :
                       lang == 'ur' ? 'امام مالک کے فیصلوں پر مبنی ہے۔ شمالی اور مغربی افریقہ میں عام ہے۔' :
                       'Based on the rulings of Imam Malik. Common in North and West Africa.';

    final hanbaliTitle = lang == 'tr' ? 'Hanbeli Mezhebi' : lang == 'de' ? 'Hanbalitische Schule' : lang == 'fr' ? 'École Hanbalite' : lang == 'es' ? 'Escuela Hanbalí' : lang == 'id' ? 'Mazhab Hambali' : lang == 'ru' ? 'Ханбалитский мазхаб' : lang == 'it' ? 'Scuola Hanbali' : lang == 'ur' ? 'فقہ حنبلی' : 'Hanbali School';
    final hanbaliDesc = lang == 'tr' ? 'İmam Ahmed bin Hanbel\'in içtihatlarına dayanır. Suudi Arabistan ve Körfez ülkelerinde yaygındır.' :
                       lang == 'de' ? 'Basiert auf den Urteilen von Imam Ahmad bin Hanbal. Verbreitet in Saudi-Arabien und den Golfstaaten.' :
                       lang == 'fr' ? 'Basée sur les jugements de l\'Imam Ahmad bin Hanbal. Répandue en Arabie Saoudite et dans les pays du Golfe.' :
                       lang == 'es' ? 'Basada en los juicios del Imam Ahmad bin Hanbal. Común en Arabia Saudita y los países del Golfo.' :
                       lang == 'id' ? 'Berdasarkan ijtihad Imam Ahmad bin Hambal. Umum di Arab Saudi dan negara-negara Teluk.' :
                       lang == 'ru' ? 'Основан на решениях имама Ахмада ибн Ханбаля. Распространен в Саудовской Аравии и странах Персидского залива.' :
                       lang == 'it' ? 'Basata sui giudizi dell\'Imam Ahmad bin Hanbal. Comune in Arabia Saudita e nei paesi del Golfo.' :
                       lang == 'ur' ? 'امام احمد بن حنبل کے فیصلوں پر مبنی ہے۔ سعودی عرب اور خلیجی ممالک میں عام ہے۔' :
                       'Based on the rulings of Imam Ahmad bin Hanbal. Common in Saudi Arabia and the Gulf countries.';

    final btnText = lang == 'tr' ? 'Anladım' : lang == 'de' ? 'Verstanden' : lang == 'fr' ? 'Compris' : lang == 'es' ? 'Entendido' : lang == 'id' ? 'Mengerti' : lang == 'ru' ? 'Понятно' : lang == 'it' ? 'Capito' : lang == 'ur' ? 'سمجھ گیا' : 'Understood';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Fix for landscape
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 24.0,
              right: 24.0,
              top: 24.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                  ),
                ),
                const SizedBox(height: 16),
                _buildMezhepDetailItem(
                  title: hanafiTitle,
                  description: hanafiDesc,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildMezhepDetailItem(
                  title: shafiiTitle,
                  description: shafiiDesc,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildMezhepDetailItem(
                  title: malikiTitle,
                  description: malikiDesc,
                  isDark: isDark,
                ),
                const SizedBox(height: 16),
                _buildMezhepDetailItem(
                  title: hanbaliTitle,
                  description: hanbaliDesc,
                  isDark: isDark,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.emeraldGreen,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text(btnText, style: const TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          ), // end SingleChildScrollView
        );
      },
    );
  }

  Widget _buildMezhepDetailItem({required String title, required String description, required bool isDark}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: AppColors.premiumGold),
        ),
        const SizedBox(height: 4),
        Text(
          description,
          style: TextStyle(
            fontSize: 12.5,
            color: isDark ? Colors.white70 : Colors.black87,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}
