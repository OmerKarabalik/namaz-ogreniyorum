import 'package:flutter_test/flutter_test.dart';
import 'package:adhan/adhan.dart';
import 'package:namaz_ogreniyorum/services/prayer_times_service.dart';

void main() {
  test('Istanbul prayer times test matches Diyanet standard Asr (Asr-i Evvel)', () {
    // Istanbul coordinates (Central Fatih)
    const lat = 41.0082;
    const lng = 28.9784;
    final now = DateTime(2026, 9, 29, 12, 0);

    final prayerTimes = PrayerTimesService.getPrayerTimes(
      latitude: lat,
      longitude: lng,
      date: now,
      method: CalculationMethod.turkey,
      madhab: Madhab.hanafi, // User selected Hanafi
    );

    // Asr time must be Asr-i Evvel (1x shadow, around 16:17 for Sept 29), not Asr-i Sani (~17:07)
    final asrHour = prayerTimes.asr.toLocal().hour;
    final asrMinute = prayerTimes.asr.toLocal().minute;

    // Verify Asr is 16:xx (4 PM hour), matching Diyanet takvimi
    expect(asrHour, equals(16));
    expect(asrMinute, equals(17));
  });
}
