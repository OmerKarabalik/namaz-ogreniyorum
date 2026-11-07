import '../models/prayer_models.dart';
import 'prayer_database_en.dart';
import 'prayer_database_de.dart';
import 'prayer_database_fr.dart';
import 'prayer_database_es.dart';
import 'prayer_database_id.dart';
import 'prayer_database_ru.dart';
import 'prayer_database_it.dart';
import 'prayer_database_ur.dart';

class PrayerDatabase {
  static List<DuaSurah> getDuaSurahs(String lang) {
    switch (lang) {
      case 'en':
        return PrayerDatabaseEn.getDuaSurahs();
      case 'de':
        return PrayerDatabaseDe.getDuaSurahs();
      case 'fr':
        return PrayerDatabaseFr.getDuaSurahs();
      case 'es':
        return PrayerDatabaseEs.getDuaSurahs();
      case 'id':
        return PrayerDatabaseId.getDuaSurahs();
      case 'ru':
        return PrayerDatabaseRu.getDuaSurahs();
      case 'it':
        return PrayerDatabaseIt.getDuaSurahs();
      case 'ur':
        return PrayerDatabaseUr.getDuaSurahs();
      default:
        return PrayerDatabaseTr.getDuaSurahs();
    }
  }

  static List<AbdestStep> getAbdestSteps(Mezhep mezhep, String lang) {
    switch (lang) {
      case 'en':
        return PrayerDatabaseEn.getAbdestSteps(mezhep);
      case 'de':
        return PrayerDatabaseDe.getAbdestSteps(mezhep);
      case 'fr':
        return PrayerDatabaseFr.getAbdestSteps(mezhep);
      case 'es':
        return PrayerDatabaseEs.getAbdestSteps(mezhep);
      case 'id':
        return PrayerDatabaseId.getAbdestSteps(mezhep);
      case 'ru':
        return PrayerDatabaseRu.getAbdestSteps(mezhep);
      case 'it':
        return PrayerDatabaseIt.getAbdestSteps(mezhep);
      case 'ur':
        return PrayerDatabaseUr.getAbdestSteps(mezhep);
      default:
        return PrayerDatabaseTr.getAbdestSteps(mezhep);
    }
  }

  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time, String lang) {
    switch (lang) {
      case 'en':
        return PrayerDatabaseEn.getPrayer(mezhep, gender, time);
      case 'de':
        return PrayerDatabaseDe.getPrayer(mezhep, gender, time);
      case 'fr':
        return PrayerDatabaseFr.getPrayer(mezhep, gender, time);
      case 'es':
        return PrayerDatabaseEs.getPrayer(mezhep, gender, time);
      case 'id':
        return PrayerDatabaseId.getPrayer(mezhep, gender, time);
      case 'ru':
        return PrayerDatabaseRu.getPrayer(mezhep, gender, time);
      case 'it':
        return PrayerDatabaseIt.getPrayer(mezhep, gender, time);
      case 'ur':
        return PrayerDatabaseUr.getPrayer(mezhep, gender, time);
      default:
        return PrayerDatabaseTr.getPrayer(mezhep, gender, time);
    }
  }

  static List<DuaSurah> getKiyamRecitationsList(
    Mezhep mezhep,
    PrayerTime time,
    String partName,
    int rekat,
    bool isFarz,
    bool isIkindiYatsi,
    String lang,
  ) {
    switch (lang) {
      case 'en':
        return PrayerDatabaseEn.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'de':
        return PrayerDatabaseDe.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'fr':
        return PrayerDatabaseFr.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'es':
        return PrayerDatabaseEs.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'id':
        return PrayerDatabaseId.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'ru':
        return PrayerDatabaseRu.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'it':
        return PrayerDatabaseIt.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      case 'ur':
        return PrayerDatabaseUr.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
      default:
        return PrayerDatabaseTr.getKiyamRecitationsList(mezhep, time, partName, rekat, isFarz, isIkindiYatsi);
    }
  }

  static List<DuaSurah> getOturusRecitationsList(Mezhep mezhep, bool isLast, String lang) {
    switch (lang) {
      case 'en':
        return PrayerDatabaseEn.getOturusRecitationsList(mezhep, isLast);
      case 'de':
        return PrayerDatabaseDe.getOturusRecitationsList(mezhep, isLast);
      case 'fr':
        return PrayerDatabaseFr.getOturusRecitationsList(mezhep, isLast);
      case 'es':
        return PrayerDatabaseEs.getOturusRecitationsList(mezhep, isLast);
      case 'id':
        return PrayerDatabaseId.getOturusRecitationsList(mezhep, isLast);
      case 'ru':
        return PrayerDatabaseRu.getOturusRecitationsList(mezhep, isLast);
      case 'it':
        return PrayerDatabaseIt.getOturusRecitationsList(mezhep, isLast);
      case 'ur':
        return PrayerDatabaseUr.getOturusRecitationsList(mezhep, isLast);
      default:
        return PrayerDatabaseTr.getOturusRecitationsList(mezhep, isLast);
    }
  }
}

class PrayerDatabaseTr {
  // --- SURE VE DUALAR ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Sübhaneke',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Sübhanekellahümme ve bihamdik. Ve tebârekesmük. Ve teâlâ ceddük. Ve celle senâük (Sadece cenaze namazında). Ve lâ ilâhe ğayrûk.',
        translation: 'Allah\'ım! Sen noksan sıfatlardan pak ve uzaksın. Seni daima böyle tenzih eder ve överim. Senin adın mübarektir. Varlığın her şeyden üstündür. Şanın yücedir (Sadece cenaze namazında). Senden başka ilah yoktur.',
        description: 'Namazların ilk rekatında, iftitah tekbirinden sonra ilk olarak okunan duadır. \n\n[Not: "Ve celle senâük" kısmı sadece cenaze namazında okunur.]',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Fatiha Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahirrahmânirrahîm. Elhamdü lillâhi rabbil\'alemin. Errahmânirrahîm. Mâliki yevmiddîn. İyyâke na\'büdü ve iyyâke neste\'în. İhdinassırâtal müstakîm. Sırâtallezîne en\'amte aleyhim ğayrilmağdûbi aleyhim veleddâllîn.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Hamd, Alemlerin Rabbi, Rahman, Rahim, din gününün maliki olan Allah\'a mahsustur. (Allah\'ım) Yalnız sana ibadet eder ve yalnız senden yardım dileriz. Bizi doğru yola ilet. Kendilerine nimet verdiklerinin yoluna; gazaba uğramışların ve sapmışların yoluna değil.',
        description: 'Namazın rüknüdür, her rekatta okunması farzdır (Şafii) veya vaciptir (Hanefi).',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Fil Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahirrahmânirrahîm. Elem tera keyfe fe\'ale rabbüke biashâbil fîl. Elem yec\'al keydehüm fî tadlîl. Ve ersele aleyhim tayran ebâbîl. Termîhim bihicâratin min siccîl. Fece\'alehüm ke\'asfin me\'kûl.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Rabbinin, fil sahiplerine ne yaptığını görmedin mi? Onların tuzaklarını boşa çıkarmadı mı? Onların üzerine sürü sürü kuşlar gönderdi. Onlara çamurdan pişirilmiş sert taşlar atıyorlardı. Nihayet onları yenilmiş ekin yaprağı gibi yaptı.',
        description: 'Namazda zamm-ı sure olarak okunan kısa surelerdendir.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Kureyş Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahirrahmânirrahîm. Li-îlâfi kureyş. Îlâfihim rihleteşşitâi vessayf. Felye\'büdû rabbe hâzel beyt. Ellezî et\'amehüm min cû\'in ve âmenehüm min havf.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Kureyş\'i ısındırıp alıştırdığı; onları kış ve yaz seyahatlerine alıştırdığı için, kendilerini açlıktan doyuran ve korkudan emin kılan bu evin (Kabe\'nin) Rabbine kulluk etsinler.',
        description: 'Kureyş kabilesine verilen nimetleri ve şükretmelerini anlatan suredir.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Maun Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahirrahmânirrahîm. Era\'eytellezî yükezzibü biddîn. Fezâlikellezî yedu\'ul yetîm. Ve lâ yehuddu alâ ta\'âmil miskîn. Feveylün lil-musallîn. Ellezînehüm an salâtihim sâhûn. Ellezînehüm yürâûn. Ve yemne\'ûnel mâ\'ûn.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Dini (hesap gününü) yalanlayanı gördün mü? İşte o, yetimi itip kakan, yoksulu doyurmaya teşvik etmeyendir. Yazıklar olsun o namaz kılanlara ki, onlar namazlarını ciddiye almazlar. Onlar gösteriş yaparlar ve en ufak bir yardımı bile engellerler.',
        description: 'Yetimlerin haklarını gözetmeyen ve gösteriş için namaz kılanları uyaran suredir.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Kevser Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahirrahmânirrahîm. İnnâ a\'taynâkel kevser. Fesalli lirabbike venhar. İnne şânieke hüvel ebter.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Şüphesiz biz sana Kevser\'i verdik. Şimdi sen de Rabbin için namaz kıl ve kurban kes. Asıl sonu kesik olan, sana buğzedendir.',
        description: 'Kur\'an-ı Kerim\'in en kısa suresidir. Zamm-ı sure olarak namazlarda okunabilir.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Kafirun Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahirrahmânirrahîm. Kul yâ eyyühel kâfirûn. Lâ a\'büdü mâ ta\'büdûn. Ve lâ entüm âbidûne mâ a\'büd. Ve lâ ene âbidün mâ abedtüm. Ve lâ entüm âbidûne mâ a\'büd. Leküm dînüküm veliye dîn.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. De ki: Ey kafirler! Ben sizin tapmakta olduğunuz şeylere tapmam. Siz de benim taptığıma tapıcı değilsiniz. Ben sizin taptıklarınıza tapacak değilim. Siz de benim taptığıma tapacak değilsiniz. Sizin dininiz size, benim dinim banadır.',
        description: 'İslam dininin tevhid ve inanç özgürlüğü duruşunu simgeleyen suredir.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'Nasr Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahirrahmânirrahîm. İzâ câe nasrullâhi velfeth. Ve raeytennâse yedhulûne fî dînillâhi efvâcâ. Fesebbih bihamdi rabbike vestağfirh. İnnehû kâne tevvâbâ.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Allah\'ın yardımı ve fetih geldiği, ve insanların Allah\'ın dinine dalga dalga girdiğini gördüğün zaman, hemen Rabbini hamd ile tenzih et ve O\'ndan mağfiret dile. Çünkü O, tevbeleri çok kabul edendir.',
        description: 'Mekke\'nin fethini ve İslam\'ın zaferini müjdeleyen suredir.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Tebbet Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahirrahmânirrahîm. Tebbet yedâ ebî lehebin ve tebb. Mâ ağnâ anhü mâlühû ve mâ keseb. Seyaslâ nâran zâte leheb. Vempreetühû hammâletel hatab. Fî cîdihâ hablün min mesed.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. Ebu Leheb\'in iki eli kurusun; kurudu da. Ne malı fayda verdi ona, ne de kazandığı. O, alevli bir ateşe girecektir. Odun taşıyıcı olarak karısı da; boynunda bükülmüş bir ip olduğu halde.',
        description: 'Peygamberimize eziyet eden Ebu Leheb ve eşinin sonunu anlatan suredir.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'İhlas Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahirrahmânirrahîm. Kul hüvellâhü ehad. Allâhüssamed. Lem yelid ve lem yûled. Ve lem yekün lehû küfüven ehad.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. De ki: O Allah tektir. Allah Samed\'dir (her şey O\'na muhtaçtır, O hiçbir şeye muhtaç değildir). O doğurmamış ve doğurulmamıştır. Hiçbir şey O\'nun dengi/benzeri değildir.',
        description: 'Tevhid inancını en özlü şekilde anlatan suredir.',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Felak Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahirrahmânirrahîm. Kul e\'ûzü birabbil felak. Min şerri mâ halak. Ve min şerri ğâsıkın izâ vekab. Ve min şerri neffâsâti fil ukad. Ve min şerri hâsidin izâ hased.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. De ki: Yarattığı şeylerin kötülüğünden, karanlığı çöktüğü zaman gecenin kötülüğünden, düğümlere üfleyen büyücülerin kötülüğünden ve kıskandığı vakit kıskancın kötülüğünden sabahın Rabbine sığınırım.',
        description: 'Kötülüklerden ve şerlerden korunmak için okunan sığınma suresidir.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'Nas Suresi',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahirrahmânirrahîm. Kul e\'ûzü birabbinnâs. Melikinnâs. İlâhinnâs. Min şerril vesvâsil hannâs. Ellezî yüvesvisü fî sudûrinnâs. Minel cinneti vennâs.',
        translation: 'Rahman ve Rahim olan Allah\'ın adıyla. De ki: İnsanların kalplerine vesvese sokan o sinsi vesvesecinin kötülüğünden, insanların Rabbine, insanların Malikine, insanların İlahına sığınırım. O vesveseci gerek cinlerden gerek insanlardandır.',
        description: 'İnsanların vesvese ve sinsi şerlerden korunmak için okuduğu son suredir.',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Ettehiyyatü',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'Ettehıyyâtü lillâhi vessalevatü vettayıbât. Esselâmü aleyke eyyühen-nebiyyü ve rahmetullâhi ve berakâtüh. Esselâmü aleynâ ve alâ ibâdillâhis-salihîn. Eşhedü en lâ ilâhe illallâh ve eşhedü enne Muhammeden abdühû ve rasûlüh.',
        translation: 'Dil ile, beden ile ve mal ile yapılan bütün ibadetler Allah\'a mahsustur. Ey Peygamber! Allah\'ın selamı, rahmeti ve bereketleri senin üzerine olsun. Selam bizim üzerimize ve Allah\'ın salih kullarının üzerine olsun. Şahitlik ederim ki Allah\'tan başka ilah yoktur. Yine şahitlik ederim ki Muhammed O\'nun kulu ve elçisidir.',
        description: 'Namaz oturuşlarında okunan ilk duadır. Miraç gecesinde Allah ile Peygamberimiz arasındaki selamlaşmadır.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahümme Salli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allâhümme salli alâ Muhammedin ve alâ âli Muhammed. Kemâ salleyte alâ İbrâhîme ve alâ âli İbrâhîm. İnneke hamîdün mecîd.',
        translation: 'Allah\'ım! İbrahim\'e ve ailesine rahmet ettiğin gibi Muhammed\'e ve ailesine de rahmet eyle. Şüphesiz sen övülmeye layıksın, şerefi yüce olansın.',
        description: 'Namazların son oturuşunda Ettehiyyatü\'den sonra okunan salavat duasıdır.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahümme Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allâhümme bârik alâ Muhammedin ve alâ âli Muhammed. Kemâ bârekte alâ İbrâhîme ve alâ âli İbrâhîm. İnneke hamîdün mecîd.',
        translation: 'Allah\'ım! İbrahim\'e ve ailesine bereket ihsan ettiğin gibi Muhammed\'e ve ailesine de bereket ihsan eyle. Şüphesiz sen övülmeye layıksın, şerefi yüce olansın.',
        description: 'Namazların son oturuşunda Salli duasından sonra okunan bereket duasıdır.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbena Duaları',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbenâ âtinâ fid-dünyâ haseneten ve fil-âhireti haseneten ve kınâ azâben-nâr. Rabbenâğfirlî ve li-vâlideyye ve lil-mü\'minîne yevme yekûmül hısâb.',
        translation: 'Rabbimiz! Bize dünyada da iyilik ver, ahirette de iyilik ver ve bizi cehennem azabından koru. Rabbimiz! Hesabın görüleceği gün beni, anne-babamı ve tüm müminleri bağışla.',
        description: 'Namazların son oturuşunda selam vermeden önce okunan dualardır.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Kunut 1 Duası',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allâhümme innâ neste‘înüke ve nesteğfirüke ve nestehdîk. Ve nü’minü bike ve netûbü ileyk. Ve netevekkelü aleyke ve nüsnî aleykel-hayra küllehû neşkürüke ve lâ nekfürük. Ve nahleu ve netrükü men yefcürük.',
        translation: 'Allah\'ım! Senden yardım dileriz, günahlarımızı bağışlamanı isteriz, bizi hidayete erdirmeyi dileriz. Sana iman ederiz, sana tevbe ederiz, sana güveniriz. Bütün hayırlarla seni överiz, sana şükreder ve nankörlük etmeyiz. Sana karşı günah işleyenleri terk eder ve onlarla bağımızı koparırız.',
        description: 'Hanefi mezhebinde vitir namazının 3. rekatında rükûdan önce okunan birinci Kunut duasıdır.',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Kunut 2 Duası',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allâhümme iyyâke na‘büdü ve leke nusallî ve nescüd, ve ileyke nes‘â ve nahfid, nercû rahmeteke ve nahşâ azâbek, inne azâbeke bil-küffâri mülhık.',
        translation: 'Allah\'ım! Biz yalnız sana kulluk ederiz. Yalnız senin için namaz kılar ve sana secde ederiz. Yalnız sana yönelir ve sana koştururuz. Rahmetini umar, azabından korkarız. Şüphesiz senin azabın kâfirlere ulaşacaktır.',
        description: 'Hanefi mezhebinde vitir namazının 3. rekatında birinci Kunut duasından hemen sonra okunan ikinci duadır.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Kunut Duası (Şafii)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allâhümmehdinî fîmen hedeyt. Ve âfinî fîmen âfeyt. Ve tevelleni fîmen tevelleyt. Ve bârik lî fîmâ a‘tayt. Ve kınî şerra mâ kadayt. Feinneke takdî ve lâ yukdâ aleyk. Ve innehû lâ yezillü men vâleyt. Ve lâ ye‘ızzü men âdeyt. Tebârakte rabbenâ ve te‘âleyt. Felekel-hamdü alâ mâ kadayt. Estağfirüke ve etûbü ileyk. Ve sallallâhu alâ seyyidinâ Muhammedin ve alâ âlihî ve sahbihî ve sellem.',
        translation: 'Allah\'ım! Hidayete erdirdiğin kimseler arasında bana da hidayet ver. Âfiyet verdiğin kimseler arasında bana da âfiyet ver. Dost edindiğin kimseler arasında beni de dost edin. Bana verdiğin nimetleri bereketli kıl. Hükmettiğin şeylerin şerrinden beni koru. Şüphesiz hükmü sen verirsin, senin aleyhine hüküm verilemez. Dost edindiğin kimse asla zelil olmaz. Düşman olduğun kimse de asla aziz olmaz. Rabbimiz! Sen yücesin ve mübareksin. Hükmettiğin her şeye hamdolsun. Senden mağfiret diler ve sana tevbe ederim. Allah’ın salât ve selâmı Efendimiz Hz. Muhammed’e, âline ve ashâbına olsun.',
        description: 'Şafii mezhebinde sabah namazının farzının 2. rekatında rükûdan doğrulunca ve Ramazan\'ın ikinci yarısında Vitir namazında okunan duadır.',
      ),
    ];
  }

  // --- ABDEST ADIMLARI ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Niyet ve Besmele',
      action: 'Niyet edilir: "Eûzü billahi mineş-şeytânirracîm Bismillâhirrahmânirrahîm. Niyet ettim Allah rızası için abdest almaya." denir.',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Elleri Yıkamak',
      action: 'Eller bileklere kadar üç defa yıkanır. Parmak aralarının iyice yıkanmasına dikkat edilir. Yüzük varsa oynatılıp altının yıkanması sağlanır.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Ağza Su Vermek',
      action: 'Sağ el ile ağza üç defa su verilerek çalkalanır. Misvak veya fırça yoksa parmaklarla dişler temizlenir.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Buruna Su Vermek',
      action: 'Sağ el ile buruna üç defa su çekilir, sol el ile burun temizlenir. (Suyu çok çekip genzi sızlatmamak gerekir).',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Yüzü Yıkamak',
      action: 'Alında saçların bittiği yerden çene altına ve kulak yumuşaklarına kadar bütün yüz üç defa yıkanır. (Şafii mezhebinde niyet tam bu esnada yüz yıkanırken kalben yapılmalıdır).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Kolları Yıkamak',
      action: 'Önce sağ kol, sonra sol kol dirseklerle beraber üç defa yıkanır. Kolda kuru yer kalmamasına özen gösterilir.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Başı Meshetmek',
      action: 'Sağ el ıslatılarak başın dörtte biri (en azından) meshedilir. (Şafiilerde başın az bir kısmını ıslatmak yeterlidir; Malikilerde başın tamamını meshetmek farzdır).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Kulakları Yıkamak',
      action: 'Eller tekrar ıslatılarak baş parmaklarla kulağın arkası, işaret parmaklarıyla içi yıkanır (meshedilir). (Kulakları yıkamak sünnettir).',
      imageKey: 'abdest_kulak',
    ));

    // Boyun meshi is NOT recommended/sünnet in Şafii (it is makruh/bid'ah according to many Shafi scholars)
    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Boynu Meshetmek',
        action: 'Eller yeni bir su ile ıslatılmaksızın, kulak meshi sonrası ellerin arkasıyla (dış yüzüyle) boyun (ense) meshedilir. (Hanefilerde müstehaptır, Şafiilerde sünnet kabul edilmez).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Ayakları Yıkamak',
      action: 'Önce sağ, sonra sol ayak topuklarla birlikte yıkanır. Parmak aralarının yıkanmasına sol elin küçük parmağıyla başlanarak dikkat edilir. (Ayakları yıkamak farzdır).',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- DİNAMİK NAMAZ ADIMLARI ÜRETİCİSİ ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 Rekat Sünnet', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 Rekat Farz', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 Rekat İlk Sünnet', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Rekat Farz', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rekat Son Sünnet', 2, false, time));
        break;
      case PrayerTime.ikindi:
        parts.add(_buildPart(mezhep, gender, '4 Rekat Gaflet Sünneti', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rekat Farz', 4, true, time));
        break;
      case PrayerTime.aksam:
        parts.add(_buildPart(mezhep, gender, '3 Rekat Farz', 3, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rekat Sünnet', 2, false, time));
        break;
      case PrayerTime.yatsi:
        parts.add(_buildPart(mezhep, gender, '4 Rekat İlk Sünnet', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rekat Farz', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rekat Son Sünnet', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          // Diğer mezheplerde Vitir genelde 1 veya 3 rekat (2+1 şeklinde kılınır)
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Rekat İlk Sünnet', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rekat Farz (Cemaatle)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Rekat Son Sünnet', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Rekat İlk Sünnet', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rekat Farz (Cemaatle)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Rekat Son Sünnet', 2, false, time));
        }
        break;
      case PrayerTime.bayram:
        parts.add(_buildBayram(mezhep, gender));
        break;
      case PrayerTime.cenaze:
        parts.add(_buildCenaze(mezhep, gender));
        break;
    }

    return Prayer(
      time: time,
      description: time.description,
      parts: parts,
    );
  }

  // Rekat bazlı adım üretici
  static PrayerPart _buildPart(
    Mezhep mezhep,
    Gender gender,
    String partName,
    int totalRakat,
    bool isFarz,
    PrayerTime time, {
    bool isIkindiYatsiSunnet = false,
  }) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    // 1. ADIM: NİYET
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niyet',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'Niyetin kalben yapılması farzdır. Dille söylenmesi ise sünnettir (Hanefilerde müstehaptır).',
    ));

    // 2. ADIM: İFTİTAH TEKBİRİ
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'İftitah Tekbiri',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allâhu Ekber',
      translation: 'Allah en büyüktür.',
      imageKey: '${gender.name}_tekbir',
      note: _getTekbirNote(mezhep, gender),
      audioPath: 'tekbir.mp3',
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '$rekat. Rekat - Kıyam & Kıraat',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      // 4. ADIM: RÜKÛ
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '$rekat. Rekat - Rükû',
        action: gender == Gender.male
            ? 'Vücut eğilerek sırt düz duruma getirilir. Parmaklar açık olarak diz kapakları kavranır. Gözler secde yerine bakar.'
            : 'Vücut hafifçe eğilir (erkekler kadar dik eğilmez). Parmaklar birleşik olarak dizlerin üzerine konur, dizler kavranmaz.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Defa)',
        transcription: 'Sübhâne Rabbiye\'l-Azîm',
        translation: 'Büyük olan Rabbimi her türlü noksanlıktan tenzih ederim.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Rükûya giderken eller tekrar omuz hizasına kadar kaldırılır (Raf\'ul Yadeyn) ve "Allahu Ekber" denir.'
            : 'Rükûya giderken eller kaldırılmadan "Allahu Ekber" denir.',
        audioPath: 'ruku.mp3',
      ));

      // 5. ADIM: RÜKÛDAN DOĞRULMA (İTİDAL)
      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '$rekat. Rekat - İtidal (Doğrulma)',
        action: 'Rükûdan tamamen doğrulunur ve ayakta dik durulur.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Semi\'allâhu limen hamideh.\nRabbenâ leke\'l-hamd.',
        translation: 'Allah kendisine hamd edeni işitti.\nRabbimiz, hamd sanadır.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: '2. Rekat - Kunut Duası (Şafii)',
          action: 'Rükûdan doğrulduktan sonra eller göğüs hizasında açılarak Kunut duası okunur (eller yüze sürülmeden secdeye varılır).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allâhümmehdinî fîmen hedeyt. Ve âfinî fîmen âfeyt. Ve tevelleni fîmen tevelleyt. Ve bârik lî fîmâ a‘tayt. Ve kınî şerra mâ kadayt. Feinneke takdî ve lâ yukdâ aleyk. Ve innehû lâ yezillü men vâleyt. Ve lâ ye‘ızzü men âdeyt. Tebârakte rabbenâ ve te‘âleyt. Felekel-hamdü alâ mâ kadayt. Estağfirüke ve etûbü ileyk. Ve sallallâhu alâ seyyidinâ Muhammedin ve alâ âlihî ve sahbihî ve sellem.',
          translation: 'Allah\'ım! Hidayete erdirdiğin kimseler arasında bana da hidayet ver. Âfiyet verdiğin kimseler arasında bana da âfiyet ver. Dost edindiğin kimseler arasında beni de dost edin. Bana verdiğin nimetleri bereketli kıl. Hükmettiğin şeylerin şerrinden beni koru. Şüphesiz hükmü sen verirsin, senin aleyhine hüküm verilemez. Dost edindiğin kimse asla zelil olmaz. Düşman olduğun kimse de asla aziz olmaz. Rabbimiz! Sen yücesin ve mübareksin. Hükmettiğin her şeye hamdolsun. Senden mağfiret diler ve sana tevbe ederim. Allah’ın salât ve selâmı Efendimiz Hz. Muhammed’e, âline ve ashâbına olsun.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'Şafii mezhebinde sabah namazının farzının 2. rekatında rükûdan doğrulunca Kunut okumak müekked sünnettir (eb\'ad sünnet).',
        ));
      }

      // 6. ADIM: SECDE 1
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '$rekat. Rekat - 1. Secde',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Defa)',
        transcription: 'Sübhâne Rabbiye\'l-A\'lâ',
        translation: 'Yüce olan Rabbimi her türlü noksanlıktan tenzih ederim.',
        imageKey: '${gender.name}_secde',
        note: 'Secdeye giderken sırasıyla dizler, sonra eller, sonra alın ve burun yere konur.',
        audioPath: 'secde.mp3',
      ));

      // 7. ADIM: SECDE ARASI OTURUŞ (CELSE)
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '$rekat. Rekat - Celse',
        action: gender == Gender.male
            ? 'Sol ayak yatırılarak üzerine oturulur, sağ ayak dik tutulur ve parmaklar kıbleye çevrilir. Eller uyluklar üzerine konur.'
            : 'Ayaklar sağa doğru yatırılarak sol kalça üzerine oturulur (Teverrük). Eller uyluklar üzerine konur.',
        imageKey: '${gender.name}_celse',
        note: 'Secdeler arasında bir miktar durmak (tuma\'nine) farzdır (Şafii/Maliki/Hanbeli) veya vaciptir (Hanefi).',
      ));

      // 8. ADIM: SECDE 2
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '$rekat. Rekat - 2. Secde',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Defa)',
        transcription: 'Sübhâne Rabbiye\'l-A\'lâ',
        translation: 'Yüce olan Rabbimi her türlü noksanlıktan tenzih ederim.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      // OTURUŞ KARARLARI (2. rekatta ilk oturuş, son rekatta son oturuş)
      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        // SON OTURUŞ
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Son Oturuş (Ka\'de-i Ahîre)',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Ettehiyyâtü, Salli, Barik ve Rabbena Duaları okunur.',
          transcription: 'Teşehhüd duaları sırasıyla okunur.',
          translation: 'Dualar sekmesinden tam metinlerine erişebilirsiniz.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        // SELAM
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Selam (Sağa)',
          action: 'Sağa "Es-selâmü aleyküm ve rahmetullâh" diyerek baş çevrilip selam verilir.',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'Es-selâmü aleyküm ve rahmetullâh.',
          translation: 'Allah\'ın selamı ve rahmeti üzerinize olsun.',
          imageKey: '${gender.name}_selam',
          note: 'Selam verirken omuz başlarına bakılır. Şafiilerde sağa selam vermek farzdır.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Selam (Sola)',
          action: 'Sola "Es-selâmü aleyküm ve rahmetullâh" diyerek baş çevrilip selam verilir.',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'Es-selâmü aleyküm ve rahmetullâh.',
          translation: 'Allah\'ın selamı ve rahmeti üzerinize olsun.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Sola selam verilerek namaz tamamlanır.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        // İLK OTURUŞ (2. rekat sonu)
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'İlk Oturuş (Ka\'de-i Ûlâ)',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Ettehiyyâtü okunur.',
          transcription: 'Ettehiyyâtü lillâhi...',
          translation: 'Sadece Ettehiyyâtü duası okunur.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, false),
        ));
      }
    }

    return PrayerPart(
      name: partName,
      rakatCount: totalRakat,
      steps: steps,
    );
  }

  // Hanefi Mezhebi Vitir Namazı (3 Rekat) Özel Yapılandırması
  static PrayerPart _buildVitirHanafi(Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    // Niyet
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niyet',
      action: 'Niyet ettim Allah rızası için bugünkü yatsı namazının 3 rekatlık Vitir namazını kılmaya.',
      imageKey: '${gender.name}_niyet',
    ));

    // Tekbir
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'İftitah Tekbiri',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allâhu Ekber',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    // 1. Rekat Kıyam & Kıraat
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Rekat - Kıyam & Kıraat',
      action: 'Sübhaneke okunur. Euzü Besmele, Fatiha ve zamm-ı sure okunur.',
      imageKey: '${gender.name}_kiyam',
    ));

    // 1. Rekat Rükû, Secdeler vb. (standart)
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 4; // Ruku, Itidal, Secde1, Celse, Secde2 = 5 steps added

    // 2. Rekat Kıyam
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2. Rekat - Kıyam & Kıraat',
      action: 'Besmele çekilir, Fatiha ve zamm-ı sure okunur.',
      imageKey: '${gender.name}_kiyam',
    ));

    // 2. Rekat Hareketleri
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 4;

    // 2. Rekat İlk Oturuş
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2. Rekat - İlk Oturuş',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Ettehiyyâtü okunur ve ayağa kalkılır.',
      imageKey: '${gender.name}_oturus',
    ));

    // 3. Rekat Kıyam
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Kıyam & Kıraat (Kunut Öncesi)',
      action: 'Ayakta eller bağlanır. Besmele çekilir, Fatiha ve bir Sure okunur. Sure bitince eller çözülür.',
      imageKey: '${gender.name}_kiyam',
    ));

    // 3. Rekat Vitir Tekbiri (Kunut Tekbiri)
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Kunut Tekbiri',
      action: gender == Gender.male
          ? 'Eller kulak memelerine kadar kaldırılıp "Allahu Ekber" denir ve tekrar göbek altında bağlanır.'
          : 'Eller göğüs hizasına kadar kaldırılıp "Allahu Ekber" denir ve tekrar göğüs üzerinde bağlanır.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allâhu Ekber',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Hanefilere özgü bir uygulamadır. Kunut duasından önce bu tekbir alınır.',
    ));

    // Kunut 1 Duası
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Kunut 1 Duası',
      action: 'Kollar bağlanmış halde Kunut 1 duası okunur.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allâhümme innâ neste‘înüke ve nesteğfirüke ve nestehdîk. Ve nü’minü bike ve netûbü ileyk. Ve netevekkelü aleyke ve nüsnî aleykel-hayra küllehû neşkürüke ve lâ nekfürük. Ve nahleu ve netrükü men yefcürük.',
      translation: 'Allah\'ım! Senden yardım dileriz, günahlarımızı bağışlamanı isteriz, bizi hidayete erdirmeyi dileriz. Sana iman ederiz, sana tevbe ederiz, sana güveniriz. Bütün hayırlarla seni överiz, sana şükreder ve nankörlük etmeyiz. Sana karşı günah işleyenleri terk eder ve onlarla bağımızı koparırız.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Kunut 2 Duası
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Kunut 2 Duası',
      action: 'Kunut 1 duasının hemen ardından eller bağlı olarak Kunut 2 duası okunur.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allâhümme iyyâke na‘büdü ve leke nusallî ve nescüd, ve ileyke nes‘â ve nahfid, nercû rahmeteke ve nahşâ azâbek, inne azâbeke bil-küffâri mülhık.',
      translation: 'Allah\'ım! Biz yalnız sana kulluk ederiz. Yalnız senin için namaz kılar ve sana secde ederiz. Yalnız sana yönelir ve sana koştururuz. Rahmetini umar, azabından korkarız. Şüphesiz senin azabın kâfirlere ulaşacaktır.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    // Rükû, Secdeler ve Son Oturuş
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Rükû',
      action: 'Rükûya gidilir.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Defa)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - İtidal',
      action: 'Rükûdan doğrulunur.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - 1. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Celse',
      action: 'Secde arasında oturulur.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - 2. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    // Son oturuş
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Son Oturuş (Ka\'de-i Ahîre)',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Ettehiyyâtü, Salli, Barik ve Rabbena Duaları okunur.',
      imageKey: '${gender.name}_oturus',
    ));

    // Selam
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sağa)',
      action: 'Sağa selam verilerek namazın tamamlanma adımına geçilir.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sola)',
      action: 'Sola selam verilerek namaz tamamlanır.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: '3 Rekat Vitir Vacip',
      rakatCount: 3,
      steps: steps,
    );
  }

  // Diğer mezheplerde Vitir (Genelde Şafii / Maliki / Hanbeli 2+1 şeklinde kılınır, biz 3 rekat tek selamla kılınışını temsil edelim)
  static PrayerPart _buildVitirOther(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niyet',
      action: 'Niyet ettim Allah rızası için bugünkü Vitir namazını kılmaya.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'İftitah Tekbiri',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    // 1. Rekat
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Rekat - Kıyam & Kıraat',
      action: 'İftitah duası okunur. Besmele çekilerek Fatiha ve zamm-ı sure (A\'la suresi tavsiye edilir) okunur.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    // 2. Rekat
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2. Rekat - Kıyam & Kıraat',
      action: 'Besmele çekilerek Fatiha ve Kafirun suresi okunur.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    // 2. Rekat - İlk Oturuş (Şafii/Hanbeli\'de Vitir 2 rekat kılınıp selam verilir, sonra 1 rekat kılınır)
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2. Rekat - Oturuş ve Selam',
      action: 'Oturulur, Ettehiyyatü, Salli, Barik okunur ve selam verilir. Ardından 1 rekatlık tek namaz için tekrar ayağa kalkılır.',
      imageKey: '${gender.name}_selam',
      note: 'Şafii, Maliki ve Hanbelilerde en faziletli kılınış şekli vitri iki rekat kılıp selam verdikten sonra, bir rekat daha kılmaktır.',
    ));

    // 3. Rekat (Ayrı Tek Rekat)
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat (Tek Rekat) - Niyet ve Tekbir',
      action: 'Niyet edilir: "Vitir namazının son rekatını kılmaya". İftitah tekbiri alınır.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Kıyam & Kıraat',
      action: 'Fatiha ve İhlas suresi okunur.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Rükû',
      action: 'Rükûya gidilir.',
      imageKey: '${gender.name}_ruku',
    ));

    // Ramazan'ın ikinci yarısında Şafiiler rükûdan sonra Kunut okurlar.
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - İtidal (Kunut)',
      action: mezhep == Mezhep.shafii
          ? 'Ramazan ayının ikinci yarısında rükûdan doğrulunca eller açılarak Kunut duası okunur.'
          : 'Rükûdan doğrulunur.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allâhümmehdinî fîmen hedeyt. Ve âfinî fîmen âfeyt. Ve tevelleni fîmen tevelleyt. Ve bârik lî fîmâ a‘tayt. Ve kınî şerra mâ kadayt. Feinneke takdî ve lâ yukdâ aleyk. Ve innehû lâ yezillü men vâleyt. Ve lâ ye‘ızzü men âdeyt. Tebârakte rabbenâ ve te‘âleyt. Felekel-hamdü alâ mâ kadayt. Estağfirüke ve etûbü ileyk. Ve sallallâhu alâ seyyidinâ Muhammedin ve alâ âlihî ve sahbihî ve sellem.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'Allah\'ım! Hidayete erdirdiğin kimseler arasında bana da hidayet ver. Âfiyet verdiğin kimseler arasında bana da âfiyet ver. Dost edindiğin kimseler arasında beni de dost edin. Bana verdiğin nimetleri bereketli kıl. Hükmettiğin şeylerin şerrinden beni koru. Şüphesiz hükmü sen verirsin, senin aleyhine hüküm verilemez. Dost edindiğin kimse asla zelil olmaz. Düşman olduğun kimse de asla aziz olmaz. Rabbimiz! Sen yücesin ve mübareksin. Hükmettiğin her şeye hamdolsun. Senden mağfiret diler ve sana tevbe ederim. Allah’ın salât ve selâmı Efendimiz Hz. Muhammed’e, âline ve ashâbına olsun.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'Ramazan ayının ikinci yarısında rükûdan doğrulunca eller açılarak Kunut duası okunur, secdeye gidilir.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - 1. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - Celse',
      action: 'Oturulur.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Rekat - 2. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Son Oturuş (Ka\'de-i Ahîre)',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Ettehiyyâtü, Salli, Barik ve Rabbena Duaları okunur.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sağa)',
      action: 'Sağa "Es-selâmü aleyküm ve rahmetullâh" diyerek baş çevrilip selam verilir.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'Es-selâmü aleyküm ve rahmetullâh.',
      translation: 'Allah\'ın selamı ve rahmeti üzerinize olsun.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sola)',
      action: 'Sola "Es-selâmü aleyküm ve rahmetullâh" diyerek baş çevrilip selam verilir.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'Es-selâmü aleyküm ve rahmetullâh.',
      translation: 'Allah\'ın selamı ve rahmeti üzerinize olsun.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Vitir (2+1 Rekat)',
      rakatCount: 3,
      steps: steps,
    );
  }

  // Bayram Namazı (2 Rekat) Yapılandırması
  static PrayerPart _buildBayram(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    // Niyet
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niyet',
      action: 'Niyet ettim Allah rızası için bugünkü Bayram namazını kılmaya, uydum hazır olan imama.',
      imageKey: '${gender.name}_niyet',
      note: 'Ramazan ve Kurban Bayramı namazlarının kılınışı tamamen aynıdır. Sadece niyet ederken kılınan bayram (Ramazan/Kurban) belirtilir.',
    ));

    // Tekbir
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'İftitah Tekbiri',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allâhu Ekber',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    // 1. Rekat Kıyam & Sübhaneke/Veccehtu
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Rekat - Başlangıç Duası',
      action: mezhep == Mezhep.shafii
          ? 'Veccehtu (Yöneliş) duası okunur.'
          : 'Sübhaneke duası okunur.',
      imageKey: '${gender.name}_kiyam',
    ));

    // 1. Rekat Zevaid Tekbirleri
    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '1. Rekat - Zevaid Tekbirleri (7 Defa)',
        action: 'Peş peşe 7 defa eller omuz hizasına kaldırılarak tekbir alınır. Her tekbirden sonra eller bağlanır. Tekbir aralarında "Sübhânallâhi vel-hamdülillâhi velâ ilâhe illallâhu vallâhu ekber" tesbihi okunur.',
        arabicText: 'اللهُ أَكْبَرُ (7 Defa)',
        transcription: 'Allâhu Ekber',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Şafiî mezhebinde bayram namazının ilk rekatında kıraatten önce 7 zevaid tekbiri alınması sünnettir.',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '1. Rekat - Zevaid Tekbirleri (3 Defa)',
        action: 'Peş peşe 3 defa eller kulak hizasına kaldırılarak tekbir alınır. Birinci ve ikinci tekbirde eller yanlara salınır, üçüncü tekbirde eller bağlanır.',
        arabicText: 'اللهُ أَكْبَرُ (3 Defa)',
        transcription: 'Allâhu Ekber',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Hanefî mezhebinde bayram namazının ilk rekatında kıraatten önce 3 zevaid tekbiri alınması vaciptir.',
      ));
    }

    // 1. Rekat Fatiha ve Sure
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Rekat - Kıyam & Kıraat',
      action: 'Besmele çekilerek Fatiha ve zamm-ı sure (A\'la suresi tavsiye edilir) okunur. (Cemaatle kılındığından imam sesli okur, cemaat dinler/Şafiîde cemaat içinden Fatiha\'yı okur).',
      imageKey: '${gender.name}_kiyam',
    ));

    // 1. Rekat Hareketleri
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    // 2. Rekat Kıyam & Kıraat (Hanafi ve Şafii sırası farklı)
    if (mezhep == Mezhep.shafii) {
      // Şafii: 5 Tekbir -> Fatiha + Sure
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - Zevaid Tekbirleri (5 Defa)',
        action: 'Kıyam duruşuna geçilince, kıraatten önce peş peşe 5 defa eller kaldırılılarak tekbir alınır. Her tekbirden sonra eller bağlanır ve aralarda tesbih okunur.',
        arabicText: 'اللهُ أَكْبَرُ (5 Defa)',
        transcription: 'Allâhu Ekber',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Şafiî mezhebinde ikinci rekatın kıraatinden önce 5 zevaid tekbiri alınır.',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - Kıyam & Kıraat',
        action: 'Besmele çekilerek Fatiha ve zamm-ı sure (Gâşiye suresi tavsiye edilir) okunur.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      // Hanefi: Fatiha + Sure -> 3 Tekbir -> Rükû
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - Kıyam & Kıraat',
        action: 'Besmele çekilerek Fatiha ve zamm-ı sure (Gâşiye suresi tavsiye edilir) okunur.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - Zevaid Tekbirleri (3 Defa)',
        action: 'Kıraat bittikten sonra rükûya gitmeden önce üç defa eller kulak hizasına kaldırılarak tekbir alınır ve her birinde eller yanlara salınır (bağlanmaz).',
        arabicText: 'اللهُ أَكْبَرُ (3 Defa)',
        transcription: 'Allâhu Ekber',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Hanefî mezhebinde ikinci rekatta ilave tekbirler rükûya gitmeden hemen önce alınır.',
      ));

      // 2. Rekat Rükû (Dördüncü tekbir ile direkt rükûya gidilir)
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - Rükûya Geçiş',
        action: 'Dördüncü tekbir alınarak eller kaldırılmadan direkt rükûya gidilir.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      // Secdeler vb. (Standartın geri kalan adımları rüku hariç)
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - İtidal',
        action: 'Rükûdan doğrulunur.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - 1. Secde',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - Celse',
        action: 'Secde arasında oturulur.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: '2. Rekat - 2. Secde',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    // Son Oturuş
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Son Oturuş',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Ettehiyyâtü, Salli, Barik ve Rabbena Duaları okunur.',
      imageKey: '${gender.name}_oturus',
    ));

    // Selamlar
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sağa)',
      action: 'Sağa selam verilir.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sola)',
      action: 'Sola selam verilir.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Bayram Namazı',
      rakatCount: 2,
      steps: steps,
    );
  }

  // Cenaze Namazı (4 Tekbir) Yapılandırması
  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    // Niyet
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niyet',
      action: 'Niyet ettim Allah rızası için namaza, Resûlullah için salavata, meyyit (cenaze) için duaya, uydum hazır olan imama.',
      imageKey: '${gender.name}_niyet',
      note: 'Cenaze namazı tamamen ayakta kılınır. Secde ve rükûsu yoktur. Farz-ı kifayedir.',
    ));

    // 1. Tekbir
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Tekbir (İftitah) & Başlangıç',
      action: gender == Gender.male
          ? 'Eller kulak hizasına kaldırılarak "Allahu Ekber" denir ve göbek altında bağlanır.'
          : 'Eller göğüs hizasına kaldırılarak "Allahu Ekber" denir ve göğüs üzerinde bağlanır.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allâhu Ekber',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    // 1. Tekbir Okuması
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Tekbir Okuması',
      action: mezhep == Mezhep.shafii
          ? 'Eûzü Besmele çekilerek sessizce Fatiha Suresi okunur.'
          : 'Sübhaneke duası "ve celle senâük" ibaresiyle birlikte okunur.',
      arabicText: mezhep == Mezhep.shafii ? 'Fatiha Suresi' : 'Sübhaneke (ve celle senâük ile)',
      imageKey: '${gender.name}_kiyam',
      note: 'Hanefilerde cenaze namazında Fatiha dua niyetiyle okunabilir ancak Sübhaneke okunması esastır. Şafiîlerde ise Fatiha farzdır.',
    ));

    // 2. Tekbir
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2. Tekbir & Salavatlar',
      action: mezhep == Mezhep.shafii
          ? 'Eller omuz hizasına kaldırılarak ikinci tekbir alınır ve tekrar bağlanır. Salli ve Barik duaları okunur.'
          : 'Eller kaldırılmadan sadece "Allahu Ekber" denilerek ikinci tekbir alınır. Salli ve Barik duaları okunur.',
      arabicText: 'Allâhumme Salli & Allâhumme Bârik',
      imageKey: '${gender.name}_kiyam',
      note: 'Şafiî mezhebinde cenaze namazının her tekbirinde elleri kaldırmak sünnettir. Hanefîlerde ise sadece ilk tekbirde eller kaldırılır.',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    // 3. Tekbir
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Tekbir & Cenaze Duası',
      action: mezhep == Mezhep.shafii
          ? 'Eller omuz hizasına kaldırılarak üçüncü tekbir alınır. Cenaze duası (veya bilmeyenler için Rabbena duaları) okunur.'
          : 'Eller kaldırılmadan üçüncü tekbir alınır. Cenaze duası (veya bilmeyenler için Rabbena duaları) okunur.',
      arabicText: 'Cenaze Duası / Rabbena Duaları',
      imageKey: '${gender.name}_kiyam',
      note: 'Ölen kimse için samimiyetle dua edilir.',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    // 4. Tekbir
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '4. Tekbir',
      action: mezhep == Mezhep.shafii
          ? 'Eller omuz hizasına kaldırılarak dördüncü tekbir alınır. Kısa bir süre ayakta beklendikten sonra eller yanlara salınır.'
          : 'Eller kaldırılmadan dördüncü tekbir alınır ve eller yanlara salınır (Cenaze namazında dördüncü tekbirden sonra eller salınır).',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allâhu Ekber',
      translation: 'Allah en büyüktür.',
      imageKey: '${gender.name}_kiyam',
      note: 'Dördüncü tekbirden sonra dua okunmaz, doğrudan selama geçilir.',
    ));

    // Selam (Sağa)
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sağa)',
      action: 'Ayakta duruş bozulmadan baş sağa çevrilerek selam verilir.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'Es-selâmü aleyküm ve rahmetullâh.',
      translation: 'Allah\'ın selamı ve rahmeti üzerinize olsun.',
      imageKey: '${gender.name}_cenaze_selam',
      note: 'Selam verirken cemaate ve cenazeye selam vermeye niyet edilir.',
    ));

    // Selam (Sola)
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Selam (Sola)',
      action: 'Baş sola çevrilerek selam verilir.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'Es-selâmü aleyküm ve rahmetullâh.',
      translation: 'Allah\'ın selamı ve rahmeti üzerinize olsun.',
      imageKey: '${gender.name}_cenaze_selam_sol',
      note: 'Cenaze namazı selam verilerek tamamlanmış olur.',
    ));

    return PrayerPart(
      name: 'Cenaze Namazı',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: '$rekat. Rekat - Rükû',
      action: 'Rükûya gidilir.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: '$rekat. Rekat - İtidal',
      action: 'Rükûdan doğrulunur.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: '$rekat. Rekat - 1. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: '$rekat. Rekat - Celse',
      action: 'Secde arasında oturulur.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: '$rekat. Rekat - 2. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- YARDIMCI METİNLER (TEXT BUILDERS) ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    String mezhepName = mezhep.displayName;
    String target = '${time.displayName} namazının $partName';
    return 'Niyet edilir: "Niyet ettim Allah rızası için bugün kılacağım $target\'nı kılmaya." (Kalben niyet esastır, $mezhepName mezhebine göre dil ile söylemek de sünnettir/müstehaptır).';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Eller başparmak kulak yumuşağına değecek şekilde kaldırılır. Avuç içleri kıbleye dönüktür. "Allahu Ekber" denilerek eller göbek altına bağlanır.';
      } else {
        // Şafii ve Maliki
        return 'Eller omuz (veya kulak) hizasına kadar kaldırılır. Parmaklar hafif açık, avuç içleri kıbleye bakar. "Allahu Ekber" denilerek eller göğüs altında bağlanır veya (Maliki ise) yanlara salınır.';
      }
    } else {
      // Kadın
      if (mezhep == Mezhep.hanafi) {
        return 'Eller parmaklar açık ve yukarıya doğru bakarak göğüs hizasına kadar kaldırılır. "Allahu Ekber" denilerek sağ el sol elin üzerinde olacak şekilde göğüs üstünde bağlanır.';
      } else {
        return 'Eller omuz hizasına kaldırılır, "Allahu Ekber" denilerek göğüs hizasında bağlanır.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'Şafii mezhebinde iftitah tekbiri alırken elleri omuz hizasına kaldırmak sünnettir. Avuç içleri kıbleye, parmaklar kıbleye bakmalıdır.';
    } else if (mezhep == Mezhep.maliki) {
      return 'Maliki mezhebinde eller omuz hizasına kaldırılır. Tercih edilen görüşte farz namazlarda eller bağlanmaz, yana salınır (Sadl).';
    }
    return 'Erkekler ellerini kulak memesine değdirir, kadınlar ise göğüs hizasına kaldırır.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';

    // El bağlama
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Ayakta dik durulur. Sağ el sol elin bileğini kavrayacak (baş ve küçük parmaklarla halka yaparak) şekilde göbek altında bağlanır. Gözler secde yerine bakar.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Ayakta dik durulur. Sağ el sol elin bileğini tutacak şekilde göğüs altında, göbek üstünde (kalbin hizasında) bağlanır.';
      } else if (mezhep == Mezhep.maliki) {
        structure = 'Ayakta dik durulur. Eller yanlara serbest bırakılır (Sadl) veya dileyen göğüs altında bağlar.';
      }
    } else {
      // Kadın
      structure = 'Ayakta dik durulur. Sağ el sol elin üzerine konur, halka yapılmaksızın göğüs üzerinde bağlanır. Gözler secde yerine bakar.';
    }

    // Okunacaklar tarifi
    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nÖnce "Veccehtu" (İftitah duası) okunur. Sonra Euzü çekilerek besmele ile Fatiha ve ardından zamm-ı sure okunur.';
      } else if (mezhep == Mezhep.maliki) {
        return '$structure\nSübhaneke ve Euzü-Besmele okunmaksızın doğrudan Fatiha suresi okunur (farzlarda). Fatiha bitince bir Sure (zamm-ı sure) okunur.';
      } else {
        // Hanefi ve Hanbeli
        return '$structure\nÖnce Sübhaneke okunur. Euzü-Besmele çekilerek Fatiha suresi okunur. Fatiha bitince (sessizce "Amin" denir) bir Sure (zamm-ı sure) okunur.';
      }
    } else if (rekat == 2) {
      if (mezhep == Mezhep.maliki) {
        return '$structure\nDoğrudan Fatiha suresi ve ardından bir zamm-ı sure okunur.';
      }
      return '$structure\nBesmele çekilerek Fatiha suresi ve ardından bir zamm-ı sure okunur.';
    } else {
      // 3. ve 4. rekatlar
      if (isFarz) {
        if (mezhep == Mezhep.maliki) {
          return '$structure\nSadece Fatiha suresi okunur. Zamm-ı sure okunmaz.';
        }
        return '$structure\nSadece Besmele ve Fatiha suresi okunur. Zamm-ı sure okunmaz.';
      } else {
        // Sünnetler
        if (isIkindiYatsi && rekat == 3) {
          // İkindi ve Yatsı ilk sünnetinde 3. rekata kalkınca Sübhaneke okunur. (Hanefi ve Hanbeli)
          if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
            return '$structure\n3. rekata kalkınca önce Sübhaneke okunur. Euzü-Besmele çekilerek Fatiha ve zamm-ı sure okunur.';
          } else {
            return '$structure\n3. rekata kalkınca Besmele çekilerek Fatiha ve zamm-ı sure okunur.';
          }
        }
        if (mezhep == Mezhep.maliki) {
          return '$structure\nFatiha suresi ve zamm-ı sure okunur.';
        }
        return '$structure\nBesmele çekilerek Fatiha suresi ve zamm-ı sure okunur.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      if (partName.contains('Sünnet')) {
        index = (rekat == 1) ? 4 : 7; // Kafirun, İhlas
      } else {
        index = (rekat == 1) ? 0 : 1; // Fil, Kureyş
      }
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('İlk Sünnet')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3; // Fil, Kureyş, Maun, Kevser
      } else if (partName.contains('Farz')) {
        index = (rekat == 1) ? 4 : 5; // Kafirun, Nasr
      } else {
        index = (rekat == 1) ? 6 : 7; // Tebbet, İhlas
      }
    } else if (time == PrayerTime.ikindi) {
      if (partName.contains('Sünnet')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3; // Fil, Kureyş, Maun, Kevser
      } else {
        index = (rekat == 1) ? 4 : 5; // Kafirun, Nasr
      }
    } else if (time == PrayerTime.aksam) {
      if (partName.contains('Farz')) {
        index = (rekat == 1) ? 6 : 7; // Tebbet, İhlas
      } else {
        index = (rekat == 1) ? 8 : 9; // Felak, Nas
      }
    } else if (time == PrayerTime.yatsi) {
      if (partName.contains('İlk Sünnet')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3; // Fil, Kureyş, Maun, Kevser
      } else if (partName.contains('Farz')) {
        index = (rekat == 1) ? 4 : 5; // Kafirun, Nasr
      } else if (partName.contains('Son Sünnet')) {
        index = (rekat == 1) ? 6 : 7; // Tebbet, İhlas
      } else {
        // Vitir
        index = (rekat == 1) ? 8 : (rekat == 2) ? 9 : 7; // Felak, Nas, İhlas
      }
    } else if (time == PrayerTime.cuma) {
      if (partName.contains('İlk Sünnet') || partName.contains('Sünnet')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3;
      } else if (partName.contains('Farz')) {
        index = (rekat == 1) ? 4 : 5;
      } else {
        index = (rekat == 1) ? 6 : 7;
      }
    } else if (time == PrayerTime.bayram) {
      index = (rekat == 1) ? 0 : 1;
    }
    return _zammISureler[index % _zammISureler.length];
  }

  static Map<String, String> _getKiyamRecitation(
    Mezhep mezhep,
    PrayerTime time,
    String partName,
    int rekat,
    bool isFarz,
    bool isIkindiYatsi,
  ) {
    StringBuffer arabic = StringBuffer();
    StringBuffer transcription = StringBuffer();
    StringBuffer translation = StringBuffer();

    // 1. İftitah Duası (1. Rekatta veya İkindi/Yatsı sünnetlerinde 3. rekatta)
    bool readIftitah = ((rekat == 1) || (isIkindiYatsi && rekat == 3)) && mezhep != Mezhep.maliki;
    if (readIftitah) {
      if (mezhep == Mezhep.shafii && rekat == 1) {
        arabic.writeln('[ŞAFİİ İFTİTAH DUASI (VECCEHTÜ)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Şafiî İftitah Duası (Veccehtü)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.');
        translation.writeln('[Şafiî İftitah Duası Meali]');
        translation.writeln('Şüphesiz ben, yüzümü gökleri ve yeri yaratana, doğruya yönelerek çevirdim. Ben ortak koşanlardan değilim. Şüphesiz benim namazım da, ibadetlerim de, yaşamım ve ölümüm de âlemlerin Rabbi olan Allah içindir. O\'nun hiçbir ortağı yoktur. Ben bununla emrolundum ve ben müslümanlardanım.');
      } else {
        arabic.writeln('[SÜBHANEKE DUASI]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Sübhaneke Duası]');
        transcription.writeln('Sübhanekellahümme ve bihamdik. Ve tebârekesmük. Ve teâlâ ceddük. Ve lâ ilâhe ğayrûk.');
        translation.writeln('[Sübhaneke Meali]');
        translation.writeln('Allah\'ım! Sen noksan sıfatlardan pak ve uzaksın. Seni daima böyle tenzih eder ve överim. Senin adın mübarektir. Varlığın her şeyden üstündür. Senden başka ilah yoktur.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    // 2. Fatihayı ekle
    arabic.writeln('[FATİHA SURESİ]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْمِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[Fatiha Suresi]');
    transcription.writeln('Bismillahirrahmânirrahîm. Elhamdü lillâhi rabbil\'alemin. Errahmânirrahîm. Mâliki yevmiddîn. İyyâke na\'büdü ve iyyâke neste\'în. İhdinassırâtal müstakîm. Sırâtallezîne en\'amte aleyhim ğayrilmağdûbi aleyhim veleddâllîn.');
    translation.writeln('[Fatiha Meali]');
    translation.writeln('Rahman ve Rahim olan Allah\'ın adıyla. Hamd, Alemlerin Rabbi, Rahman, Rahim, din gününün maliki olan Allah\'a mahsustur. Yalnız sana ibadet eder ve yalnız senden yardım dileriz. Bizi doğru yola ilet. Kendilerine nimet verdiklerinin yoluna; gazaba uğramışların ve sapmışların yoluna değil.');

    // 3. Zammı Sureyi ekle (Farzların 3 ve 4. rekatları hariç)
    bool readZammISure = true;
    if (isFarz && rekat > 2) {
      readZammISure = false;
    }

    if (readZammISure) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[ZAMM-I SURE (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Zamm-ı Sure (${zamm.name})]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[${zamm.name} Meali]');
      translation.writeln(zamm.translation);
    }

    return {
      'arabic': arabic.toString(),
      'transcription': transcription.toString(),
      'translation': translation.toString(),
    };
  }

  static String _getKiyamNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.maliki && gender == Gender.male) {
      return 'Maliki mezhebinde farz namazlarında elleri bağlamayıp yanlara salmak (Sadl) müstehaptır. Ancak dileyen bağlayabilir de.';
    } else if (mezhep == Mezhep.shafii) {
      return 'Şafii mezhebinde ilk rekatta Sübhaneke yerine Veccehtu duası okunur. Cehri (sesli) namazlarda Besmele sesli çekilir.';
    }
    return 'Kıyamda ayakta iken secde yerine bakılması huşu açısından tavsiye edilmiştir.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Doğrulurken eller tekrar omuz hizasına kadar kaldırılır (Raf\'ul Yadeyn).';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' Şafii mezhebinde sabah namazının farzının 2. rekatında itidal halindeyken Kunut duası okumak sünnettir, eller açılıp dua edilir.';
    }
    return note.isNotEmpty ? note : 'Doğrulunca vücudun tamamen sakinleşmesi (itidal) beklenir.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Secdeye varılır. Alın ve burun yere temas eder. Ayaklar dik tutulur, parmak uçları kıbleye bakar. Dirsekler yanlardan uzak ve yerden kalkık, karın uyluklardan uzak tutulur.';
    } else {
      return 'Secdeye varılır. Alın ve burun yere temas eder. Hanımlarda dirsekler yanlara yapışık ve yere temas eder, karın uyluklara yaklaştırılır (sıkışık vaziyette secde yapılır).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'Son oturuşta sol ayak sağ ayağın altından sağ tarafa çıkarılır ve kalça üzerine oturulur (Teverrük oturuşu). Eller dizlerin üzerine konur.';
      }
      return 'Sol ayak yere yatırılıp üzerine oturulur, sağ ayak ise parmakları kıbleye bakacak şekilde dik tutulur (İftiriş oturuşu). Eller dizlerin üzerine konur.';
    } else {
      // Kadın
      return 'Her iki oturuşta da ayaklar sağ tarafa yatırılarak sol kalça üzerine oturulur (Teverrük oturuşu). Eller parmaklar kapalı olarak dizlerin üzerine konur.';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'Son oturuşta sırasıyla Ettehiyyâtü, Salli-Barik ve Rabbena duaları okunur. Şafii, Maliki ve Hanbelilerde bu oturuşta Teverrük şekli sünnettir.';
    }
    return 'İlk oturuşta sadece Ettehiyyâtü duası okunur (Hanafi/Şafii). Hanefilerde teşehhüd esnasında kelime-i şehadet getirirken parmak kaldırmak müstehaptır.';
  }

  static List<DuaSurah> getKiyamRecitationsList(
    Mezhep mezhep,
    PrayerTime time,
    String partName,
    int rekat,
    bool isFarz,
    bool isIkindiYatsi,
  ) {
    List<DuaSurah> list = [];
    final all = getDuaSurahs();

    // 1. İftitah duası
    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        list.add(DuaSurah(
          audioFileName: 'veccehtu.mp3',
          name: 'Veccehtü Duası',
          arabic: 'وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ. إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ. لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ.',
          transcription: 'Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.',
          translation: 'Şüphesiz ben, yüzümü gökleri ve yeri yaratana, doğruya yönelerek çevirdim. Ben ortak koşanlardan değilim. Şüphesiz benim namazım da, ibadetlerim de, yaşamım ve ölümüm de âlemlerin Rabbi olan Allah içindir. O\'nun hiçbir ortağı yoktur. Ben bununla emrolundum ve ben müslümanlardanım.',
          description: 'Şafii mezhebinde namaza başlarken iftitah tekbirinden sonra okunan iftitah (teveccüh) duasıdır.',
        ));
      } else if (mezhep != Mezhep.maliki) {
        list.add(all.firstWhere((element) => element.audioFileName == 'subhaneke.mp3'));
      }
    } else if (isIkindiYatsi && rekat == 3) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        list.add(all.firstWhere((element) => element.audioFileName == 'subhaneke.mp3'));
      }
    }

    // 2. Fatiha
    list.add(all.firstWhere((element) => element.audioFileName == 'fatiha.mp3'));

    // 3. Zammı Sure
    bool readZamm = true;
    if (isFarz && rekat > 2) {
      readZamm = false;
    }
    if (readZamm) {
      list.add(_getZammISure(time, partName, rekat));
    }

    return list;
  }

  static List<DuaSurah> getOturusRecitationsList(Mezhep mezhep, bool isLast) {
    final all = getDuaSurahs();
    if (isLast) {
      return [
        all.firstWhere((element) => element.audioFileName == 'ettehiyyatu.mp3'),
        all.firstWhere((element) => element.audioFileName == 'salli.mp3'),
        all.firstWhere((element) => element.audioFileName == 'barik.mp3'),
        all.firstWhere((element) => element.audioFileName == 'rabbena.mp3'),
      ];
    } else {
      return [
        all.firstWhere((element) => element.audioFileName == 'ettehiyyatu.mp3'),
      ];
    }
  }
}
