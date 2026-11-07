import '../models/prayer_models.dart';

class PrayerDatabaseDe {
  // --- SUREN UND BITTGEBETE ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Subhaneke',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa jalla sanauka (Nur im Totengebet). Wa la ilaha ghayruk.',
        translation: 'Ehre sei Dir, o Allah, und Lob sei Dir. Gesegnet ist Dein Name, und erhaben ist Deine Majestät. Ruhmvoll ist Dein Lob (Nur im Totengebet), und es gibt keinen Gott außer Dir.',
        description: 'Dies ist das Eröffnungsgebet, das in der ersten Raka des Gebets direkt nach dem Eröffnungs-Tekbir rezitiert wird.',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Al-Fatiha',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Alles Lob gebührt Allah, dem Herrn der Welten. Dem Allerbarmer, dem Barmherzigen. Dem Herrscher am Tage des Gerichts. Dir allein dienen wir, und Dich allein bitten wir um Hilfe. Führe uns den geraden Weg. Den Weg derer, denen Du Gnade erwiesen hast, nicht den Weg derer, die Deinen Zorn erregt haben, und nicht den Weg der Irregehenden.',
        description: 'Es ist die wichtigste Säule des Gebets und muss in jeder einzelnen Raka rezitiert werden.',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Al-Fil',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alam tara kayfa fa\'ala rabbuka bi-ashabil-fil. Alam yaj\'al kaydahum fi tadlil. Wa arsala \'alayhim tayran ababil. Tarmihim bi-hijaratin min sijjil. Faja\'alahum ka\'asfin ma\'kul.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Hast du nicht gesehen, wie dein Herr mit den Gefährten des Elefanten verfahren ist? Hat Er nicht ihre List misslingen lassen? Und Er sandte gegen sie Vögel in Scharen, die sie mit Steinen aus gebranntem Ton bewarfen. Und Er machte sie wie abgefressene Saat.',
        description: 'Eine der kurzen Suren, die als zusätzliche Sure (Zamm-i Sure) im Gebet rezitiert wird.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Quraisch',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Li-ilafi Quraysh. Ilafihim rihlatash-shitai was-sayf. Fal-ya\'budu Rabba hadhal-bayt. Alladhi at\'amahum min ju\'in wa-amanahum min khawf.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Für die Vereinigung der Quraisch. Ihre Vereinigung auf der Reise im Winter und im Sommer. So sollen sie dem Herrn dieses Hauses dienen, Der sie vor Hunger gespeist und vor Furcht gesichert hat.',
        description: 'Wird als zusätzliche Sure im Gebet rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Al-Ma\'un',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Ara-aytal-ladhi yukadhibu bid-din. Fadhanikal-ladhi yadu\'ul-yatim. Wa la yahuddu \'ala ta\'amil-miskin. Fawaylun lil-musallin. Aladhina hum \'an salatihim sahun. Aladhina hum yuraun. Wa yamna\'unal-ma\'un.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Hast du den gesehen, der das Gericht leugnet? Das ist derjenige, der die Waise abstößt und nicht zur Speisung des Armen antreibt. Wehe nun den Betenden, die auf ihr Gebet nicht achten, die sich nur zeigen wollen und die Hilfeleistung verweigern.',
        description: 'Wird als zusätzliche Sure im Gebet rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Al-Kauthar',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahir-rahmanir-rahim. Inna a\'taynakal-kawthar. Fa-salli li-Rabbika wanhar. Inna shani-aka huwal-abtar.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Wahrlich, Wir haben dir den Überfluss gegeben. So bete zu deinem Herrn und opfere. Gewiss, derjenige, der dich hasst, ist vom Segen abgeschnitten.',
        description: 'Die kürzeste Sure im Heiligen Koran.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Al-Kafirun',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul ya-ayyuhal-kafirun. La a\'budu ma ta\'budun. Wa la antum \'abiduna ma a\'bud. Wa la ana \'abidun ma \'abadtum. Wa la antum \'abiduna ma a\'bud. Lakum dinukum wa-liya din.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Sprich: O ihr Ungläubigen! Ich diene nicht dem, dem ihr dient. Und ihr dient nicht Dem, Dem ich diene. Und ich werde nicht dem dienen, dem ihr gedient habt. Und ihr werdet nicht Dem dienen, Dem ich diene. Euch eure Religion und mir meine Religion.',
        description: 'Wird als zusätzliche Sure im Gebet rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'An-Nasr',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahir-rahmanir-rahim. Idha jaa nasrullahi wal-fath. Wa ra-aytannasa yadkhuluna fi dinillahi afwaja. Fa-sabbih bihamdi Rabbika wastaghfirh. Innahu kana tawwaba.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Wenn die Hilfe Allahs kommt und der Sieg, und du die Menschen in Scharen in die Religion Allahs eintreten siehst, dann lobpreise deinen Herrn und bitte Ihn um Vergebung. Gewiss, Er ist Reue-Annehmend.',
        description: 'Wird als zusätzliche Sure im Gebet rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Al-Masad',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Tabbat yada Abi Lahabin watabb. Ma aghna \'anhu maluhu wama kasab. Sayasla naran dhata lahab. Wamra-atuhu hammalatal-hatab. Fi jidiha hablun min masad.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Zugrunde gehen sollen die Hände von Abu Lahab, und zugrunde gegangen ist er! Nichts nützte ihm sein Besitz und das, was er erworben hat. Er wird in einem lodernden Feuer brennen, und seine Frau, die Holzträgerin, um ihren Hals ist ein Seil aus Palmfasern.',
        description: 'Wird als Suren-Rezitation im Gebet verwendet.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'Al-Ichlas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul huwallahu ahad. Allahus-samad. Lem yelid wa lem yuled. Wa lem yakun lahu kufuwan ahad.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Sprich: Er ist Allah, der Einzige. Allah, der Überlegene. Er zeugt nicht und wurde nicht gezeugt. Und niemand ist Ihm ebenbürtig.',
        description: 'Die Kern-Sure, die den islamischen Monotheismus (Tawhid) definiert.',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Al-Falaq',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbil-falak. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharri-naffathati fil-\'uqad. Wa min sharri hasidin idha hasad.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Sprich: Ich suche Zuflucht beim Herrn des Anbruchs des Morgens, vor dem Übel dessen, was Er erschaffen hat, und vor dem Übel der Dunkelheit, wenn sie hereinbricht, und vor dem Übel derer, die auf Knoten blasen, und vor dem Übel des Neiders, wenn er neidet.',
        description: 'Wird rezitiert, um Schutz vor dem Bösen zu suchen.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'An-Nas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbinnas. Melikinnas. Ilahinnas. Min sharril-waswasil-khannas. Alladhi yuwaswisu fi sudurinnas. Minal-jinnati wannas.',
        translation: 'Im Namen Allahs, des Allerbarmers, des Barmherzigen. Sprich: Ich suche Zuflucht beim Herrn der Menschen, dem König der Menschen, dem Gott der Menschen, vor dem Übel des einflüsternden Verführers, der in die Brüste der Menschen einflüstert, sei es unter den Dschinn oder den Menschen.',
        description: 'Wird rezitiert, um Schutz vor Einflüsterungen zu suchen.',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Ettehiyyatu',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'At-tahiyyatu lillahi was-salawatu wat-tayyibat. As-salamu \'alayka ayyuhan-nabiyyu wa rahmatullahi wa barakatuh. As-salamu \'alayna wa \'ala \'ibadillahis-salihin. Ashhadu an la ilaha illallahu wa ashhadu anna Muhammadan \'abduhu wa rasuluh.',
        translation: 'Alle Ehrenbezeugungen, Gebete und guten Taten gebühren Allah. Friede sei mit dir, o Prophet, und die Barmherzigkeit Allahs und Seine Segnungen. Friede sei mit uns und mit den rechtschaffenen Dienern Allahs. Ich bezeuge, dass es keinen Gott gibt außer Allah, und ich bezeuge, dass Muhammad Sein Diener und Sein Gesandter ist.',
        description: 'Wird in der sitzenden Haltung jedes Gebets rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahumma Salli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma salli \'ala Muhammadin wa \'ala ali Muhammad. Kama sallayta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'O Allah, schenke Segen über Muhammad und über die Familie von Muhammad, so wie Du Segen geschenkt hast über Abraham und über die Familie von Abraham. Wahrlich, Du bist Lobenswert, Ruhmvoll.',
        description: 'Wird in der letzten sitzenden Haltung des Gebets rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahumma Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma barik \'ala Muhammadin wa \'ala ali Muhammad. Kama barakta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'O Allah, segne Muhammad und die Familie von Muhammad, so wie Du Abraham und die Familie von Abraham gesegnet hast. Wahrlich, Du bist Lobenswert, Ruhmvoll.',
        description: 'Wird in der letzten sitzenden Haltung des Gebets rezitiert.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbana',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbana atina fid-dunya hasanaten wa fil-akhirati hasanaten waqina \'adhaban-nar. Rabbanaghfir li wa li-walidayya wa lil-mu\'minina yawma yaqumul-hisab.',
        translation: 'Unser Herr, gib uns im Diesseits Gutes und im Jenseits Gutes, und bewahre uns vor der Strafe des Feuers. Unser Herr, vergib mir und meinen Eltern und den Gläubigen an dem Tag, an dem die Abrechnung stattfindet.',
        description: 'Wird ganz am Ende des letzten Sitzens vor dem abschließenden Friedensgruß rezitiert.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Qunut 1 (Hanafi)',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
        translation: 'O Allah! Wir bitten Dich um Hilfe, bitten Dich um Vergebung und bitten Dich um Rechtleitung. Wir glauben an Dich, bereuen vor Dir und vertrauen auf Dich. Wir preisen Dich für alles Gute, danken Dir und sind Dir nicht undankbar, und wir verlassen und meiden jeden, der Dir ungehorsam ist.',
        description: 'Wird in der 3. Raka des Vitr-Gebets in der Hanafi-Rechtsschule vor dem Ruku rezitiert.',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Qunut 2 (Hanafi)',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
        translation: 'O Allah! Dir allein dienen wir, zu Dir beten wir und vor Dir werfen wir uns nieder. Zu Dir eilen und streben wir. Wir hoffen auf Deine Barmherzigkeit und fürchten Deine Strafe. Gewiss wird Deine Strafe die Ungläubigen ereilen.',
        description: 'Wird in der 3. Raka des Vitr-Gebets in der Hanafi-Rechtsschule direkt nach dem ersten Qunut rezitiert.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Qunut (Schafii)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
        translation: 'O Allah, leite mich recht unter denen, die Du rechtgeleitet hast. Schenke mir Wohlbefinden unter denen, denen Du Wohlbefinden geschenkt hast. Nimm mich als Freund unter denen, die Du als Freunde genommen hast. Segne mir das, was Du mir gegeben hast. Bewahre mich vor dem Übel dessen, was Du bestimmt hast, denn gewiss bestimmst Du und niemand bestimmt über Dich. Wahrlich, wer Dein Freund ist, wird niemals erniedrigt, und wer Dein Feind ist, wird niemals geehrt. Segensreich bist Du, unser Herr, und Erhaben. Alles Lob gebührt Dir für das, was Du bestimmt hast. Ich bitte Dich um Vergebung und bereue vor Dir. Der Segen und Friede Allahs seien auf unserem Propheten Muhammad, seiner Familie und seinen Gefährten.',
        description: 'Wird in der 2. Raka des Morgengebets (Fajr) nach dem Aufrichten aus dem Ruku in der Schafi\'i-Rechtsschule und in der zweiten Hälfte des Ramadan im Vitr rezitiert.',
      ),
    ];
  }

  // --- WUDU (ABDEST) SCHRITTE ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Absicht und Basmala',
      action: 'Fassen Sie die Absicht im Herzen: "Ich beabsichtige, Wudu für Allah zu verrichten" und sagen Sie "Bismillahir-rahmanir-rahim".',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Waschen der Hände',
      action: 'Waschen Sie die Hände dreimal bis zu den Handgelenken und reiben Sie zwischen den Fingern. Ringe sollten bewegt werden, damit Wasser darunter fließt.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Ausspülen des Mundes',
      action: 'Spülen Sie den Mund dreimal mit Wasser aus, das Sie mit der rechten Hand zuführen.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Ausspülen der Nase',
      action: 'Ziehen Sie dreimal Wasser mit der rechten Hand in die Nase und schnäuzen Sie es mit der linken Hand aus.',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Waschen des Gesichts',
      action: 'Waschen Sie das gesamte Gesicht dreimal vom Haaransatz an der Stirn bis unter das Kinn und von Ohr zu Ohr. (Bei den Schafi\'iten muss die Absicht genau beim Beginn des Gesichtwaschens gefasst werden).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Waschen der Arme',
      action: 'Waschen Sie zuerst den rechten, dann den linken Arm bis einschließlich der Ellbogen dreimal. Stellen Sie sicher, dass keine trockene Stelle verbleibt.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Streichen über den Kopf (Mesh)',
      action: 'Befeuchten Sie die Hände und streichen Sie über mindestens ein Viertel des Kopfes. (Bei den Schafi\'iten genügt das Befeuchten einiger weniger Haare).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Waschen der Ohren',
      action: 'Wischen Sie das Innere der Ohren mit den Zeigefingern und die Rückseite mit den Daumen ab.',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Streichen über den Nacken',
        action: 'Wischen Sie mit der Rückseite der feuchten Finger über den Nacken (wird in der Schafi\'i-Rechtsschule nicht empfohlen).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Waschen der Füße',
      action: 'Waschen Sie zuerst den rechten, dann den linken Fuß dreimal bis einschließlich der Knöchel. Reinigen Sie gründlich zwischen den Zehen.',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- DINAMISCHE GEBETS-SCHRITTE ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 Raka Sunna', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 Raka Fard', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 Raka Erste Sunna', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Raka Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Raka Letzte Sunna', 2, false, time));
        break;
      case PrayerTime.ikindi:
        parts.add(_buildPart(mezhep, gender, '4 Raka Sunna', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Raka Fard', 4, true, time));
        break;
      case PrayerTime.aksam:
        parts.add(_buildPart(mezhep, gender, '3 Raka Fard', 3, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Raka Sunna', 2, false, time));
        break;
      case PrayerTime.yatsi:
        parts.add(_buildPart(mezhep, gender, '4 Raka Erste Sunna', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Raka Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Raka Letzte Sunna', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Raka Erste Sunna', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Raka Fard (Gemeinschaft)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Raka Letzte Sunna', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Raka Erste Sunna', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Raka Fard (Gemeinschaft)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Raka Letzte Sunna', 2, false, time));
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
      case PrayerTime.sabah: return 'Das Sabah-Gebet besteht aus 2 Raka Sunna und 2 Raka Fard.';
      case PrayerTime.ogle: return 'Das Ogle-Gebet besteht aus 4 ersten Sunna, 4 Fard und 2 letzten Sunna Raka.';
      case PrayerTime.ikindi: return 'Das Ikindi-Gebet besteht aus 4 Sunna und 4 Fard Raka.';
      case PrayerTime.aksam: return 'Das Aksam-Gebet besteht aus 3 Fard und 2 Sunna Raka.';
      case PrayerTime.yatsi: return 'Das Yatsi-Gebet besteht aus 4 ersten Sunna, 4 Fard, 2 letzten Sunna und Vitr.';
      case PrayerTime.cuma: return 'Das Freitagsgebet wird am Freitag zur Mittagszeit in der Moschee verrichtet.';
      case PrayerTime.bayram: return 'Das Festgebet besteht aus 2 Raka mit zusätzlichen Tekbiren am Festmorgen.';
      case PrayerTime.cenaze: return 'Das Totengebet wird im Stehen als Fürbitte für den Verstorbenen verrichtet.';
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
      title: 'Absicht (Niyyah)',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'Die Absicht im Herzen zu fassen ist Pflicht. Das Aussprechen mit der Zunge ist Sunna.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Eröffnungs-Tekbir',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah ist am größten.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: _getTekbirNote(mezhep, gender),
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka $rekat - Stehen (Qiyam)',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka $rekat - Rukû',
        action: gender == Gender.male
            ? 'Beugen Sie den Oberkörper vor, sodass der Rücken gerade ist. Greifen Sie die Knie mit gespreizten Fingern.'
            : 'Beugen Sie sich leicht vor. Legen Sie die Hände mit geschlossenen Fingern auf die Knie.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Mal)',
        transcription: 'Subhana Rabbiya\'l-\'Azim',
        translation: 'Lobpreis sei meinem Herrn, dem Allmächtigen.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Heben Sie die Hände beim Beugen zum Rukû und sagen Sie "Allahu Akbar".'
            : 'Gehen Sie ohne Heben der Hände mit dem Tekbir zum Rukû.',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka $rekat - Aufrichten (I\'tidal)',
        action: 'Richten Sie sich aus dem Rukû wieder völlig auf.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Sami\'allahu liman hamideh.\nRabbana laka\'l-hamd.',
        translation: 'Allah hört den, der Ihn lobt.\nUnser Herr, Lob gebührt Dir.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: '2. Raka - Qunut Bittgebet (Schafi\'i)',
          action: 'Nach dem Aufrichten aus dem Ruku werden die Hände auf Brusthöhe geöffnet und das Qunut-Bittgebet rezitiert (danach geht man in die Niederwerfung, ohne mit den Händen über das Gesicht zu streichen).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
          translation: 'O Allah, leite mich recht unter denen, die Du rechtgeleitet hast. Schenke mir Wohlbefinden unter denen, denen Du Wohlbefinden geschenkt hast. Nimm mich als Freund unter denen, die Du als Freunde genommen hast. Segne mir das, was Du mir gegeben hast. Bewahre mich vor dem Übel dessen, was Du bestimmt hast, denn gewiss bestimmst Du und niemand bestimmt über Dich. Wahrlich, wer Dein Freund ist, wird niemals erniedrigt, und wer Dein Feind ist, wird niemals geehrt. Segensreich bist Du, unser Herr, und Erhaben. Alles Lob gebührt Dir für das, was Du bestimmt hast. Ich bitte Dich um Vergebung und bereue vor Dir. Der Segen und Friede Allahs seien auf unserem Propheten Muhammad, seiner Familie und seinen Gefährten.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'In der Schafi\'i-Rechtsschule ist das Rezitieren des Qunut nach dem Ruku in der 2. Raka des Morgengebets (Fajr) eine bekräftigte Sunnah (Ab\'ad Sunnah).',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka $rekat - 1. Secde',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Mal)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Lobpreis sei meinem Herrn, dem Allerhöchsten.',
        imageKey: '${gender.name}_secde',
        note: 'Berühren Sie zuerst die Knie, dann die Hände, dann Stirn und Nase auf dem Boden.',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka $rekat - Sitzen (Celse)',
        action: gender == Gender.male
            ? 'Setzen Sie sich auf den linken Fuß und halten Sie den rechten Fuß aufrecht.'
            : 'Setzen Sie sich auf das linke Gesäß (Tawarruk). Hände ruhen auf den Oberschenkeln.',
        imageKey: '${gender.name}_celse',
        note: 'Kurzes Verweilen zwischen den beiden Niederwerfungen ist Pflicht.',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka $rekat - 2. Secde',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Mal)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Lobpreis sei meinem Herrn, dem Allerhöchsten.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Letztes Sitzen',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Rezitiere At-Tahiyyat, Allahumma Salli, Barik und Rabbana.',
          transcription: 'Teşehhüd-Gebete nacheinander lesen.',
          translation: 'Sie können auf die Volltexte im Menü Bittgebete zugreifen.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salam (Rechts)',
          action: 'Drehen Sie den Kopf nach rechts und sagen Sie "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Friede sei mit euch und die Barmherzigkeit Allahs.',
          imageKey: '${gender.name}_selam',
          note: 'Schauen Sie zur Schulter. Rechts grüßen ist im Schafi\'i Pflicht.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salam (Links)',
          action: 'Drehen Sie den Kopf nach links und sagen Sie "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Friede sei mit euch und die Barmherzigkeit Allahs.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Gebet mit dem Gruß nach links abschließen.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Erstes Sitzen',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Rezitiere At-Tahiyyat.',
          transcription: 'At-tahiyyatu lillahi...',
          translation: 'Nur das At-Tahiyyat-Gebet wird gelesen.',
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
      title: 'Absicht (Niyyah)',
      action: 'Ich beabsichtige, das heutige 3-Raka-Vitr-Gebet für Allah zu verrichten.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Eröffnungs-Tekbir',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 1 - Stehen & Rezitation',
      action: 'Rezitiere Subhanaka, Fatiha und eine zusätzliche Sure.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 2 - Stehen & Rezitation',
      action: 'Rezitiere Fatiha und eine zusätzliche Sure.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 2 - Erstes Sitzen',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Rezitiere At-Tahiyyat und stehe wieder auf.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Stehen (Vor Qunut)',
      action: 'Hände falten. Rezitiere Fatiha und eine Sure. Nach der Sure Hände lösen.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Qunut Tekbir',
      action: gender == Gender.male
          ? 'Hände zu den Ohren heben, "Allahu Akbar" sagen und wieder unter dem Bauchnabel falten.'
          : 'Hände zur Brust heben, "Allahu Akbar" sagen und wieder auf der Brust falten.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Spezifisch für die Hanafi-Schule vor dem Qunut-Gebet.',
    ));

    // Qunut 1 Bittgebet
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Qunut 1 Bittgebet',
      action: 'Rezitiere das erste Qunut-Bittgebet mit gefalteten Händen.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
      translation: 'O Allah! Wir bitten Dich um Hilfe, bitten Dich um Vergebung und bitten Dich um Rechtleitung. Wir glauben an Dich, bereuen vor Dir und vertrauen auf Dich. Wir preisen Dich für alles Gute, danken Dir und sind Dir nicht undankbar, und wir verlassen und meiden jeden, der Dir ungehorsam ist.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Qunut 2 Bittgebet
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Qunut 2 Bittgebet',
      action: 'Direkt nach Qunut 1 wird das zweite Qunut-Bittgebet mit gefalteten Händen rezitiert.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
      translation: 'O Allah! Dir allein dienen wir, zu Dir beten wir und vor Dir werfen wir uns nieder. Zu Dir eilen und streben wir. Wir hoffen auf Deine Barmherzigkeit und fürchten Deine Strafe. Gewiss wird Deine Strafe die Ungläubigen ereilen.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Rukû',
      action: 'Gehen Sie zum Rukû.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Mal)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Aufrichten',
      action: 'Aufrichten aus dem Rukû.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - 1. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Sitzen',
      action: 'Sitzen.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - 2. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Letztes Sitzen',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Rezitiere At-Tahiyyat, Salli, Barik und Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Rechts)',
      action: 'Geben Sie rechts den Friedensgruß.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Links)',
      action: 'Geben Sie links den Friedensgruß zum Abschluss.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: '3 Raka Vitr Wajib',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildVitirOther(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Absicht (Niyyah)',
      action: 'Ich beabsichtige, das Vitr-Gebet für Allah zu verrichten.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Eröffnungs-Tekbir',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 1 - Stehen & Rezitation',
      action: 'Rezitiere das Eröffnungsgebet, Fatiha und Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 2 - Stehen & Rezitation',
      action: 'Rezitiere Fatiha und Al-Kafirun.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 2 - Sitzen und Friedensgruß',
      action: 'Sitzen, At-Tahiyyat, Salli, Barik lesen, rechts/links grüßen. Dann wieder aufstehen für das letzte 1 Raka.',
      imageKey: '${gender.name}_selam',
      note: 'In Schafi\'i, Maliki und Hanbali wird Vitr am besten als 2+1 verrichtet.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 (Einzeln) - Absicht & Tekbir',
      action: 'Absicht fassen für das letzte Raka von Vitr. Eröffnungs-Tekbir nehmen.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Stehen & Rezitation',
      action: 'Rezitiere Fatiha und Al-Ikhlas.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Rukû',
      action: 'Gehen Sie zum Rukû.',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Aufrichten (Kunut)',
      action: mezhep == Mezhep.shafii
          ? 'In der zweiten Hälfte des Ramadan nach dem Aufrichten aus dem Ruku die Hände heben und das Qunut-Bittgebet rezitieren.'
          : 'Aufrichten aus dem Rukû.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'O Allah, leite mich recht unter denen, die Du rechtgeleitet hast. Schenke mir Wohlbefinden unter denen, denen Du Wohlbefinden geschenkt hast. Nimm mich als Freund unter denen, die Du als Freunde genommen hast. Segne mir das, was Du mir gegeben hast. Bewahre mich vor dem Übel dessen, was Du bestimmt hast, denn gewiss bestimmst Du und niemand bestimmt über Dich. Wahrlich, wer Dein Freund ist, wird niemals erniedrigt, und wer Dein Feind ist, wird niemals geehrt. Segensreich bist Du, unser Herr, und Erhaben. Alles Lob gebührt Dir für das, was Du bestimmt hast. Ich bitte Dich um Vergebung und bereue vor Dir. Der Segen und Friede Allahs seien auf unserem Propheten Muhammad, seiner Familie und seinen Gefährten.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'In der Schafi\'i-Rechtsschule ist das Rezitieren des Qunut nach dem Ruku in der letzten Raka des Vitr in der zweiten Hälfte des Ramadan Sunnah.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - 1. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - Sitzen',
      action: 'Sitzen.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 3 - 2. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Letztes Sitzen',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Rezitiere At-Tahiyyat, Salli, Barik und Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Rechts)',
      action: 'Geben Sie rechts den Friedensgruß.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Links)',
      action: 'Geben Sie links den Friedensgruß.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Vitir (2+1 Raka)',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildBayram(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Absicht (Niyyah)',
      action: 'Ich beabsichtige, das heutige Festgebet (Bayram) für Allah zu verrichten, indem ich dem Imam folge.',
      imageKey: '${gender.name}_niyet',
      note: 'Das Ramazan- und Kurban-Festgebet werden exakt gleich verrichtet.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Eröffnungs-Tekbir',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 1 - Eröffnungsgebet',
      action: mezhep == Mezhep.shafii
          ? 'Rezitiere das Veccehtu-Gebet.'
          : 'Rezitiere das Subhanaka-Gebet.',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 1 - Zusätzliche Tekbire (7 Mal)',
        action: 'Heben Sie die Hände und sprechen Sie 7-mal "Allahu Akbar". Faltung der Hände nach jedem Tekbir.',
        arabicText: 'اللهُ أَكْبَرُ (7 Mal)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 1 - Zusätzliche Tekbire (3 Mal)',
        action: 'Heben Sie die Hände und sprechen Sie 3-mal "Allahu Akbar". Hände bei den ersten beiden hängen lassen, beim 3. falten.',
        arabicText: 'اللهُ أَكْبَرُ (3 Mal)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Raka 1 - Stehen & Rezitation',
      action: 'Rezitiere Fatiha und Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Zusätzliche Tekbire (5 Mal)',
        action: 'Klimmen zu Raka 2, vor Qira\'at 5-mal die Hände heben und "Allahu Akbar" rezitieren.',
        arabicText: 'اللهُ أَكْبَرُ (5 Mal)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Stehen & Rezitation',
        action: 'Rezitiere Fatiha und Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Stehen & Rezitation',
        action: 'Rezitiere Fatiha und Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Zusätzliche Tekbire (3 Mal)',
        action: 'Nach der Rezitation vor dem Rukû 3-mal die Hände heben und Tekbir sprechen, Hände hängen lassen.',
        arabicText: 'اللهُ أَكْبَرُ (3 Mal)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Gehen zum Rukû',
        action: 'Mit einem 4. Tekbir ohne Heben direkt zum Rukû beugen.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Aufrichten',
        action: 'Aufrichten.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - 1. Secde',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - Sitzen',
        action: 'Sitzen.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Raka 2 - 2. Secde',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Letztes Sitzen',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Rezitiere At-Tahiyyat, Salli, Barik und Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Rechts)',
      action: 'Geben Sie rechts den Friedensgruß.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Links)',
      action: 'Geben Sie links den Friedensgruß.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Festgebet',
      rakatCount: 2,
      steps: steps,
    );
  }

  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Absicht (Niyyah)',
      action: 'Ich beabsichtige, das Totengebet für Allah zu verrichten, Segen für den Propheten und Bittgebet für den Verstorbenen.',
      imageKey: '${gender.name}_niyet',
      note: 'Das Totengebet wird komplett im Stehen verrichtet. Es gibt keine Beugung oder Niederwerfung.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Tekbir',
      action: gender == Gender.male
          ? 'Hände zu den Ohren heben, "Allahu Akbar" sagen und unter dem Bauchnabel falten.'
          : 'Hände zur Brust heben, "Allahu Akbar" sagen und auf der Brust falten.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1. Tekbir Rezitation',
      action: mezhep == Mezhep.shafii
          ? 'Sorgfältig Fatiha-Sure lesen.'
          : 'Sübhaneke mit "ve celle senâük" lesen.',
      arabicText: mezhep == Mezhep.shafii ? 'Al-Fatiha' : 'Subhanaka (mit wa jalla sanauka)',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2. Tekbir & Segenswünsche',
      action: 'Tekbir nehmen. Rezitiere Allahumma Salli und Barik.',
      arabicText: 'Allahumma Salli & Allahumma Barik',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3. Tekbir & Totenbittgebet',
      action: '3. Tekbir nehmen. Rezitiere das Bittgebet für den Verstorbenen.',
      arabicText: 'Totenbittgebet',
      imageKey: '${gender.name}_kiyam',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '4. Tekbir',
      action: '4. Tekbir nehmen, kurz stehenbleiben, Hände an die Seiten sinken lassen.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Rechts)',
      action: 'Geben Sie im Stehen rechts den Friedensgruß.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Links)',
      action: 'Geben Sie links den Friedensgruß, um das Totengebet zu beenden.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'Totengebet',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Raka $rekat - Rukû',
      action: 'Gehen Sie zum Rukû.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Raka $rekat - Aufrichten',
      action: 'Aufrichten.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Raka $rekat - 1. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Raka $rekat - Sitzen',
      action: 'Sitzen.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Raka $rekat - 2. Secde',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPER ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'Fassen Sie die Absicht: "Ich beabsichtige, das heutige ${time.name}-Gebet ($partName) für Allah zu verrichten."';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Hände heben, sodass die Daumen die Ohrläppchen berühren. "Allahu Akbar" sagen und unter dem Bauchnabel falten.';
      } else {
        return 'Hände zu den Schultern heben. "Allahu Akbar" sagen und unter der Brust falten.';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'Hände zur Brust heben. "Allahu Akbar" sagen und auf der Brust falten.';
      } else {
        return 'Hände zu den Schultern heben, Tekbir nehmen und auf der Brust falten.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'Im Schafi\'i ist das Heben der Hände zu den Schultern beim Tekbir Sunna.';
    }
    return 'Männer heben die Hände zu den Ohren, Frauen zur Brust.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Gerade stehen. Hände unter dem Bauchnabel falten, rechte Hand über der linken. Blick auf den Secde-Punkt.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Gerade stehen. Hände über dem Bauchnabel, unter der Brust (Herzhöhe) falten.';
      } else {
        structure = 'Gerade stehen. Hände an den Seiten hängen lassen (Sadl) oder unter der Brust falten.';
      }
    } else {
      structure = 'Gerade stehen. Hände auf der Brust falten, rechte Hand über die linke legen. Blick zum Secde-Punkt.';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nRezitiere das Eröffnungsgebet (Veccehtu). Euzü-Besmele sagen, Fatiha laut rezitieren, dann eine zusätzliche Sure lesen.';
      }
      return '$structure\nRezitiere Subhanaka. Euzü-Besmele sagen, Fatiha und eine zusätzliche Sure (Zamm-ı Sure) lesen.';
    } else if (rekat == 2) {
      return '$structure\nBesmele sagen, Fatiha und eine zusätzliche Sure lesen.';
    } else {
      if (isFarz) {
        return '$structure\nBesmele sagen und nur Fatiha lesen. Keine zusätzliche Sure.';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          return '$structure\nIn der 3. Raka dieser Sunnas zuerst Subhanaka, dann Fatiha und eine Sure lesen.';
        }
        return '$structure\nBesmele sagen, Fatiha und eine zusätzliche Sure lesen.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('First Sunnah') || partName.contains('İlk Sünnet')) {
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
        arabic.writeln('[SCHAFI\'I ERÖFFNUNGSGEBET (VECCEHTÜ)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Schafi\'i Eröffnungsgebet (Veccehtü)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.');
        translation.writeln('[Schafi\'i Eröffnungsgebet Übersetzung]');
        translation.writeln('Gewiss habe ich mein Gesicht Dem zugewandt, Der die Himmel und die Erde erschaffen hat, als Reingläubiger, und ich gehöre nicht zu den Polytheisten. Gewiss, mein Gebet, meine Opferhandlungen, mein Leben und mein Sterben gehören Allah, dem Herrn der Welten. Er hat keinen Teilhaber. Und dies ist mir befohlen worden, und ich gehöre zu den Muslimen.');
      } else {
        arabic.writeln('[SUBHANAKA GEBET]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Subhanaka Gebet]');
        transcription.writeln('Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa la ilaha ghayruk.');
        translation.writeln('[Subhanaka Übersetzung]');
        translation.writeln('Ehre sei Dir, o Allah, und Lob sei Dir. Gesegnet ist Dein Name, und erhaben ist Deine Majestät. Es gibt keinen Gott außer Dir.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[AL-FATIHA SURE]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْمِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[Al-Fatiha]');
    transcription.writeln('Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.');
    translation.writeln('[Al-Fatiha Übersetzung]');
    translation.writeln('Im Namen Allahs, des Allerbarmers, des Barmherzigen. Alles Lob gebührt Allah, dem Herrn der Welten. Dem Allerbarmer, dem Barmherzigen. Dem Herrscher am Tage des Gerichts. Dir allein dienen wir, und Dich allein bitten wir um Hilfe. Führe uns den geraden Weg. Den Weg derer, denen Du Gnade erwiesen hast, nicht den Weg derer, die Deinen Zorn erregt haben, und nicht den Weg der Irregehenden.');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[ZUSÄTZLICHE SURE (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Sure ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[${zamm.name} Übersetzung]');
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
      return 'Im Schafi\'i wird im 1. Raka Veccehtu statt Subhanaka gelesen. Basmala laut aussprechen.';
    }
    return 'Qiyam ist Stehen. Augen auf den Secde-Punkt richten wird für die Konzentration empfohlen.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Hände beim Aufrichten zu den Schultern heben.';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' Im Schafi\'i das Qunut-Gebet im Stehen im 2. Raka verlesen.';
    }
    return note.isNotEmpty ? note : 'Kurz ruhig stehen bleiben, um zur Ruhe zu kommen.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Niederwerfung (Sujud). Stirn und Nase berühren den Boden. Zehen zeigen zur Qibla. Ellbogen vom Boden abheben und vom Körper wegspreizen.';
    } else {
      return 'Niederwerfung. Stirn und Nase berühren den Boden. Ellbogen liegen am Boden an und berühren den Körper (kompakte Haltung).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'Im letzten Sitzen auf dem linken Gesäß sitzen, der linke Fuß schlüpft unter dem rechten Bein hervor (Tawarruk).';
      }
      return 'Auf dem linken Fuß sitzen, den rechten Fuß aufrecht halten (Iftirish). Hände liegen auf den Oberschenkeln.';
    } else {
      return 'In beiden Sitzen auf dem linken Gesäß sitzen, die Füße nach rechts legen (Tawarruk).';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'At-Tahiyyat, Salli, Barik und Rabbana Bittgebete rezitieren.';
    }
    return 'Nur At-Tahiyyat im ersten Sitzen rezitieren.';
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
          name: 'Wedschah-tu',
          arabic: 'وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ. إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ. لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ.',
          transcription: 'Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.',
          translation: 'Gewiss habe ich mein Gesicht Dem zugewandt, Der die Himmel und die Erde erschaffen hat, als Reingläubiger, und ich gehöre nicht zu den Polytheisten. Gewiss, mein Gebet, meine Opferhandlungen, mein Leben und mein Sterben gehören Allah, dem Herrn der Welten. Er hat keinen Teilhaber. Und dies ist mir befohlen worden, und ich gehöre zu den Muslimen.',
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
