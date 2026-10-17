import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:namaz_ogreniyorum/providers/app_provider.dart';
import 'package:namaz_ogreniyorum/screens/splash_screen.dart';
import 'package:namaz_ogreniyorum/screens/main_layout.dart';
import 'package:namaz_ogreniyorum/screens/lessons_tab.dart';
import 'package:namaz_ogreniyorum/screens/progress_tab.dart';
import 'package:namaz_ogreniyorum/screens/settings_tab.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      const MethodChannel('plugins.flutter.io/google_mobile_ads'),
      (MethodCall methodCall) async => null,
    );
    SharedPreferences.setMockInitialValues({'has_shown_ad_notice': true});
  });

  final languages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];

  group('9-Language Comprehensive Execution Suite', () {
    for (final lang in languages) {
      testWidgets('Language [$lang] provider & all UI screens test', (WidgetTester tester) async {
        final provider = AppProvider();
        await provider.setLanguageCode(lang);
        expect(provider.languageCode, equals(lang));

        final isRtl = lang == 'ur' || lang == 'ar';

        // SplashScreen
        await tester.pumpWidget(
          ChangeNotifierProvider<AppProvider>.value(
            value: provider,
            child: MaterialApp(
              home: Directionality(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                child: const SplashScreen(),
              ),
            ),
          ),
        );
        expect(find.byType(SplashScreen), findsOneWidget);

        // MainLayout
        await tester.pumpWidget(
          ChangeNotifierProvider<AppProvider>.value(
            value: provider,
            child: MaterialApp(
              home: Directionality(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                child: const MainLayout(),
              ),
            ),
          ),
        );
        expect(find.byType(MainLayout), findsOneWidget);

        // LessonsTab
        await tester.pumpWidget(
          ChangeNotifierProvider<AppProvider>.value(
            value: provider,
            child: MaterialApp(
              home: Directionality(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                child: const LessonsTab(),
              ),
            ),
          ),
        );
        expect(find.byType(LessonsTab), findsOneWidget);

        // ProgressTab
        await tester.pumpWidget(
          ChangeNotifierProvider<AppProvider>.value(
            value: provider,
            child: MaterialApp(
              home: Directionality(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                child: const ProgressTab(),
              ),
            ),
          ),
        );
        expect(find.byType(ProgressTab), findsOneWidget);

        // SettingsTab
        await tester.pumpWidget(
          ChangeNotifierProvider<AppProvider>.value(
            value: provider,
            child: MaterialApp(
              home: Directionality(
                textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
                child: const SettingsTab(),
              ),
            ),
          ),
        );
        expect(find.byType(SettingsTab), findsOneWidget);
      });
    }
  });
}
