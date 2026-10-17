import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:namaz_ogreniyorum/data/prayer_database.dart';
import 'package:namaz_ogreniyorum/models/prayer_models.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final languages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];

  group('Kunut & Mezhep Prayers Comprehensive Verification', () {
    test('Audio files exist on disk', () {
      final requiredAudioFiles = [
        'kunut_1.mp3',
        'kunut_2.mp3',
        'kunut_safii.mp3',
      ];
      for (final file in requiredAudioFiles) {
        final f = File('assets/audio/$file');
        expect(f.existsSync(), isTrue, reason: 'Missing $file in assets/audio');
        expect(f.lengthSync(), greaterThan(10000), reason: '$file is too small or corrupt');
      }
    });

    for (final lang in languages) {
      test('Language [$lang] - Shafi Fajr includes Shafi Kunut step with kunut_safii.mp3 for male & female', () {
        for (final gender in [Gender.male, Gender.female]) {
          final prayer = PrayerDatabase.getPrayer(Mezhep.shafii, gender, PrayerTime.sabah, lang);
          final farzPart = prayer.parts.last; // Farz is the 2nd part of Sabah namaz
          
          final kunutSteps = farzPart.steps.where((s) => s.audioPath == 'kunut_safii.mp3').toList();
          expect(kunutSteps.length, 1, reason: 'Language $lang gender ${gender.name} must have exactly 1 kunut_safii step in Sabah farz');
          
          final step = kunutSteps.first;
          expect(step.arabicText, isNotNull);
          expect(step.arabicText!.isNotEmpty, isTrue);
          expect(step.transcription, isNotNull);
          expect(step.transcription!.isNotEmpty, isTrue);
          expect(step.translation, isNotNull);
          expect(step.translation!.isNotEmpty, isTrue);
        }
      });

      test('Language [$lang] - Hanafi Vitir separates Kunut 1 and Kunut 2 with audio for male & female', () {
        for (final gender in [Gender.male, Gender.female]) {
          final prayer = PrayerDatabase.getPrayer(Mezhep.hanafi, gender, PrayerTime.yatsi, lang);
          final vitirPart = prayer.parts.last; // Vitir is the last part
          
          final kunut1Steps = vitirPart.steps.where((s) => s.audioPath == 'kunut_1.mp3').toList();
          final kunut2Steps = vitirPart.steps.where((s) => s.audioPath == 'kunut_2.mp3').toList();

          expect(kunut1Steps.length, 1, reason: 'Language $lang gender ${gender.name} must have exactly 1 kunut_1 step in Vitir');
          expect(kunut2Steps.length, 1, reason: 'Language $lang gender ${gender.name} must have exactly 1 kunut_2 step in Vitir');

          final step1 = kunut1Steps.first;
          final step2 = kunut2Steps.first;

          expect(step1.arabicText, isNotNull);
          expect(step1.arabicText!.isNotEmpty, isTrue);
          expect(step1.translation, isNotNull);
          expect(step1.translation!.isNotEmpty, isTrue);

          expect(step2.arabicText, isNotNull);
          expect(step2.arabicText!.isNotEmpty, isTrue);
          expect(step2.translation, isNotNull);
          expect(step2.translation!.isNotEmpty, isTrue);
        }
      });

      test('Language [$lang] - Shafi Vitir includes Shafi Kunut step with kunut_safii.mp3 for male & female', () {
        for (final gender in [Gender.male, Gender.female]) {
          final prayer = PrayerDatabase.getPrayer(Mezhep.shafii, gender, PrayerTime.yatsi, lang);
          final vitirPart = prayer.parts.last;

          final kunutSteps = vitirPart.steps.where((s) => s.audioPath == 'kunut_safii.mp3').toList();
          expect(kunutSteps.length, 1, reason: 'Language $lang gender ${gender.name} must have kunut_safii step in Shafi Vitir');
        }
      });
    }
  });
}
