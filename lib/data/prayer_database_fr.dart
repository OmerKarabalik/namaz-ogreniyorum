import '../models/prayer_models.dart';

class PrayerDatabaseFr {
  // --- SOURATES ET INVOCATIONS ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Subhaneke',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa jalla sanauka (Seulement dans la prière funéraire). Wa la ilaha ghayruk.',
        translation: 'Gloire et pureté à Toi, ô Allah, et à Toi la louange. Que Ton Nom soit béni, et que Ta majesté soit élevée. Glorieuse est Ta louange (Seulement dans la prière funéraire), et il n\'y a de divinité digne d\'adoration que Toi.',
        description: 'C\'est l\'invocation d\'ouverture récitée dans la première rakat des prières, juste après le tekbir d\'ouverture.',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Al-Fatiha',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Louange à Allah, Seigneur de l\'univers. Le Tout Miséricordieux, le Très Miséricordieux. Souverain du Jour de la rétribution. C\'est Toi seul que nous adorons, et c\'est Toi seul dont nous implorons le secours. Guide-nous dans le droit chemin. Le chemin de ceux que Tu as comblés de bienfaits, non pas de ceux qui ont encouru Ta colère, ni des égarés.',
        description: 'C\'est le pilier fondamental de la prière, obligatoire à réciter dans chaque rakat.',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Al-Fil',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alam tara kayfa fa\'ala rabbuka bi-ashabil-fil. Alam yaj\'al kaydahum fi tadlil. Wa arsala \'alayhim tayran ababil. Tarmihim bi-hijaratin min sijjil. Faja\'alahum ka\'asfin ma\'kul.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. N\'as-tu pas vu comment ton Seigneur a agi avec les compagnons de l\'éléphant? N\'a-t-il pas rendu leur ruse vaine? Et Il a envoyé contre eux des oiseaux par volées, qui leur lançaient des pierres d\'argile cuite. Et Il les a rendus semblables à de la paille mâchée.',
        description: 'Une des petites sourates récitées comme sourate additionnelle (zamm-i sourate) dans les prières.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Quraysh',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Li-ilafi Quraysh. Ilafihim rihlatash-shitai was-sayf. Fal-ya\'budu Rabba hadhal-bayt. Alladhi at\'amahum min ju\'in wa-amanahum min khawf.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. À cause de l\'habitude des Quraysh. De leur habitude des voyages d\'hiver et d\'été. Qu\'ils adorent donc le Seigneur de cette Maison (la Kaaba), qui les a nourris contre la faim et les a sécurisés contre la crainte.',
        description: 'Récitée comme sourate additionnelle dans les prières.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Al-Ma\'un',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Ara-aytal-ladhi yukadhibu bid-din. Fadhanikal-ladhi yadu\'ul-yatim. Wa la yahuddu \'ala ta\'amil-miskin. Fawaylun lil-musallin. Aladhina hum \'an salatihim sahun. Aladhina hum yuraun. Wa yamna\'unal-ma\'un.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Vois-tu celui qui traite de mensonge la Rétribution? C\'est bien lui qui repousse l\'orphelin, et qui n\'encourage pas à nourrir le pauvre. Malheur donc à ceux qui prient tout en étant négligents dans leur prière, ceux qui font parade et qui refusent l\'aide la plus simple.',
        description: 'Récitée comme sourate additionnelle dans les prières.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Al-Kawthar',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahir-rahmanir-rahim. Inna a\'taynakal-kawthar. Fa-salli li-Rabbika wanhar. Inna shani-aka huwal-abtar.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. En vérité, Nous t\'avons accordé l\'Abondance (al-Kawthar). Prie donc ton Seigneur et sacrifie. Certes, ton ennemi sera celui qui est sans postérité.',
        description: 'La plus courte sourate du Saint Coran.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Al-Kafirun',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul ya-ayyuhal-kafirun. La a\'budu ma ta\'budun. Wa la antum \'abiduna ma a\'bud. Wa la ana \'abidun ma \'abadtum. Wa la antum \'abiduna ma a\'bud. Lakum dinukum wa-liya din.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Dis: Ô vous les infidèles! Je n\'adore pas ce que vous adorez. Et vous n\'êtes pas adorateurs de ce que j\'adore. Je ne suis pas adorateur de ce que vous avez adoré. Et vous n\'êtes pas adorateurs de ce que j\'adore. À vous votre religion, et à moi ma religion.',
        description: 'Récitée comme sourate additionnelle dans les prières.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'An-Nasr',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahir-rahmanir-rahim. Idha jaa nasrullahi wal-fath. Wa ra-aytannasa yadkhuluna fi dinillahi afwaja. Fa-sabbih bihamdi Rabbika wastaghfirh. Innahu kana tawwaba.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Lorsque vient le secours d\'Allah ainsi que la victoire, et que tu vois les gens entrer en foule dans la religion d\'Allah, alors célèbre les louanges de ton Seigneur et implore Son pardon. Car c\'est Lui le Grand Accueillant au repentir.',
        description: 'Récitée comme sourate additionnelle dans les prières.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Al-Masad',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Tabbat yada Abi Lahabin watabb. Ma aghna \'anhu maluhu wama kasab. Sayasla naran dhata lahab. Wamra-atuhu hammalatal-hatab. Fi jidiha hablun min masad.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Que périssent les deux mains d\'Abu Lahab et que lui-même périsse! Sa fortune ne lui aura servi à rien, ni ce qu\'il a acquis. Il brûlera dans un Feu plein de flammes, de même que sa femme, la porteuse de bois, qui aura au cou une corde de fibres tressées.',
        description: 'Récitée comme sourate additionnelle dans les prières.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'Al-Ikhlas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul huwallahu ahad. Allahus-samad. Lem yelid wa lem yuled. Wa lem yakun lahu kufuwan ahad.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Dis: Il est Allah, Unique. Allah, le Suprême Refuge. Il n\'a jamais engendré et n\'a pas été engendré. Et nul ne Lui est égal.',
        description: 'La sourate définissant le Monothéisme Islamique (Tawhid).',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Al-Falaq',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbil-falak. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharri-naffathati fil-\'uqad. Wa min sharri hasidin idha hasad.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Dis: Je cherche refuge auprès du Seigneur de l\'aube naissante, contre le mal des êtres qu\'Il a créés, contre le mal de l\'obscurité quand elle s\'approfondit, contre le mal de celles qui soufflent sur les nœuds, et contre le mal de l\'envieux quand il envie.',
        description: 'Récitée pour chercher protection.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'An-Nas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbinnas. Melikinnas. Ilahinnas. Min sharril-waswasil-khannas. Alladhi yuwaswisu fi sudurinnas. Minal-jinnati wannas.',
        translation: 'Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Dis: Je cherche refuge auprès du Seigneur des hommes, le Souverain des hommes, le Dieu des hommes, contre le mal du mauvais conseiller furtif, qui insuffle le mal dans les poitrines des hommes, qu\'il soit djinn ou homme.',
        description: 'Récitée pour chercher protection contre les suggestions diaboliques.',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Ettehiyyatu',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'At-tahiyyatu lillahi was-salawatu wat-tayyibat. As-salamu \'alayka ayyuhan-nabiyyu wa rahmatullahi wa barakatuh. As-salamu \'alayna wa \'ala \'ibadillahis-salihin. Ashhadu an la ilaha illallahu wa ashhadu anna Muhammadan \'abduhu wa rasuluh.',
        translation: 'Les salutations, les prières et les bonnes œuvres sont pour Allah. Que la paix soit sur toi, ô Prophète, ainsi que la miséricorde d\'Allah et Ses bénédictions. Que la paix soit sur nous et sur les serviteurs vertueux d\'Allah. Je témoigne qu\'il n\'y a de divinité digne d\'adoration qu\'Allah, et je témoigne que Muhammad est Son serviteur et Son messager.',
        description: 'Récitée en posture assise lors de chaque prière.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahumma Salli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma salli \'ala Muhammadin wa \'ala ali Muhammad. Kama sallayta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'Ô Allah, répands Tes bénédictions sur Muhammad et sur la famille de Muhammad, comme Tu as répandu Tes bénédictions sur Abraham et sur la famille d\'Abraham. En vérité, Tu es Digne de louanges et Glorieux.',
        description: 'Récitée dans l\'assise finale des prières.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahumma Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma barik \'ala Muhammadin wa \'ala ali Muhammad. Kama barakta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'Ô Allah, bénis Muhammad et la famille de Muhammad, comme Tu as béni Abraham et la famille d\'Abraham. En vérité, Tu es Digne de louanges et Glorieux.',
        description: 'Récitée dans l\'assise finale des prières.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbana',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbana atina fid-dunya hasanaten wa fil-akhirati hasanaten waqina \'adhaban-nar. Rabbanaghfir li wa li-walidayya wa lil-mu\'minina yawma yaqumul-hisab.',
        translation: 'Notre Seigneur, accorde-nous un beau bienfait dans ce monde et un beau bienfait dans l\'au-delà, et protège-nous du châtiment du Feu. Notre Seigneur, pardonne-moi, ainsi qu\'à mes parents et aux croyants, le Jour où le compte sera établi.',
        description: 'Récitée tout à la fin de l\'assise finale avant les salutations.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Qounout 1 (Hanafi)',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
        translation: 'Ô Allah ! Nous Te demandons Ton aide, Ton pardon et Ta guidée. Nous croyons en Toi, nous nous repentons à Toi et nous plaçons notre confiance en Toi. Nous Te louons de tout bien, nous Te remercions et ne sommes pas ingrats envers Toi, et nous délaissons et abandonnons quiconque Te désobéit.',
        description: 'Récité dans la 3e rakat de la prière du Witr dans l\'école hanafite avant l\'inclinaison (Ruku).',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Qounout 2 (Hanafi)',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
        translation: 'Ô Allah ! C\'est Toi Seul que nous adorons, pour Toi Seul que nous prions et nous prosternons. Vers Toi nous accourons et nous empressons de Te servir. Nous espérons Ta miséricorde et redoutons Ton châtiment. En vérité, Ton châtiment atteindra sûrement les mécréants.',
        description: 'Récité dans la 3e rakat de la prière du Witr dans l\'école hanafite juste après la première invocation du Qounout.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Qounout (Chaféite)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
        translation: 'Ô Allah, guide-moi parmi ceux que Tu as guidés. Accorde-moi le salut parmi ceux à qui Tu l\'as accordé. Prends-moi sous Ta protection parmi ceux que Tu as protégés. Bénis pour moi ce que Tu m\'as donné. Préserve-moi du mal de ce que Tu as décrété, car c\'est Toi qui décrètes et nul ne décrète sur Toi. Certes, celui à qui Tu accordes Ton alliance ne sera jamais humilié, et celui à qui Tu t\'opposes ne sera jamais honoré. Béni sois-Tu, ô notre Seigneur, et exalté. À Toi la louange pour ce que Tu as décrété. Je Te demande pardon et je me repens à Toi. Que la paix et les bénédictions d\'Allah soient sur notre maître Muhammad, sa famille et ses compagnons.',
        description: 'Récité dans la 2e rakat de la prière de l\'Aube (Fajr) après s\'être relevé du Ruku dans l\'école chaféite, et dans la seconde moitié du Ramadan dans le Witr.',
      ),
    ];
  }

  // --- ÉTAPES DE L'ABLUTION (ABDEST) ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Intention et Basmala',
      action: 'Formulez l\'intention dans votre cœur: "J\'ai l\'intention de faire l\'ablution pour l\'amour d\'Allah" et dites "Bismillahir-rahmanir-rahim".',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Laver les mains',
      action: 'Lavez les mains jusqu\'aux poignets trois fois, en frottant entre les doigts. Faites bouger les bagues pour laisser passer l\'eau dessous.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Rincer la bouche',
      action: 'Rincez la bouche trois fois avec de l\'eau en utilisant la main droite pour l\'introduire.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Rincer le nez',
      action: 'Aspirez de l\'eau dans le nez trois fois avec la main droite, puis rejetez-la avec la main gauche.',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Laver le visage',
      action: 'Lavez le visage entier trois fois, du haut du front jusqu\'au bas du menton, et d\'une oreille à l\'autre. (Pour les Chafiites, l\'intention doit être formulée précisément au début du lavage du visage).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Laver les bras',
      action: 'Lavez le bras droit puis le bras gauche jusqu\'aux coudes compris trois fois. Veillez à ce qu\'aucune partie ne reste sèche.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Essuyer la tête (Mesh)',
      action: 'Humidifiez les mains et passez-les sur au moins un quart de la tête. (Chez les Chafiites, humidifier quelques cheveux suffit).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Laver les oreilles',
      action: 'Essuyez l\'intérieur des oreilles avec les index et l\'arrière avec les pouces.',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Essuyer le cou',
        action: 'Essuyez l\'arrière du cou avec le dos des doigts humides (non recommandé dans l\'école chafiite).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Laver les pieds',
      action: 'Lavez le pied droit puis le pied gauche trois fois jusqu\'aux chevilles comprises, en frottant bien entre les orteils.',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- ÉTAPES DE LA PRIÈRE (DYNAMIQUE) ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 Rakat Sunnah', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Fard', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 Rakat Première Sunnah', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Dernière Sunnah', 2, false, time));
        break;
      case PrayerTime.ikindi:
        parts.add(_buildPart(mezhep, gender, '4 Rakat Sunnah', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        break;
      case PrayerTime.aksam:
        parts.add(_buildPart(mezhep, gender, '3 Rakat Fard', 3, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Sunnah', 2, false, time));
        break;
      case PrayerTime.yatsi:
        parts.add(_buildPart(mezhep, gender, '4 Rakat Première Sunnah', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Dernière Sunnah', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Rakat Première Sunnah', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (En assemblée)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Rakat Dernière Sunnah', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Rakat Première Sunnah', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (En assemblée)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Dernière Sunnah', 2, false, time));
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
      description: _getPrayerDescription(time),
      parts: parts,
    );
  }

  static String _getPrayerDescription(PrayerTime time) {
    switch (time) {
      case PrayerTime.sabah: return 'La prière du Fajr (matin) comporte 2 rakats sunnah et 2 rakats fard.';
      case PrayerTime.ogle: return 'La prière du Dhuhr comporte 4 premières sunnah, 4 fard et 2 dernières sunnah.';
      case PrayerTime.ikindi: return 'La prière de l\'Asr comporte 4 sunnah et 4 fard.';
      case PrayerTime.aksam: return 'La prière du Maghrib comporte 3 fard et 2 sunnah.';
      case PrayerTime.yatsi: return 'La prière de l\'Isha comporte 4 premières sunnah, 4 fard, 2 dernières sunnah et le Vitr.';
      case PrayerTime.cuma: return 'La prière du Vendredi s\'accomplit en assemblée au temps du Dhuhr.';
      case PrayerTime.bayram: return 'La prière de l\'Aïd comporte 2 rakats avec des tekbirs supplémentaires le matin de la fête.';
      case PrayerTime.cenaze: return 'La prière funéraire s\'accomplit entièrement debout comme intercession pour le défunt.';
    }
  }

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

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intention (Niyyah)',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'Formuler l\'intention dans le cœur est obligatoire. La prononcer à voix haute est sunnah.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir d\'ouverture',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah est le plus Grand.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: _getTekbirNote(mezhep, gender),
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Station debout (Qiyam)',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Inclinaison (Rukû)',
        action: gender == Gender.male
            ? 'Inclinez-vous en gardant le dos bien droit. Saisissez vos genoux en écartant les doigts.'
            : 'Inclinez-vous légèrement. Posez les mains sur les genoux avec les doigts serrés.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Fois)',
        transcription: 'Subhana Rabbiya\'l-\'Azim',
        translation: 'Gloire à mon Seigneur, le Très Grand.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Levez les mains au niveau des épaules (Raf\'ul Yadeyn) en vous inclinant vers le Rukû et dites "Allahu Akbar".'
            : 'Inclinez-vous vers le Rukû en disant le Tekbir sans lever les mains.',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Redressement (I\'tidal)',
        action: 'Redressez-vous complètement du Rukû et restez bien droit debout.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Sami\'allahu liman hamideh.\nRabbana laka\'l-hamd.',
        translation: 'Allah a entendu celui qui L\'a loué.\nNotre Seigneur, à Toi la louange.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: '2e Rakat - Invocation du Qounout (Chaféite)',
          action: 'Après s\'être redressé du ruku, levez les mains à hauteur de poitrine et récitez l\'invocation du Qounout (puis prosternez-vous sans essuyer le visage avec les mains).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
          translation: 'Ô Allah, guide-moi parmi ceux que Tu as guidés. Accorde-moi le salut parmi ceux à qui Tu l\'as accordé. Prends-moi sous Ta protection parmi ceux que Tu as protégés. Bénis pour moi ce que Tu m\'as donné. Préserve-moi du mal de ce que Tu as décrété, car c\'est Toi qui décrètes et nul ne décrète sur Toi. Certes, celui à qui Tu accordes Ton alliance ne sera jamais humilié, et celui à qui Tu t\'opposes ne sera jamais honoré. Béni sois-Tu, ô notre Seigneur, et exalté. À Toi la louange pour ce que Tu as décrété. Je Te demande pardon et je me repens à Toi. Que la paix et les bénédictions d\'Allah soient sur notre maître Muhammad, sa famille et ses compagnons.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'Dans l\'école chaféite, réciter le Qounout après le ruku dans la 2e rakat du Fajr est une sunna appuyée (ab\'ad sunnah).',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 1ère Prosternation',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Fois)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Gloire à mon Seigneur, le Très Haut.',
        imageKey: '${gender.name}_secde',
        note: 'Posez d\'abord les genoux, puis les mains, puis le front et le nez sur le sol.',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Assise (Celse)',
        action: gender == Gender.male
            ? 'Asseyez-vous sur le pied gauche en maintenant le pied droit vertical.'
            : 'Asseyez-vous sur la fesse gauche (Tawarruk). Les mains reposent sur les cuisses.',
        imageKey: '${gender.name}_celse',
        note: 'Marquer un court temps d\'arrêt entre les deux prosternations est obligatoire.',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 2ème Prosternation',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Fois)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Gloire à mon Seigneur, le Très Haut.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Assise Finale',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Réciter At-Tahiyyat, Allahumma Salli, Barik et Rabbana.',
          transcription: 'Réciter les invocations du Tashahhud l\'une après l\'autre.',
          translation: 'Vous pouvez accéder aux textes complets dans le menu Invocations.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salutation (À droite)',
          action: 'Tournez la tête à droite et dites "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Que la paix et la miséricorde d\'Allah soient sur vous.',
          imageKey: '${gender.name}_selam',
          note: 'Regardez vers l\'épaule. Saluer à droite est obligatoire chez les Chafiites.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salutation (À gauche)',
          action: 'Tournez la tête à gauche et dites "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Que la paix et la miséricorde d\'Allah soient sur vous.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Terminer la prière par la salutation à gauche.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Première Assise',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Réciter At-Tahiyyat.',
          transcription: 'At-tahiyyatu lillahi...',
          translation: 'Seule l\'invocation At-Tahiyyat est lue.',
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

  static PrayerPart _buildVitirHanafi(Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intention (Niyyah)',
      action: 'J\'ai l\'intention d\'accomplir la prière du Vitr de 3 rakats d\'aujourd\'hui pour Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir d\'ouverture',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Récitation',
      action: 'Réciter Subhanaka, la Fatiha, et une sourate additionnelle.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Récitation',
      action: 'Réciter la Fatiha et une sourate additionnelle.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Première Assise',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Réciter At-Tahiyyat puis se relever.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam (Avant Qunut)',
      action: 'Joindre les mains. Réciter la Fatiha et une sourate. Après la sourate, relâcher les mains.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Tekbir du Qunut',
      action: gender == Gender.male
          ? 'Lever les mains aux lobes des oreilles, dire "Allahu Akbar" et les lier à nouveau sous le nombril.'
          : 'Lever les mains au niveau de la poitrine, dire "Allahu Akbar" et les lier à nouveau sur la poitrine.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Spécifique à l\'école hanafite avant l\'invocation du Qunut.',
    ));

    // Qounout 1
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Invocation du Qounout 1',
      action: 'Réciter la première invocation du Qounout les mains liées.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
      translation: 'Ô Allah ! Nous Te demandons Ton aide, Ton pardon et Ta guidée. Nous croyons en Toi, nous nous repentons à Toi et nous plaçons notre confiance en Toi. Nous Te louons de tout bien, nous Te remercions et ne sommes pas ingrats envers Toi, et nous délaissons et abandonnons quiconque Te désobéit.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Qounout 2
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Invocation du Qounout 2',
      action: 'Aussitôt après le premier Qounout, réciter la deuxième invocation les mains liées.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
      translation: 'Ô Allah ! C\'est Toi Seul que nous adorons, pour Toi Seul que nous prions et nous prosternons. Vers Toi nous accourons et nous empressons de Te servir. Nous espérons Ta miséricorde et redoutons Ton châtiment. En vérité, Ton châtiment atteindra sûrement les mécréants.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'S\'incliner au Rukû.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Fois)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Redressement',
      action: 'Se redresser du Rukû.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1ère Prosternation',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Assise',
      action: 'S\'asseoir.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2ème Prosternation',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Assise Finale',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Réciter At-Tahiyyat, Salli, Barik et Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À droite)',
      action: 'Donner la salutation à droite.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À gauche)',
      action: 'Donner la salutation à gauche pour terminer.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: '3 Rakat Vitr Wajib',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildVitirOther(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intention (Niyyah)',
      action: 'J\'ai l\'intention d\'accomplir la prière du Vitr pour Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir d\'ouverture',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Récitation',
      action: 'Réciter l\'invocation d\'ouverture, la Fatiha et Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Récitation',
      action: 'Réciter la Fatiha et Al-Kafirun.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Assise et Salutations',
      action: 'S\'asseoir, lire At-Tahiyyat, Salli, Barik et saluer à droite/gauche. Puis se relever pour la dernière rakat unique.',
      imageKey: '${gender.name}_selam',
      note: 'Chez les Chafiites, Malikites et Hanbalites, la meilleure façon est de faire 2+1 rakats.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 (Unique) - Intention & Tekbir',
      action: 'Formuler l\'intention pour la dernière rakat du Vitr. Prendre le Tekbir d\'ouverture.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam & Récitation',
      action: 'Réciter la Fatiha et Al-Ikhlas.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'S\'incliner au Rukû.',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Redressement (Qounout)',
      action: mezhep == Mezhep.shafii
          ? 'Durant la deuxième moitié du Ramadan, après s\'être redressé du ruku, lever les mains et réciter l\'invocation du Qounout.'
          : 'Se redresser du Rukû.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'Ô Allah, guide-moi parmi ceux que Tu as guidés. Accorde-moi le salut parmi ceux à qui Tu l\'as accordé. Prends-moi sous Ta protection parmi ceux que Tu as protégés. Bénis pour moi ce que Tu m\'as donné. Préserve-moi du mal de ce que Tu as décrété, car c\'est Toi qui décrètes et nul ne décrète sur Toi. Certes, celui à qui Tu accordes Ton alliance ne sera jamais humilié, et celui à qui Tu t\'opposes ne sera jamais honoré. Béni sois-Tu, ô notre Seigneur, et exalté. À Toi la louange pour ce que Tu as décrété. Je Te demande pardon et je me repens à Toi. Que la paix et les bénédictions d\'Allah soient sur notre maître Muhammad, sa famille et ses compagnons.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'Dans l\'école chaféite, réciter le Qounout après le ruku dans la dernière rakat du Witr durant la deuxième moitié du Ramadan est une sunna.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1ère Prosternation',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Assise',
      action: 'S\'asseoir.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2ème Prosternation',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Assise Finale',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Réciter At-Tahiyyat, Salli, Barik et Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À droite)',
      action: 'Donner la salutation à droite.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À gauche)',
      action: 'Donner la salutation à gauche.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Vitr (2+1 Rakat)',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildBayram(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intention (Niyyah)',
      action: 'J\'ai l\'intention d\'accomplir la prière de l\'Aïd d\'aujourd\'hui pour Allah, en suivant l\'Imam présent.',
      imageKey: '${gender.name}_niyet',
      note: 'Les prières de l\'Aïd al-Fitr (Ramazan) et de l\'Aïd al-Adha (Kurban) s\'effectuent exactement de la même manière.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir d\'ouverture',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Invocation d\'ouverture',
      action: mezhep == Mezhep.shafii
          ? 'Réciter l\'invocation du Veccehtu.'
          : 'Réciter l\'invocation du Subhanaka.',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Tekbirs supplémentaires (7 Fois)',
        action: 'Lever les mains et dire 7 fois "Allahu Akbar". Lier les mains après chaque Tekbir. Réciter "Subhanallahi..." entre chaque.',
        arabicText: 'اللهُ أَكْبَرُ (7 Fois)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Tekbirs supplémentaires (3 Fois)',
        action: 'Lever les mains et dire 3 fois "Allahu Akbar". Relâcher les mains lors des deux premiers, les lier au troisième.',
        arabicText: 'اللهُ أَكْبَرُ (3 Fois)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Récitation',
      action: 'Réciter la Fatiha et Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Tekbirs supplémentaires (5 Fois)',
        action: 'En entamant la rakat 2, avant la récitaton, lever les mains 5 fois et réciter le Tekbir.',
        arabicText: 'اللهُ أَكْبَرُ (5 Fois)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Récitation',
        action: 'Réciter la Fatiha et Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Récitation',
        action: 'Réciter la Fatiha et Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Tekbirs supplémentaires (3 Fois)',
        action: 'Après la récitaton et avant le Rukû, lever les mains 3 fois en disant "Allahu Akbar", les relâcher sur les côtés.',
        arabicText: 'اللهُ أَكْبَرُ (3 Fois)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Passage au Rukû',
        action: 'Dire un 4ème Tekbir sans lever les mains et s\'incliner directement au Rukû.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Redressement',
        action: 'Se redresser.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 1ère Prosternation',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Assise',
        action: 'S\'asseoir.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 2ème Prosternation',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Assise Finale',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Réciter At-Tahiyyat, Salli, Barik et Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À droite)',
      action: 'Donner la salutation à droite.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À gauche)',
      action: 'Donner la salutation à gauche.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Prière de l\'Aïd',
      rakatCount: 2,
      steps: steps,
    );
  }

  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intention (Niyyah)',
      action: 'J\'ai l\'intention d\'accomplir la prière funéraire pour Allah, les prières sur le Prophète, et l\'invocation pour le défunt, en suivant l\'Imam présent.',
      imageKey: '${gender.name}_niyet',
      note: 'La prière funéraire s\'effectue entièrement debout. Il n\'y a ni Rukû ni prosternation.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1er Tekbir',
      action: gender == Gender.male
          ? 'Lever les mains aux lobes des oreilles, dire "Allahu Akbar" et les lier sous le nombril.'
          : 'Lever les mains au niveau de la poitrine, dire "Allahu Akbar" et les lier sur la poitrine.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Récitation du 1er Tekbir',
      action: mezhep == Mezhep.shafii
          ? 'Réciter silencieusement la sourate Al-Fatiha.'
          : 'Réciter l\'invocation Subhanaka avec la formule "wa jalla sanauka".',
      arabicText: mezhep == Mezhep.shafii ? 'Al-Fatiha' : 'Subhanaka (avec wa jalla sanauka)',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2ème Tekbir & Salutations',
      action: 'Prendre le Tekbir. Réciter Allahumma Salli et Barik.',
      arabicText: 'Allahumma Salli & Allahumma Barik',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3ème Tekbir & Prière pour le défunt',
      action: 'Prendre le 3ème Tekbir. Réciter l\'invocation spéciale pour le défunt.',
      arabicText: 'Prière Funéraire',
      imageKey: '${gender.name}_kiyam',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '4ème Tekbir',
      action: 'Prendre le 4ème Tekbir, rester brièvement debout, relâcher les mains sur les côtés.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À droite)',
      action: 'Donner la salutation à droite en position debout.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salutation (À gauche)',
      action: 'Donner la salutation à gauche pour terminer la prière funéraire.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'Prière Funéraire',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Rukû',
      action: 'S\'incliner au Rukû.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Redressement',
      action: 'Se redresser.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 1ère Prosternation',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Assise',
      action: 'S\'asseoir.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 2ème Prosternation',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPER ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'Formulez l\'intention: "J\'ai l\'intention de faire la prière du ${time.name} ($partName) d\'aujourd\'hui pour Allah."';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Lever les mains jusqu\'à ce que les pouces touchent les lobes des oreilles. "Allahu Akbar" dire et joindre sous le nombril.';
      } else {
        return 'Lever les mains au niveau des épaules. "Allahu Akbar" dire et joindre sous la poitrine.';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'Lever les mains au niveau de la poitrine. "Allahu Akbar" dire et joindre sur la poitrine, la main droite sur la main gauche.';
      } else {
        return 'Lever les mains au niveau des épaules, prendre le Tekbir et joindre sur la poitrine.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'Chez les Chafiites, lever les mains au niveau des épaules lors du Tekbir d\'ouverture est sunnah.';
    }
    return 'Les hommes lèvent les mains aux oreilles, les femmes à la poitrine.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Se tenir droit standing. Joindre les mains sous le nombril, main droite sur le poignet gauche. Regard sur le lieu de prosternation.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Se tenir droit. Joindre les mains sous la poitrine, au-dessus du nombril (hauteur du cœur).';
      } else {
        structure = 'Se tenir droit. Mains ballantes sur les côtés (Sadl) ou jointes sous la poitrine.';
      }
    } else {
      structure = 'Se tenir droit. Joindre les mains sur la poitrine, main droite sur la gauche sans serrer. Regard vers le lieu de prosternation.';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nRéciter l\'invocation d\'ouverture (Veccehtu). Dire Euzü-Besmele, Fatiha, puis réciter une sourate additionnelle.';
      }
      return '$structure\nRéciter Subhanaka. Dire Euzü-Besmele, Fatiha et une sourate additionnelle (Zamm-ı Sure).';
    } else if (rekat == 2) {
      return '$structure\nDire Besmele, réciter la Fatiha et une sourate additionnelle.';
    } else {
      if (isFarz) {
        return '$structure\nDire Besmele et réciter uniquement la Fatiha. Pas de sourate additionnelle.';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          return '$structure\nDans la 3ème rakat de ces Sunnahs, réciter d\'abord Subhanaka, puis la Fatiha et une sourate.';
        }
        return '$structure\nDire Besmele, réciter la Fatiha et une sourate additionnelle.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('First Sunnah') || partName.contains('Première')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3;
      } else if (partName.contains('Fard') || partName.contains('Farz')) {
        index = (rekat == 1) ? 4 : 5;
      } else {
        index = (rekat == 1) ? 6 : 7;
      }
    } else if (time == PrayerTime.ikindi) {
      index = (rekat == 1) ? 0 : 1;
    } else if (time == PrayerTime.aksam) {
      index = (rekat == 1) ? 6 : 7;
    } else {
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

    bool readIftitah = ((rekat == 1) || (isIkindiYatsi && rekat == 3)) && mezhep != Mezhep.maliki;
    if (readIftitah) {
      if (mezhep == Mezhep.shafii && rekat == 1) {
        arabic.writeln('[INVOCATION D\'OUVERTURE SHAFI\'I (VECCEHTÜ)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Invocation d\'ouverture Shafi\'i (Veccehtü)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.');
        translation.writeln('[Invocation d\'ouverture Shafi\'i Traduction]');
        translation.writeln('Je tourne mon visage vers Celui qui a créé les cieux et la terre, en pur croyant, et je ne suis point du nombre des associateurs. Certes, ma prière, mes actes de dévotion, ma vie et ma mort appartiennent à Allah, Seigneur de l\'univers. Il n\'a point d\'associé. C\'est cela qui m\'a été ordonné, et je suis du nombre des Soumis (Musulmans).');
      } else {
        arabic.writeln('[INVOCATION SUBHANAKA]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Invocation Subhanaka]');
        transcription.writeln('Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa la ilaha ghayruk.');
        translation.writeln('[Invocation Subhanaka Traduction]');
        translation.writeln('Gloire et pureté à Toi, ô Allah, et à Toi la louange. Que Ton Nom soit béni, et que Ta majesté soit élevée. Il n\'y a de divinité digne d\'adoration que Toi.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[SOURATE AL-FATIHA]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْمِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[Al-Fatiha]');
    transcription.writeln('Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.');
    translation.writeln('[Al-Fatiha Traduction]');
    translation.writeln('Au nom d\'Allah, le Tout Miséricordieux, le Très Miséricordieux. Louange à Allah, Seigneur de l\'univers. Le Tout Miséricordieux, le Très Miséricordieux. Souverain du Jour de la rétribution. C\'est Toi seul que nous adorons, et c\'est Toi seul dont nous implorons le secours. Guide-nous dans le droit chemin. Le chemin de ceux que Tu as comblés de bienfaits, non pas de ceux qui ont encouru Ta colère, ni des égarés.');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[SOURATE ADDITIONNELLE (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Sourate ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[${zamm.name} Traduction]');
      translation.writeln(zamm.translation);
    }

    return {
      'arabic': arabic.toString(),
      'transcription': transcription.toString(),
      'translation': translation.toString(),
    };
  }

  static String _getKiyamNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'Dans l\'école chafiite, réciter Veccehtu au lieu de Subhanaka au 1er rakat. Dire la Basmala à voix haute.';
    }
    return 'Qiyam est la station debout. Fixer le lieu de prosternation aide à la concentration.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Lever les mains au niveau des épaules lors du redressement.';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' Chez les Chafiites, réciter la prière du Qunut debout dans le 2ème rakat.';
    }
    return note.isNotEmpty ? note : 'Rester debout brièvement pour retrouver son calme.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Prosternation (Sujud). Le front et le nez touchent le sol. Les orteils pointent vers la Qibla. Garder les coudes décollés du sol et écartés du corps.';
    } else {
      return 'Prosternation. Le front et le nez touchent le sol. Les coudes restent au sol et contre le corps (posture serrée).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'Dans l\'assise finale, s\'asseoir sur la fesse gauche, le pied gauche passant sous la jambe droite (Tawarruk).';
      }
      return 'S\'asseoir sur le pied gauche, en maintenant le pied droit vertical (Iftirish). Les mains reposent sur les cuisses.';
    } else {
      return 'Dans les deux assises, s\'asseoir sur la fesse gauche en dirigeant les pieds vers la droite (Tawarruk).';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'Réciter les invocations At-Tahiyyat, Salli, Barik et Rabbana.';
    }
    return 'Réciter uniquement At-Tahiyyat dans la première assise.';
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

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        list.add(DuaSurah(
          audioFileName: 'veccehtu.mp3',
          name: 'Wajjahtu',
          arabic: 'وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ. إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ. لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ.',
          transcription: 'Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.',
          translation: 'Je tourne mon visage vers Celui qui a créé les cieux et la terre, en pur croyant, et je ne suis point du nombre des associateurs. Certes, ma prière, mes actes de dévotion, ma vie et ma mort appartiennent à Allah, Seigneur de l\'univers. Il n\'a point d\'associé. C\'est cela qui m\'a été ordonné, et je suis du nombre des Soumis (Musulmans).',
          description: '',
        ));
      } else if (mezhep != Mezhep.maliki) {
        list.add(all.firstWhere((element) => element.name == 'Subhanaka'));
      }
    } else if (isIkindiYatsi && rekat == 3) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        list.add(all.firstWhere((element) => element.name == 'Subhanaka'));
      }
    }

    list.add(all.firstWhere((element) => element.name.contains('Fatiha')));

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      list.add(_getZammISure(time, partName, rekat));
    }

    return list;
  }

  static List<DuaSurah> getOturusRecitationsList(Mezhep mezhep, bool isLast) {
    final all = getDuaSurahs();
    if (isLast) {
      return [
        all.firstWhere((element) => element.name == 'At-Tahiyyat'),
        all.firstWhere((element) => element.name == 'Allahumma Salli'),
        all.firstWhere((element) => element.name == 'Allahumma Barik'),
        all.firstWhere((element) => element.name.contains('Rabbana')),
      ];
    } else {
      return [
        all.firstWhere((element) => element.name == 'At-Tahiyyat'),
      ];
    }
  }
}
