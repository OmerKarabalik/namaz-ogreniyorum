import '../models/prayer_models.dart';

class PrayerDatabaseIt {
  // --- SURAHS AND PRAYERS ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Subhaneke',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa jalla sanauka (Solo nella preghiera funebre). Wa la ilaha ghayruk.',
        translation: 'Gloria a Te, o Allah, e ogni lode. Benedetto è il Tuo nome, ed esaltata è la Tua maestà. Gloriosa è la Tua lode (Solo nella preghiera funebre), e non c\'è divinità degna di adorazione all\'infuori di Te.',
        description: 'Questa è la supplica di apertura letta nel primo rakat delle preghiere, subito dopo il takbir di apertura.',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Al-Fatiha',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. La lode appartiene ad Allah, Signore dei mondi. Il Compassionevole, il Misericordioso. Re del Giorno del Giudizio. Te noi adoriamo e a Te chiediamo aiuto. Guidaci sulla retta via. La via di coloro che hai colmato di grazia, non di coloro che sono incorsi nella Tua ira, né degli sviati.',
        description: 'È il pilastro centrale della preghiera, obbligatorio da recitare in ogni singolo rakat.',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Al-Fil',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alam tara kayfa fa\'ala rabbuka bi-ashabil-fil. Alam yaj\'al kaydahum fi tadlil. Wa arsala \'alayhim tairan ababil. Tarmihim bi-hijaratin min siggil. Fagia\'alahum ka\'asfin ma\'kul.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Non hai visto come agì il tuo Signore con i compagni dell\'elefante? Non rese vano il loro stratagemma? E mandò contro di loro stormi di uccelli, che li colpirono con pietre di argilla indurita. E li ridusse come paglia masticata.',
        description: 'Una delle sure brevi recitate come sura aggiuntiva (zamm-i surah) nelle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Quraysh',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Li-ilafi Quraish. Ilafihim rihlatash-shitai was-saif. Fal-ya\'budu Rabba hadhal-bait. Alladhi at\'amahum min giu\'in wa-amanahum min khauf.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Per il patto di sicurezza dei Quraysh. Il loro patto di sicurezza per le carovane d\'inverno e d\'estate. Adorino dunque il Signore di questa Casa, che li ha nutriti contro la fame e li ha rassicurati contro il timore.',
        description: 'Recitata come sura aggiuntiva nelle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Al-Ma\'un',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Ara-aytal-ladhi yukadhibu bid-din. Fadhalikal-ladhi yadu\'ul-yatim. Wa la yahuddu \'ala ta\'amil-miskin. Fawailun lil-musallin. Aladhina hum \'an salatihim sahun. Aladhina hum yuraun. Wa yamna\'unal-ma\'un.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Hai visto colui che smentisce la Retribuzione? È colui che scaccia l\'orfano, e non esorta a nutrire il povero. Guai a coloro che pregano ma sono distratti nella loro preghiera, coloro che pregano per farsi vedere e rifiutano persino il minimo aiuto.',
        description: 'Recitata come sura aggiuntiva nelle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Al-Kawthar',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahir-rahmanir-rahim. Inna a\'tainakal-kauthar. Fa-salli li-Rabbika wanhar. Inna shani-aka huwal-abtar.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. In verità, ti abbiamo concesso, o Muhammad, l\'Abbondanza (Al-Kawthar). Prega dunque il tuo Signore e sacrifica. In verità è chi ti odia ad essere reciso (privo di posterità).',
        description: 'La sura più corta del Sacro Corano.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Al-Kafirun',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Qul ya-ayyuhal-kafirun. La a\'budu ma ta\'budun. Wa la antum \'abiduna ma a\'bud. Wa la ana \'abidun ma \'abadtum. Wa la antum \'abiduna ma a\'bud. Lakum dinukum wa-liya din.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Di\': O miscredenti! Io non adoro ciò che voi adorate. Né voi siete adoratori di ciò che io adoro. Né io sarò adoratore di ciò che voi avete adorato. Né voi sarete adoratori di ciò che io adoro. A voi la vostra religione, a me la mia religione.',
        description: 'Recitata come sura aggiuntiva nelle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'An-Nasr',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahir-rahmanir-rahim. Idha gia-a nasrullahi wal-fath. Wa ra-aitannasa yadkhuluna fi dinillahi afwagia. Fa-sabbih bihamdi Rabbika wastaghfirh. Innahu kana tawwaba.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Quando verrà l\'aiuto di Allah e la vittoria, e vedrai le genti entrare in massa nella religione di Allah, esalta la lode del tuo Signore e chiediGli perdono. In verità, Egli è Colui che accetta il pentimento.',
        description: 'Recitata come sura aggiuntiva nelle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Al-Masad',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Tabbat yada Abi Lahabin watabb. Ma aghna \'anhu maluhu wama kasab. Sayasla naran dhata lahab. Wamra-atuhu hammalatal-hatab. Fi giidiha hablun min masad.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Periscano le mani di Abu Lahab, e perisca lui stesso! Le sue ricchezze e i suoi guadagni non gli gioveranno. Brucerà in un Fuoco fiammeggiante. E sua moglie, portatrice di legna da ardere, avrà al collo una corda di fibra ritorta.',
        description: 'Recitata come sura aggiuntiva nelle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'Al-Ikhlas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahir-rahmanir-rahim. Qul huwallahu ahad. Allahus-samad. Lam yalid wa lam yulad. Wa lam yakul-lahu kufuwan ahad.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Di\': Egli, Allah, è Unico. Allah, il Rifugio Eterno. Non ha generato, né è stato generato. E nessuno è a Lui pari.',
        description: 'La sura centrale che definisce il monoteismo islamico.',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Al-Falaq',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Qul a\'udhu biRabbil-falaq. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharri-naffathati fil-\'uqad. Wa min sharri hasidin idha hasad.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Di\': Mi rifugio nel Signore dell\'alba nascente. Dal male di ciò che ha creato. Dal male dell\'oscurità quando si addensa. Dal male delle soffiatrici sui nodi. E dal male dell\'invidioso quando invidia.',
        description: 'Recitata per cercare protezione dai mali.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'An-Nas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Qul a\'udhu biRabbinnas. Malikinnas. Ilahinnas. Min sharril-waswasil-khannas. Alladhi yuwaswisu fi sudurinnas. Minal-ginnati wannas.',
        translation: 'In nome di Allah, il Compassionevole, il Misericordioso. Di\': Mi rifugio nel Signore degli uomini. Sovrano degli uomini. Dio degli uomini. Dal male del sussurratore furtivo - che sussurra nei cuori degli uomini - tra i jinn e gli uomini.',
        description: 'Recitata per cercare protezione dai sussurri.',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Ettehiyyatu',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'At-tahiyyatu lillahi was-salawatu wat-tayyibat. As-salamu \'alaika ayyuhan-nabiyyu wa rahmatullahi wa barakatuh. As-salamu \'alaina wa \'ala \'ibadillahis-salihin. Ashhadu an la ilaha illallahu wa ashhadu anna Muhammadan \'abduhu wa rasuluh.',
        translation: 'Tutti gli omaggi, le preghiere e le buone azioni appartengono ad Allah. La pace sia su di te, o Profeta, e la misericordia di Allah e le Sue benedizioni. La pace sia su di noi e sui giusti servi di Allah. Testimonio che non vi è divinità all\'infuori di Allah, e testimonio che Muhammad è Suo servo e Suo messaggero.',
        description: 'Recitata nella posizione seduta di ogni preghiera.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahumma Salli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma salli \'ala Muhammadin wa \'ala ali Muhammad. Kama sallaita \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Magid.',
        translation: 'O Allah, benedici Muhammad e la famiglia di Muhammad, come hai benedetto Abramo e la famiglia di Abramo. In verità Tu sei Degno di lode e Glorioso.',
        description: 'Recitata nella posizione seduta finale delle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahumma Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma barik \'ala Muhammadin wa \'ala ali Muhammad. Kama barakta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Magid.',
        translation: 'O Allah, benedici Muhammad e la famiglia di Muhammad, come hai benedetto Abramo e la famiglia di Abramo. In verità Tu sei Degno di lode e Glorioso.',
        description: 'Recitata nella posizione seduta finale delle preghiere.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbana',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan waqina \'adhaban-nar. Rabbanaghfir li wa li-walidaiya wa lil-mu\'minina yauma yaqumul-hisab.',
        translation: 'Signor nostro, dacci il bene in questo mondo e il bene nell\'Aldilà, e proteggici dal castigo del Fuoco. Signor nostro, perdona me, i miei genitori e i credenti nel Giorno in cui si terrà il conto.',
        description: 'Recitate alla fine della seduta finale prima di dare il Salaam.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Supplica del Qunut 1',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allahumma inna nasta\'inuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
        translation: 'O Allah! Chiediamo il Tuo aiuto, imploriamo il Tuo perdono e cerchiamo la Tua guida. Crediamo in Te, a Te ci rivolgiamo pentiti e in Te confidiamo. Ti lodiamo con ogni bene, Ti ringraziamo e non siamo ingrati verso di Te, e abbandoniamo e lasciamo chiunque Ti disobbedisca.',
        description: 'La prima supplica del Qunut recitata prima del ruku nel 3° rakat della preghiera Vitr nella scuola hanafita.',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Supplica del Qunut 2',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
        translation: 'O Allah! Te solo adoriamo, e per Te preghiamo e ci prostriamo. Verso di Te ci affrettiamo e corriamo a servire. Speriamo nella Tua misericordia e temiamo il Tuo castigo. In verità, il Tuo castigo colpirà i miscredenti.',
        description: 'La seconda supplica del Qunut recitata subito dopo la prima nel 3° rakat della preghiera Vitr nella scuola hanafita.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Supplica del Qunut (Shafi\'i)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa-innaka taqdi wa la yuqda \'alayk, wa innahu la yadhillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
        translation: 'O Allah, guidami tra coloro che hai guidato, concedimi salute tra coloro a cui hai concesso salute, prendimi sotto la Tua protezione tra coloro che proteggi, benedicimi in ciò che mi hai donato e proteggimi dal male di ciò che hai decretato. Poiché Tu solo decreti e nessuno decreta su di Te. In verità, non sarà umiliato chi hai preso come alleato, né sarà onorato chi hai preso come nemico. Tu sei Benedetto, Signor nostro, ed Eccelso! A Te sia la lode per tutto ciò che hai decretato. Ti chiedo perdono e a Te mi pento. E la pace e la benedizione di Allah siano sul nostro maestro Muhammad, sulla sua famiglia e sui suoi compagni.',
        description: 'Recitata nel 2° rakat della preghiera dell\'alba (Fajr) dopo essersi alzati dal ruku e nella seconda metà della preghiera Vitr in Ramadan nella scuola sciafeita.',
      ),
    ];
  }

  // --- WUDU (ABLUTION) STEPS ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Intenzione e Basmala',
      action: 'Fai l\'intenzione mentalmente: "Intendo fare il wudu per amore di Allah" e dì "Bismillahir-rahmanir-rahim".',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavaggio delle Mani',
      action: 'Lava le mani fino ai polsi tre volte, strofinando tra le dita. Assicurati che l\'acqua arrivi sotto gli anelli.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Sciacquare la Bocca',
      action: 'Sciacqua la bocca tre volte con acqua usando la mano destra, facendola girare accuratamente.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Sciacquare il Naso',
      action: 'Aspira l\'acqua nel naso tre volte usando la mano destra, e soffiala via con la mano sinistra.',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavaggio del Viso',
      action: 'Lava l\'intero viso tre volte, dall\'alto della fronte alla parte inferiore del mento, e da un orecchio all\'altro. (Nella scuola Shafi\'i, l\'intenzione deve essere fatta all\'inizio del lavaggio del viso).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavaggio delle Braccia',
      action: 'Lava il braccio destro fino al gomito compreso tre volte, poi ripeti con il braccio sinistro.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Passaggio sulla Testa (Mesh)',
      action: 'Inumidisci le mani e passa su almeno un quarto della testa. (Nella scuola Shafi\'i, passare anche su pochi capelli è sufficiente).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavaggio delle Orecchie',
      action: 'Pulisci le parti interne delle orecchie con gli indici e la parte posteriore con i pollici.',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Passaggio sul Collo',
        action: 'Passa sul retro del collo con il dorso delle dita (non raccomandato nella scuola Shafi\'i).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavaggio dei Piedi',
      action: 'Lava il piede destro fino alle caviglie comprese tre volte, partendo dalle dita, poi fai lo stesso per il piede sinistro.',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- DYNAMIC PRAYER STEPS GENERATOR ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 Rakat Sunnah', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Fard', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 Rakat Prima Sunnah', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Ultima Sunnah', 2, false, time));
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
        parts.add(_buildPart(mezhep, gender, '4 Rakat Prima Sunnah', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Ultima Sunnah', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Rakat Prima Sunnah', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (In Congregazione)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Rakat Ultima Sunnah', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Rakat Prima Sunnah', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (In Congregazione)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Ultima Sunnah', 2, false, time));
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
      case PrayerTime.sabah: return 'La preghiera del Fajr consiste di 2 rakat sunnah e 2 rakat fard.';
      case PrayerTime.ogle: return 'La preghiera dello Dhuhr consiste di 4 prima sunnah, 4 fard e 2 ultima sunnah.';
      case PrayerTime.ikindi: return 'La preghiera dell\'Asr consiste di 4 sunnah e 4 fard.';
      case PrayerTime.aksam: return 'La preghiera del Maghrib consiste di 3 fard e 2 sunnah.';
      case PrayerTime.yatsi: return 'La preghiera dell\'Isha consiste di 4 prima sunnah, 4 fard, 2 ultima sunnah e Vitir.';
      case PrayerTime.cuma: return 'La preghiera del Jumah viene eseguita in congregazione durante l\'orario dello Dhuhr di venerdì.';
      case PrayerTime.bayram: return 'La preghiera dell\'Eid consiste di 2 rakat eseguiti le mattine dell\'Eid con takbir aggiuntivi.';
      case PrayerTime.cenaze: return 'La preghiera funebre si esegue interamente in piedi, chiedendo perdono per il defunto.';
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
      title: 'Intenzione (Niyyah)',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'L\'intenzione è richiesta mentalmente. Pronunciarla con la lingua è raccomandato.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir di Apertura',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah è il Più Grande.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: _getTekbirNote(mezhep, gender),
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Qiyam & Qira\'at',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Rukû',
        action: gender == Gender.male
            ? 'Piegati mantenendo la schiena dritta. Afferra le ginocchia con le dita ben divaricate. Guarda il punto di prostrazione.'
            : 'Piegati leggermente (meno degli uomini). Metti le mani sulle ginocchia con le dita unite.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Volte)',
        transcription: 'Subhana Rabbiya\'l-\'Azim',
        translation: 'Gloria al mio Signore, l\'Onnipotente.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Alza le mani fino alle spalle (Raf\'ul Yadeyn) mentre scendi in Rukû e di\' "Allahu Akbar".'
            : 'Scendi in Rukû dicendo "Allahu Akbar" senza alzare le mani.',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Risalita (I\'tidal)',
        action: 'Alzati completamente dritto dal Rukû.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Sami\'allahu liman hamidah.\nRabbana laka\'l-hamd.',
        translation: 'Allah ascolta chi Lo loda.\nSignor nostro, a Te la lode.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: '2° Rakat - Supplica del Qunut (Shafi\'i)',
          action: 'Dopo essersi alzati dal ruku, alzare le mani all\'altezza del petto e recitare la supplica del Qunut (poi andare in prostrazione senza passare le mani sul viso).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa-innaka taqdi wa la yuqda \'alayk, wa innahu la yadhillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
          translation: 'O Allah, guidami tra coloro che hai guidato, concedimi salute tra coloro a cui hai concesso salute, prendimi sotto la Tua protezione tra coloro che proteggi, benedicimi in ciò che mi hai donato e proteggimi dal male di ciò che hai decretato. Poiché Tu solo decreti e nessuno decreta su di Te. In verità, non sarà umiliato chi hai preso come alleato, né sarà onorato chi hai preso come nemico. Tu sei Benedetto, Signor nostro, ed Eccelso! A Te sia la lode per tutto ciò che hai decretato. Ti chiedo perdono e a Te mi pento. E la pace e la benedizione di Allah siano sul nostro maestro Muhammad, sulla sua famiglia e sui suoi compagni.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'Nella scuola sciafeita, recitare il Qunut dopo essersi alzati dal ruku nel 2° rakat della preghiera dell\'alba (Fajr) è una sunnah confermata (ab\'ad sunnah).',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 1ª Prostrazione',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Volte)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Gloria al mio Signore, l\'Altissimo.',
        imageKey: '${gender.name}_secde',
        note: 'Quando vai in Sujud, tocca prima con le ginocchia, poi con le mani, poi fronte e naso a terra.',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Seduta (Celse)',
        action: gender == Gender.male
            ? 'Siediti sul piede sinistro mantenendo il piede destro dritto con le dita rivolte verso la Qibla.'
            : 'Siediti sull\'anca sinistra con entrambi i piedi che escono sul lato destro (Tawarruk).',
        imageKey: '${gender.name}_celse',
        note: 'Fare una breve pausa tra le due prostrazioni è obbligatorio.',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 2ª Prostrazione',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Volte)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Gloria al mio Signore, l\'Altissimo.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Seduta Finale',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Leggi At-Tahiyyat, Allahumma Salli, Barik e Rabbana.',
          transcription: 'Recita le suppliche del Tashahhud.',
          translation: 'Puoi accedere alle traduzioni complete nella scheda Suppliche.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salaam (Destra)',
          action: 'Gira la testa a destra e di\' "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'La pace e la misericordia di Allah siano su di voi.',
          imageKey: '${gender.name}_selam',
          note: 'Guarda verso le spalle. Il Salaam a destra è fard nello Shafi\'i.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salaam (Sinistra)',
          action: 'Gira la testa a sinistra e di\' "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'La pace e la misericordia di Allah siano su di voi.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Completa la preghiera con il Salaam a sinistra.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Prima Seduta',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Recita At-Tahiyyat.',
          transcription: 'At-tahiyyatu lillahi...',
          translation: 'Viene letta solo la supplica di At-Tahiyyat.',
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
      title: 'Intenzione (Niyyah)',
      action: 'Intendo pregare la preghiera Vitir di 3 rakat di oggi per amore di Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir di Apertura',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Qira\'at',
      action: 'Recita Subhanaka, Fatiha e una Sura aggiuntiva.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Qira\'at',
      action: 'Recita Fatiha e una Sura aggiuntiva.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Prima Seduta',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Recita At-Tahiyyat e rialzati.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam (Prima del Qunut)',
      action: 'Alzati e unisci le mani. Recita Fatiha e una Sura. Dopo che la Sura è terminata, rilascia le mani.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Takbir del Qunut',
      action: gender == Gender.male
          ? 'Alza le mani ai lobi delle orecchie, di\' "Allahu Akbar" e uniscile di nuovo sotto l\'ombelico.'
          : 'Alza le mani al petto, di\' "Allahu Akbar" e uniscile di nuovo sul petto.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Specifico della scuola Hanafi. Fatto prima della supplica del Qunut.',
    ));

    // Supplica del Qunut 1
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Supplica del Qunut 1',
      action: 'Recita la prima supplica del Qunut con le mani giunte.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allahumma inna nasta\'inuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
      translation: 'O Allah! Chiediamo il Tuo aiuto, imploriamo il Tuo perdono e cerchiamo la Tua guida. Crediamo in Te, a Te ci rivolgiamo pentiti e in Te confidiamo. Ti lodiamo con ogni bene, Ti ringraziamo e non siamo ingrati verso di Te, e abbandoniamo e lasciamo chiunque Ti disobbedisca.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Supplica del Qunut 2
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Supplica del Qunut 2',
      action: 'Subito dopo il primo Qunut, recita la seconda supplica con le mani giunte.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
      translation: 'O Allah! Te solo adoriamo, e per Te preghiamo e ci prostriamo. Verso di Te ci affrettiamo e corriamo a servire. Speriamo nella Tua misericordia e temiamo il Tuo castigo. In verità, il Tuo castigo colpirà i miscredenti.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'Vai in Rukû.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Volte)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Risalita',
      action: 'Alzati dal Rukû.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1ª Prostrazione',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Seduta',
      action: 'Siediti tra le prostrazioni.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2ª Prostrazione',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Seduta Finale',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Recita At-Tahiyyat, Salli, Barik e Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Destra)',
      action: 'Dai il Salaam a destra.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Sinistra)',
      action: 'Dai il Salaam a sinistra per completare la preghiera.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: '3 Rakat Vitir Wajib',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildVitirOther(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intenzione (Niyyah)',
      action: 'Intendo pregare la preghiera Vitir di oggi per amore di Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir di Apertura',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Qira\'at',
      action: 'Recita la supplica di apertura. Fatiha e Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Qira\'at',
      action: 'Recita Fatiha e Al-Kafirun.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Seduta e Salaam',
      action: 'Siediti, recita At-Tahiyyat, Salli, Barik e dai il Salaam. Poi rialzati per l\'ultimo 1 rakat.',
      imageKey: '${gender.name}_selam',
      note: 'Nelle scuole Shafi\'i, Maliki e Hanbali, è più virtuoso eseguire il Vitir in 2+1 rakat.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 (Singolo) - Intenzione & Takbir',
      action: 'Intendo pregare l\'ultimo rakat della preghiera Vitir. Prendi il Takbir di apertura.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam & Qira\'at',
      action: 'Recita Fatiha e Al-Ikhlas.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'Vai in Rukû.',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Risalita (Qunut)',
      action: mezhep == Mezhep.shafii
          ? 'Nella seconda metà del Ramadan, dopo esserti alzato dal ruku, alza le mani e recita la supplica del Qunut.'
          : 'Alzati dal Rukû.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa-innaka taqdi wa la yuqda \'alayk, wa innahu la yadhillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'O Allah, guidami tra coloro che hai guidato, concedimi salute tra coloro a cui hai concesso salute, prendimi sotto la Tua protezione tra coloro che proteggi, benedicimi in ciò che mi hai donato e proteggimi dal male di ciò che hai decretato. Poiché Tu solo decreti e nessuno decreta su di Te. In verità, non sarà umiliato chi hai preso come alleato, né sarà onorato chi hai preso come nemico. Tu sei Benedetto, Signor nostro, ed Eccelso! A Te sia la lode per tutto ciò che hai decretato. Ti chiedo perdono e a Te mi pento. E la pace e la benedizione di Allah siano sul nostro maestro Muhammad, sulla sua famiglia e sui suoi compagni.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'Nella scuola sciafeita, recitare il Qunut dopo il ruku nell\'ultimo rakat del Vitr durante la seconda metà del Ramadan è Sunnah.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1ª Prostrazione',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Seduta',
      action: 'Siediti.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2ª Prostrazione',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Seduta Finale',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Recita At-Tahiyyat, Salli, Barik e Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Destra)',
      action: 'Dai il Salaam a destra.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Sinistra)',
      action: 'Dai il Salaam a sinistra per completare la preghiera.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Vitir (2+1 Rakat)',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildBayram(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intenzione (Niyyah)',
      action: 'Intendo pregare la preghiera dell\'Eid di oggi per amore di Allah, seguendo l\'Imam presente.',
      imageKey: '${gender.name}_niyet',
      note: 'Le preghiere dell\'Eid al-Fitr e dell\'Eid al-Adha si eseguono esattamente allo stesso modo.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir di Apertura',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Supplica di Apertura',
      action: mezhep == Mezhep.shafii
          ? 'Recita la dua Veccehtu.'
          : 'Recita la dua Subhanaka.',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Takbir Aggiuntivi (7 Volte)',
        action: 'Alza le mani fino alle spalle e di\' "Allahu Akbar" 7 volte. Unisci le mani dopo ogni takbir. Recita "Subhanallahi wal-hamdulillah..." tra l\'uno e l\'altro.',
        arabicText: 'اللهُ أَكْبَرُ (7 Volte)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Recitato prima di iniziare la Qira\'at nella scuola Shafi\'i.',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Takbir Aggiuntivi (3 Volte)',
        action: 'Alza le mani alle orecchie e di\' "Allahu Akbar" 3 volte. Rilascia le mani ai lati al 1° e 2° takbir, e uniscile al 3°.',
        arabicText: 'اللهُ أَكْبَرُ (3 Volte)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Wajib nella scuola Hanafi prima della Qira\'at.',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Qira\'at',
      action: 'Recita Fatiha e Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Takbir Aggiuntivi (5 Volte)',
        action: 'Recita "Allahu Akbar" 5 volte prima della Qira\'at, unendo le mani e recitando tasbih tra l\'uno e l\'altro.',
        arabicText: 'اللهُ أَكْبَرُ (5 Volte)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Qira\'at',
        action: 'Recita Fatiha e Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Qira\'at',
        action: 'Recita Fatiha e Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Takbir Aggiuntivi (3 Volte)',
        action: 'Dopo che la Qira\'at è completata e prima di andare in Rukû, alza le mani alle orecchie 3 volte e di\' "Allahu Akbar", lasciandole pendere a ciascuno.',
        arabicText: 'اللهُ أَكْبَرُ (3 Volte)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Andare in Rukû',
        action: 'Di\' "Allahu Akbar" una 4ª volta e scendi in Rukû senza alzare le mani.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Risalita',
        action: 'Alzati dal Rukû.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 1ª Prostrazione',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Seduta',
        action: 'Siediti.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 2ª Prostrazione',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Seduta Finale',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Recita At-Tahiyyat, Salli, Barik e Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Destra)',
      action: 'Dai il Salaam a destra.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Sinistra)',
      action: 'Dai il Salaam a sinistra.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Preghiera dell\'Eid',
      rakatCount: 2,
      steps: steps,
    );
  }

  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intenzione (Niyyah)',
      action: 'Intendo pregare la preghiera funebre per amore di Allah, salawat per il Profeta e supplica per il defunto, seguendo l\'Imam presente.',
      imageKey: '${gender.name}_niyet',
      note: 'La preghiera funebre viene eseguita interamente in piedi. Non ha rükû o prostrazione.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1° Takbir',
      action: gender == Gender.male
          ? 'Alza le mani ai lobi delle orecchie, di\' "Allahu Akbar" e uniscile sotto l\'ombelico.'
          : 'Alza le mani al petto, di\' "Allahu Akbar" e uniscile sul petto.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Recitazione del 1° Takbir',
      action: mezhep == Mezhep.shafii
          ? 'Recita la Sura Fatiha silenziosamente.'
          : 'Recita Subhanaka con la frase "wa galla sanauka".',
      arabicText: mezhep == Mezhep.shafii ? 'Al-Fatiha' : 'Subhanaka (con wa galla sanauka)',
      imageKey: '${gender.name}_kiyam',
      note: 'La Fatiha è fard nella scuola Shafi\'i. In Hanafi, Subhanaka è la recitazione principale.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2° Takbir & Salawat',
      action: mezhep == Mezhep.shafii
          ? 'Alza le mani alle spalle, prendi il 2° takbir, uniscile di nuovo e recita Allahumma Salli e Barik.'
          : 'Prendi il 2° takbir senza alzare le mani, e recita Allahumma Salli e Barik.',
      arabicText: 'Allahumma Salli & Allahumma Barik',
      imageKey: '${gender.name}_kiyam',
      note: 'Alzare le mani in ogni takbir è sunnah nello Shafi\'i.',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3° Takbir & Dua Funebre',
      action: 'Prendi il 3° takbir. Recita la speciale supplica funebre per il defunto.',
      arabicText: 'Supplica Funebre',
      imageKey: '${gender.name}_kiyam',
      note: 'Si fanno preghiere sincere per il defunto.',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '4° Takbir',
      action: mezhep == Mezhep.shafii
          ? 'Prendi il 4° takbir, fai una breve pausa in piedi, poi rilascia le mani ai lati.'
          : 'Prendi il 4° takbir e rilascia le mani ai lati immediatamente.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah è il Più Grande.',
      imageKey: '${gender.name}_kiyam',
      note: 'Non viene letta alcuna supplica dopo il 4° takbir, procedi direttamente al Salaam.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Destra)',
      action: 'Dai il Salaam a destra in piedi.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'As-salamu \'alaykum wa rahmatullah.',
      translation: 'La pace e la misericordia di Allah siano su di voi.',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Sinistra)',
      action: 'Dai il Salaam a sinistra per completare la preghiera funebre.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'As-salamu \'alaykum wa rahmatullah.',
      translation: 'La pace e la misericordia di Allah siano su di voi.',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'Preghiera Funebre',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Rukû',
      action: 'Vai in Rukû.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Risalita',
      action: 'Alzati dal Rukû.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 1ª Prostrazione',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Seduta',
      action: 'Siediti tra le prostrazioni.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 2ª Prostrazione',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPERS ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'Fai l\'intenzione: "Intendo eseguire la preghiera ${time.name} di oggi ($partName) per amore di Allah."';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Alza le mani finché i pollici non toccano i lobi delle orecchie, con i palmi rivolti verso la Qibla. Di\' "Allahu Akbar" e uniscile sotto l\'ombelico.';
      } else {
        return 'Alza le mani all\'altezza delle spalle con i palmi rivolti verso la Qibla. Di\' "Allahu Akbar" e uniscile sotto il petto (o lasciale pendere in Maliki).';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'Alza le mani all\'altezza del petto con i palmi rivolti verso la Qibla. Di\' "Allahu Akbar" e uniscile sul petto, la mano destra sopra la sinistra.';
      } else {
        return 'Alza le mani all\'altezza delle spalle, di\' "Allahu Akbar" e uniscile sul petto.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'Nello Shafi\'i, alzare le mani all\'altezza delle spalle durante il Takbir è sunnah. I palmi devono essere rivolti verso la Qibla.';
    }
    return 'Gli uomini alzano le mani alle orecchie, le donne all\'altezza del petto.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Stai dritto. Unisci le mani sotto l\'ombelico, la mano destra che afferra il polso sinistro. Tieni gli occhi sul punto di prostrazione.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Stai dritto. Unisci le mani sotto il petto, sopra l\'ombelico (all\'altezza del cuore).';
      } else {
        structure = 'Stai dritto con le braccia pendenti ai lati (Sadl), o uniscile sotto il petto.';
      }
    } else {
      structure = 'Stai dritta. Posiziona la mano destra sulla sinistra sul petto, senza afferrare. Tieni gli occhi sul punto di prostrazione.';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nRecita la supplica di apertura (Veccehtu). Di\' Euzü-Besmele e recita la Fatiha, poi recita una Sura aggiuntiva.';
      } else if (mezhep == Mezhep.maliki) {
        return '$structure\nRecita la Fatiha direttamente senza Subhanaka o Euzü-Besmele (nelle preghiere fard). Poi recita una Sura aggiuntiva.';
      } else {
        return '$structure\nRecita Subhanaka. Di\' Euzü-Besmele e recita la Fatiha, poi recita una Sura aggiuntiva (Zamm-ı Surah).';
      }
    } else if (rekat == 2) {
      if (mezhep == Mezhep.maliki) {
        return '$structure\nRecita direttamente la Fatiha e una Sura aggiuntiva.';
      }
      return '$structure\nDi\' Besmele e recita la Fatiha e una Sura aggiuntiva.';
    } else {
      if (isFarz) {
        if (mezhep == Mezhep.maliki) {
          return '$structure\nRecita solo la Sura Fatiha. Nessuna Sura aggiuntiva viene recitata.';
        }
        return '$structure\nDi\' Besmele e recita solo la Sura Fatiha. Nessuna Sura aggiuntiva viene recitata.';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
            return '$structure\nNel 3° rakat di queste Sunnah, recita prima Subhanaka, poi Fatiha e una Sura.';
          } else {
            return '$structure\nNel 3° rakat, di\' Besmele e recita Fatiha e una Sura.';
          }
        }
        if (mezhep == Mezhep.maliki) {
          return '$structure\nRecita Fatiha e una Sura aggiuntiva.';
        }
        return '$structure\nDi\' Besmele e recita Fatiha e una Sura aggiuntiva.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('Prima Sunnah') || partName.contains('First Sunnah')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3;
      } else if (partName.contains('Fard')) {
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
        arabic.writeln('[SUPPLICA DI APERTURA SHAFI\'I (VECCEHTÜ)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Supplica di Apertura Shafi\'i (Veccehtü)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfan wama ana minal-mushrikîn. Inna salâtî wa nusukî wa mahyâya wa mamâtî lillâhi rabbil\'âlamîn. Lâ sharîka lahû wa bidhâlika umirtu wa ana minal-muslimîn.');
        translation.writeln('[Traduzione della Supplica di Apertura Shafi\'i]');
        translation.writeln('In verità, ho rivolto il mio volto verso Colui che ha creato i cieli e la terra, incline alla verità, e non sono tra coloro che associano ad Allah. In verità, la mia preghiera, i miei riti, la mia vita e la mia morte sono per Allah, Signore dei mondi. Non ha associati. Questo mi è stato ordinato, e io sono tra i musulmani.');
      } else {
        arabic.writeln('[SUPPLICA SUBHANAKA]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Supplica Subhanaka]');
        transcription.writeln('Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala giadduka. Wa la ilaha ghairuk.');
        translation.writeln('[Traduzione della Supplica Subhanaka]');
        translation.writeln('Gloria a Te, o Allah, e ogni lode. Benedetto è il Tuo nome, ed esaltata è la Tua maestà. Non c\'è divinità degna di adorazione all\'infuori di Te.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[SURA AL-FATIHA]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْmِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[Al-Fatiha]');
    transcription.writeln('Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yaumid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alaihim, ghairil-maghdubi \'alaihim walad-dallin.');
    translation.writeln('[Traduzione Al-Fatiha]');
    translation.writeln('In nome di Allah, il Compassionevole, il Misericordioso. La lode appartiene ad Allah, Signore dei mondi. Il Compassionevole, il Misericordioso. Re del Giorno del Giudizio. Te noi adoriamo e a Te chiediamo aiuto. Guidaci sulla retta via. La via di coloro che hai colmato di grazia, non di coloro che sono incorsi nella Tua ira, né degli sviati.');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[SURA AGGIUNTIVA (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Sura ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[Traduzione ${zamm.name}]');
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
      return 'Nello Shafi\'i, recita Veccehtu invece di Subhanaka nel 1° rakat. Recita la Basmala ad alta voce nelle preghiere recitate ad alta voce.';
    }
    return 'Qiyam è la posizione eretta. Mantenere gli occhi sul punto di prostrazione è altamente raccomandato per la concentrazione.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Alza le mani all\'altezza delle spalle quando ti alzi (Raf\'ul Yadeyn).';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' Nello Shafi\'i, recita la supplica del Qunut in piedi nel 2° rakat del Fajr.';
    }
    return note.isNotEmpty ? note : 'Alzati e fai una breve pausa per essere completamente fermo.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Scendi in prostrazione (Sujud). Fronte e naso toccano terra. I piedi rimangono dritti con le dita rivolte verso la Qibla. Tieni i gomiti sollevati da terra e lontani dai fianchi, e l\'addome lontano dalle cosce.';
    } else {
      return 'Scendi in prostrazione. Fronte e naso toccano terra. Tieni i gomiti vicini al corpo e appoggiati a terra, con l\'addome vicino alle cosce (postura contratta).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'Nella seduta finale, siediti sull\'anca sinistra con il piede sinistro che esce sotto la gamba destra (Tawarruk). Le mani riposano sulle ginocchia.';
      }
      return 'Siediti sul piede sinistro, mantenendo il piede destro dritto con le dita rivolte verso la Qibla (Iftirish). Le mani riposano sulle ginocchia.';
    } else {
      return 'In entrambe le sedute, siediti sull\'anca sinistra con i piedi che si estendono sul lato destro (Tawarruk). Le mani riposano sulle ginocchia con le dita unite.';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'Recita le suppliche di Tashahhud, Salli, Barik e Rabbana nella seduta finale.';
    }
    return 'Recita solo la supplica del Tashahhud (At-Tahiyyat) nella prima seduta.';
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
          name: 'Veccehtu',
          arabic: 'وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ. إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ. لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ.',
          transcription: 'Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfan wama ana minal-mushrikîn. Inna salâtî wa nusukî wa mahyâya wa mamâtî lillâhi rabbil\'âlamîn. Lâ sharîka lahû wa bidhâlika umirtu wa ana minal-muslimîn.',
          translation: 'In verità, ho rivolto il mio volto verso Colui che ha creato i cieli e la terra, incline alla verità, e non sono tra coloro che associano ad Allah. In verità, la mia preghiera, i miei riti, la mia vita e la mia morte sono per Allah, Signore dei mondi. Non ha associati. Questo mi è stato ordinato, e io sono tra i musulmani.',
          description: '',
        ));
      } else if (mezhep != Mezhep.maliki) {
        list.add(all.firstWhere((element) => element.audioFileName == 'subhaneke.mp3'));
      }
    } else if (isIkindiYatsi && rekat == 3) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        list.add(all.firstWhere((element) => element.audioFileName == 'subhaneke.mp3'));
      }
    }

    list.add(all.firstWhere((element) => element.audioFileName == 'fatiha.mp3'));

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
