enum Mezhep { hanafi, shafii, maliki, hanbali }

extension MezhepExtension on Mezhep {
  String get displayName {
    switch (this) {
      case Mezhep.hanafi:
        return 'Hanefi';
      case Mezhep.shafii:
        return 'Şafiî';
      case Mezhep.maliki:
        return 'Maliki';
      case Mezhep.hanbali:
        return 'Hanbeli';
    }
  }

  String get description {
    switch (this) {
      case Mezhep.hanafi:
        return 'İmam-ı Azam Ebû Hanîfe\'nin içtihatlarına dayanan mezhep. Türkiye ve Orta Asya\'da en yaygın mezheptir.';
      case Mezhep.shafii:
        return 'İmam Şafiî\'nin içtihatlarına dayanan mezhep. Doğu Anadolu, Güneydoğu Anadolu ve Doğu Asya\'da yaygındır.';
      case Mezhep.maliki:
        return 'İmam Malik b. Enes\'in içtihatlarına dayanan mezhep. Kuzey Afrika\'da yaygındır.';
      case Mezhep.hanbali:
        return 'İmam Ahmed b. Hanbel\'in içtihatlarına dayanan mezhep. Körfez ülkelerinde yaygındır.';
    }
  }
}

enum Gender { male, female }

extension GenderExtension on Gender {
  String get displayName {
    switch (this) {
      case Gender.male:
        return 'Erkek';
      case Gender.female:
        return 'Kadın';
    }
  }
}

enum PrayerTime { sabah, ogle, ikindi, aksam, yatsi, cuma, bayram, cenaze }

extension PrayerTimeExtension on PrayerTime {
  String get displayName {
    switch (this) {
      case PrayerTime.sabah:
        return 'Sabah';
      case PrayerTime.ogle:
        return 'Öğle';
      case PrayerTime.ikindi:
        return 'İkindi';
      case PrayerTime.aksam:
        return 'Akşam';
      case PrayerTime.yatsi:
        return 'Yatsı';
      case PrayerTime.cuma:
        return 'Cuma';
      case PrayerTime.bayram:
        return 'Bayram';
      case PrayerTime.cenaze:
        return 'Cenaze';
    }
  }

  String get description {
    switch (this) {
      case PrayerTime.sabah:
        return 'Tan yerinin ağarmasından güneşin doğmasına kadar olan vakit. (4 Rekat: 2 Sünnet, 2 Farz)';
      case PrayerTime.ogle:
        return 'Güneşin tam tepeden batıya meyil etmesinden ikindi vaktine kadar olan vakit. (10 Rekat: 4 İlk Sünnet, 4 Farz, 2 Son Sünnet)';
      case PrayerTime.ikindi:
        return 'Güneşin sararmaya başlamasından akşam vaktine kadar olan vakit. (8 Rekat: 4 Sünnet, 4 Farz)';
      case PrayerTime.aksam:
        return 'Güneşin batmasından yatsı vaktine kadar olan vakit. (5 Rekat: 3 Farz, 2 Sünnet)';
      case PrayerTime.yatsi:
        return 'Gecenin karanlığı başlayıp tan yeri ağarmasına kadar olan vakit. (13 Rekat: 4 İlk Sünnet, 4 Farz, 2 Son Sünnet, 3 Vitir)';
      case PrayerTime.cuma:
        return 'Cuma günü öğle vaktinde cemaatle kılınan farz namazdır. (Hanefide 10 Rekat: 4 İlk Sünnet, 2 Farz, 4 Son Sünnet. Şafiîde 6 Rekat: 2 İlk Sünnet, 2 Farz, 2 Son Sünnet)';
      case PrayerTime.bayram:
        return 'Ramazan ve Kurban bayramlarının sabahında kılınan, ilave (zevaid) tekbirler içeren 2 rekatlık namazdır.';
      case PrayerTime.cenaze:
        return 'Vefat eden din kardeşimiz için kılınan, rükûsuz ve secdesiz, tamamen ayakta ifa edilen dua niteliğinde namazdır.';
    }
  }
}

class PrayerStep {
  final int stepNumber;
  final String title;
  final String action;
  final String? arabicText;
  final String? transcription;
  final String? translation;
  final String imageKey; // E.g. 'niyet', 'tekbir', 'kiyam', 'ruku', 'secde'
  final String? note;
  final String? audioPath;

  PrayerStep({
    required this.stepNumber,
    required this.title,
    required this.action,
    this.arabicText,
    this.transcription,
    this.translation,
    required this.imageKey,
    this.note,
    this.audioPath,
  });
}

class PrayerPart {
  final String name; // E.g. '2 Rekat Sünnet', '2 Rekat Farz'
  final int rakatCount;
  final List<PrayerStep> steps;

  PrayerPart({
    required this.name,
    required this.rakatCount,
    required this.steps,
  });
}

class Prayer {
  final PrayerTime time;
  final String description;
  final List<PrayerPart> parts;

  Prayer({
    required this.time,
    required this.description,
    required this.parts,
  });
}

class DuaSurah {
  final String name;
  final String audioFileName;
  final String arabic;
  final String transcription;
  final String translation;
  final String description;

  DuaSurah({
    required this.name,
    this.audioFileName = '',
    required this.arabic,
    required this.transcription,
    required this.translation,
    required this.description,
  });
}

class AbdestStep {
  final int stepNumber;
  final String title;
  final String action;
  final String imageKey;

  AbdestStep({
    required this.stepNumber,
    required this.title,
    required this.action,
    required this.imageKey,
  });
}

extension MezhepLocalExtension on Mezhep {
  String getLocalizedName(String lang) {
    switch (lang) {
      case 'en':
        return this == Mezhep.hanafi ? 'Hanafi' : this == Mezhep.shafii ? 'Shafi\'i' : this == Mezhep.maliki ? 'Maliki' : 'Hanbali';
      case 'de':
        return this == Mezhep.hanafi ? 'Hanafi' : this == Mezhep.shafii ? 'Schafi\'i' : this == Mezhep.maliki ? 'Maliki' : 'Hanbali';
      case 'fr':
        return this == Mezhep.hanafi ? 'Hanafite' : this == Mezhep.shafii ? 'Chafiite' : this == Mezhep.maliki ? 'Malikite' : 'Hanbalite';
      case 'es':
        return this == Mezhep.hanafi ? 'Hanafí' : this == Mezhep.shafii ? 'Shafi\'í' : this == Mezhep.maliki ? 'Malikí' : 'Hanbalí';
      case 'id':
        return this == Mezhep.hanafi ? 'Hanafi' : this == Mezhep.shafii ? 'Syafi\'i' : this == Mezhep.maliki ? 'Maliki' : 'Hanbali';
      case 'ru':
        return this == Mezhep.hanafi ? 'Ханафитский' : this == Mezhep.shafii ? 'Шафиитский' : this == Mezhep.maliki ? 'Маликитский' : 'Ханбалитский';
      case 'it':
        return this == Mezhep.hanafi ? 'Hanafita' : this == Mezhep.shafii ? 'Shafi\'ita' : this == Mezhep.maliki ? 'Malikita' : 'Hanbalita';
      case 'ur':
        return this == Mezhep.hanafi ? 'حنفی' : this == Mezhep.shafii ? 'شافعی' : this == Mezhep.maliki ? 'مالکی' : 'حنبلی';
      default:
        return displayName;
    }
  }
}

extension GenderLocalExtension on Gender {
  String getLocalizedName(String lang) {
    switch (lang) {
      case 'en':
        return this == Gender.male ? 'Male' : 'Female';
      case 'de':
        return this == Gender.male ? 'Männer' : 'Frauen';
      case 'fr':
        return this == Gender.male ? 'Homme' : 'Femme';
      case 'es':
        return this == Gender.male ? 'Hombre' : 'Mujer';
      case 'id':
        return this == Gender.male ? 'Pria' : 'Wanita';
      case 'ru':
        return this == Gender.male ? 'Мужчина' : 'Женщина';
      case 'it':
        return this == Gender.male ? 'Uomo' : 'Donna';
      case 'ur':
        return this == Gender.male ? 'مرد' : 'عورت';
      default:
        return displayName;
    }
  }
}

extension PrayerTimeLocalExtension on PrayerTime {
  String getLocalizedName(String lang) {
    switch (lang) {
      case 'en':
        switch (this) {
          case PrayerTime.sabah: return 'Fajr';
          case PrayerTime.ogle: return 'Dhuhr';
          case PrayerTime.ikindi: return 'Asr';
          case PrayerTime.aksam: return 'Maghrib';
          case PrayerTime.yatsi: return 'Isha';
          case PrayerTime.cuma: return 'Jumah';
          case PrayerTime.bayram: return 'Eid';
          case PrayerTime.cenaze: return 'Funeral';
        }
      case 'de':
        switch (this) {
          case PrayerTime.sabah: return 'Fajr';
          case PrayerTime.ogle: return 'Dhuhr';
          case PrayerTime.ikindi: return 'Asr';
          case PrayerTime.aksam: return 'Maghrib';
          case PrayerTime.yatsi: return 'Isha';
          case PrayerTime.cuma: return 'Freitagsgebet';
          case PrayerTime.bayram: return 'Festgebet';
          case PrayerTime.cenaze: return 'Totengebet';
        }
      case 'fr':
        switch (this) {
          case PrayerTime.sabah: return 'Fajr';
          case PrayerTime.ogle: return 'Dhuhr';
          case PrayerTime.ikindi: return 'Asr';
          case PrayerTime.aksam: return 'Maghrib';
          case PrayerTime.yatsi: return 'Isha';
          case PrayerTime.cuma: return 'Jumah';
          case PrayerTime.bayram: return 'Aïd';
          case PrayerTime.cenaze: return 'Funéraire';
        }
      case 'es':
        switch (this) {
          case PrayerTime.sabah: return 'Fajr';
          case PrayerTime.ogle: return 'Dhuhr';
          case PrayerTime.ikindi: return 'Asr';
          case PrayerTime.aksam: return 'Maghrib';
          case PrayerTime.yatsi: return 'Isha';
          case PrayerTime.cuma: return 'Jumah';
          case PrayerTime.bayram: return 'Eid';
          case PrayerTime.cenaze: return 'Funeral';
        }
      case 'id':
        switch (this) {
          case PrayerTime.sabah: return 'Subuh';
          case PrayerTime.ogle: return 'Dzuhur';
          case PrayerTime.ikindi: return 'Ashar';
          case PrayerTime.aksam: return 'Maghrib';
          case PrayerTime.yatsi: return 'Isya';
          case PrayerTime.cuma: return 'Jumat';
          case PrayerTime.bayram: return 'Id';
          case PrayerTime.cenaze: return 'Jenazah';
        }
      case 'ru':
        switch (this) {
          case PrayerTime.sabah: return 'Фаджр';
          case PrayerTime.ogle: return 'Зухр';
          case PrayerTime.ikindi: return 'Аср';
          case PrayerTime.aksam: return 'Магриб';
          case PrayerTime.yatsi: return 'Иша';
          case PrayerTime.cuma: return 'Джума';
          case PrayerTime.bayram: return 'Ид';
          case PrayerTime.cenaze: return 'Джаназа';
        }
      case 'it':
        switch (this) {
          case PrayerTime.sabah: return 'Fajr';
          case PrayerTime.ogle: return 'Dhuhr';
          case PrayerTime.ikindi: return 'Asr';
          case PrayerTime.aksam: return 'Maghrib';
          case PrayerTime.yatsi: return 'Isha';
          case PrayerTime.cuma: return 'Jumu\'ah';
          case PrayerTime.bayram: return 'Eid';
          case PrayerTime.cenaze: return 'Janazah';
        }
      case 'ur':
        switch (this) {
          case PrayerTime.sabah: return 'فجر';
          case PrayerTime.ogle: return 'ظہر';
          case PrayerTime.ikindi: return 'عصر';
          case PrayerTime.aksam: return 'مغرب';
          case PrayerTime.yatsi: return 'عشاء';
          case PrayerTime.cuma: return 'جمعہ';
          case PrayerTime.bayram: return 'عید';
          case PrayerTime.cenaze: return 'جنازہ';
        }
      default:
        return displayName;
    }
  }
}
