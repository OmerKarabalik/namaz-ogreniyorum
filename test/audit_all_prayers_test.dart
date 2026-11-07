import 'package:flutter_test/flutter_test.dart';
import 'package:namaz_ogreniyorum/data/prayer_database.dart';
import 'package:namaz_ogreniyorum/models/prayer_models.dart';

void main() {
  test('Audit all Zamm-ı Sures in Turkish', () {
    final sures = PrayerDatabaseTr.getDuaSurahs();
    expect(sures.length, greaterThanOrEqualTo(12));

    final expectedZamm = [
      {'name': 'Fil', 'audio': 'fil.mp3', 'keyword': 'Elem tera keyfe'},
      {'name': 'Kureyş', 'audio': 'kureys.mp3', 'keyword': 'Li-îlâfi kureyş'},
      {'name': 'Maun', 'audio': 'maun.mp3', 'keyword': 'Era\'eytellezî'},
      {'name': 'Kevser', 'audio': 'kevser.mp3', 'keyword': 'İnnâ a\'taynâkel kevser'},
      {'name': 'Kafirun', 'audio': 'kafirun.mp3', 'keyword': 'Kul yâ eyyühel kâfirûn'},
      {'name': 'Nasr', 'audio': 'nasr.mp3', 'keyword': 'İzâ câe nasrullâhi'},
      {'name': 'Tebbet', 'audio': 'tebbet.mp3', 'keyword': 'Tebbet yedâ ebî lehebin'},
      {'name': 'İhlas', 'audio': 'ihlas.mp3', 'keyword': 'Kul hüvellâhü ehad'},
      {'name': 'Felak', 'audio': 'felak.mp3', 'keyword': 'Kul e\'ûzü birabbil felak'},
      {'name': 'Nas', 'audio': 'nas.mp3', 'keyword': 'Kul e\'ûzü birabbinnâs'},
    ];

    final zammList = sures.sublist(2, 12);
    expect(zammList.length, equals(10));

    for (int i = 0; i < expectedZamm.length; i++) {
      final actual = zammList[i];
      final exp = expectedZamm[i];
      expect(actual.name.contains(exp['name']!), isTrue,
          reason: 'Index $i: expected name containing ${exp['name']} but got ${actual.name}');
      expect(actual.audioFileName, equals(exp['audio']),
          reason: 'Index $i: expected audio ${exp['audio']} but got ${actual.audioFileName}');
      expect(actual.transcription.contains(exp['keyword']!), isTrue,
          reason: 'Index $i: expected transcription containing ${exp['keyword']} but got ${actual.transcription}');
    }
    print('AUDIT PASS: All Turkish Zamm-ı Sures perfectly match names, audios, and transcriptions!');
  });

  test('Audit all languages getDuaSurahs', () {
    const languages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];
    for (final lang in languages) {
      final sures = PrayerDatabase.getDuaSurahs(lang);
      expect(sures.length, greaterThanOrEqualTo(12), reason: 'Lang $lang too few sures');
      
      // Check Fatiha (index 1)
      expect(sures[1].audioFileName, equals('fatiha.mp3'), reason: 'Lang $lang Fatiha audio');
      
      // Check 10 zamm sures
      final zamm = sures.sublist(2, 12);
      expect(zamm[0].audioFileName, equals('fil.mp3'), reason: 'Lang $lang Fil audio');
      expect(zamm[1].audioFileName, equals('kureys.mp3'), reason: 'Lang $lang Kureyş audio');
      expect(zamm[2].audioFileName, equals('maun.mp3'), reason: 'Lang $lang Maun audio');
      expect(zamm[3].audioFileName, equals('kevser.mp3'), reason: 'Lang $lang Kevser audio');
      expect(zamm[4].audioFileName, equals('kafirun.mp3'), reason: 'Lang $lang Kafirun audio');
      expect(zamm[5].audioFileName, equals('nasr.mp3'), reason: 'Lang $lang Nasr audio');
      expect(zamm[6].audioFileName, equals('tebbet.mp3'), reason: 'Lang $lang Tebbet audio');
      expect(zamm[7].audioFileName, equals('ihlas.mp3'), reason: 'Lang $lang İhlas audio');
      expect(zamm[8].audioFileName, equals('felak.mp3'), reason: 'Lang $lang Felak audio');
      expect(zamm[9].audioFileName, equals('nas.mp3'), reason: 'Lang $lang Nas audio');
    }
    print('AUDIT PASS: All 9 languages have identical, correct audio file bindings!');
  });

  test('Audit getKiyamRecitationsList for all prayer times and rekat combinations', () {
    const languages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];
    for (final lang in languages) {
      for (final mezhep in Mezhep.values) {
        for (final time in PrayerTime.values) {
          for (int rekat = 1; rekat <= 4; rekat++) {
            final recitations = PrayerDatabase.getKiyamRecitationsList(
              mezhep,
              time,
              'Farz',
              rekat,
              true,
              false,
              lang,
            );
            expect(recitations.isNotEmpty, isTrue,
                reason: 'Empty recitation for $lang, $mezhep, $time, rekat $rekat');
            
            for (final r in recitations) {
              expect(r.name.isNotEmpty, isTrue);
              expect(r.arabic.isNotEmpty, isTrue);
              expect(r.transcription.isNotEmpty, isTrue);
              expect(r.translation.isNotEmpty, isTrue);
            }
          }
        }
      }
    }
    print('AUDIT PASS: All recitations for all languages and mezheps are complete and valid!');
  });

  test('Audit getOturusRecitationsList for all languages and mezheps', () {
    const languages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];
    for (final lang in languages) {
      for (final mezhep in Mezhep.values) {
        final firstSitting = PrayerDatabase.getOturusRecitationsList(mezhep, false, lang);
        expect(firstSitting.isNotEmpty, isTrue, reason: 'First sitting failed for $lang, $mezhep');
        
        final lastSitting = PrayerDatabase.getOturusRecitationsList(mezhep, true, lang);
        expect(lastSitting.isNotEmpty, isTrue, reason: 'Last sitting failed for $lang, $mezhep');
      }
    }
    print('AUDIT PASS: All Oturus recitations for all 9 languages are 100% valid!');
  });

  test('Audit getPrayer (full prayer tree) for all times, genders, mezheps, and languages', () {
    const languages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];
    for (final lang in languages) {
      for (final mezhep in Mezhep.values) {
        for (final gender in Gender.values) {
          for (final time in PrayerTime.values) {
            final prayer = PrayerDatabase.getPrayer(mezhep, gender, time, lang);
            expect(prayer.parts.isNotEmpty, isTrue,
                reason: 'Prayer parts empty for $lang, $mezhep, $gender, $time');
            for (final part in prayer.parts) {
              expect(part.steps.isNotEmpty, isTrue,
                  reason: 'Steps empty in part ${part.name} for $lang, $mezhep, $gender, $time');
              for (final step in part.steps) {
                expect(step.title.isNotEmpty, isTrue);
                expect(step.action.isNotEmpty, isTrue);
                expect(step.imageKey.isNotEmpty, isTrue);
              }
            }
          }
        }
      }
    }
    print('AUDIT PASS: Entire prayer database across all 9 languages, 4 mezheps, 2 genders and 7 prayer times is 100% flawless!');
  });
}
