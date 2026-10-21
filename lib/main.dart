import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants/theme.dart';
import 'providers/app_provider.dart';
import 'screens/splash_screen.dart';
import 'services/ad_service.dart';
import 'services/notification_service.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Notification Service safely
  try {
    await NotificationService.initialize();
  } catch (e) {
    debugPrint('NotificationService initialization warning: $e');
  }

  // Initialize AdMob asynchronously in the background so it never delays startup or causes ANR
  Future.microtask(() async {
    try {
      await AdService.initialize();
    } catch (e) {
      debugPrint('AdService initialization warning: $e');
    }
  });
  
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: const NamazOgreniyorumApp(),
    ),
  );
}

class NamazOgreniyorumApp extends StatelessWidget {
  const NamazOgreniyorumApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);

    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Namazı Öğreniyorum',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: appProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) {
        // Enforce RTL directionality for Urdu and Arabic
        final isRtl = appProvider.languageCode == 'ur' || appProvider.languageCode == 'ar';
        return Directionality(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const SplashScreen(),
    );
  }
}
