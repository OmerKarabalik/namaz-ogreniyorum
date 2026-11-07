import '../models/prayer_models.dart';

class PrayerDatabaseEs {
  // --- SURAS Y SUPLICAS ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Subhaneke',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa jalla sanauka (Solo en la oración fúnebre). Wa la ilaha ghayruk.',
        translation: '¡Gloria a Ti, oh Allah, y alabado seas! Bendito sea Tu nombre, y exaltada sea Tu majestad. Gloriosa es Tu alabanza (Solo en la oración fúnebre), y no hay más divinidad digna de adoración excepto Tú.',
        description: 'Esta es la súplica de apertura que se recita en la primera rakat de las oraciones, inmediatamente después del tekbir de apertura.',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Al-Fatiha',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Alabado sea Allah, Señor de los mundos. El Clemente, el Misericordioso. Soberano del Día del Juicio. Solo a Ti te adoramos y solo a Ti te pedimos ayuda. Guíanos por el camino recto. El camino de los que has colmado con Tus favores, no el de los que han incurrido en Tu ira, ni el de los extraviados.',
        description: 'Es el pilar fundamental del rezo, obligatorio de recitar en cada rakat.',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Al-Fil',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alam tara kayfa fa\'ala rabbuka bi-ashabil-fil. Alam yaj\'al kaydahum fi tadlil. Wa arsala \'alayhim tayran ababil. Tarmihim bi-hijaratin min sijjil. Faja\'alahum ka\'asfin ma\'kul.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. ¿Acaso no has visto cómo procedió tu Señor con la gente del elefante? ¿Acaso no desbarató sus planes y envió contra ellos bandadas de aves que les lanzaban piedras de arcilla dura, dejándolos como pasto devorado?',
        description: 'Una de las suras cortas que se recita como sura adicional (zamm-i surah) en los rezos.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Quraysh',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Li-ilafi Quraysh. Ilafihim rihlatash-shitai was-sayf. Fal-ya\'budu Rabba hadhal-bayt. Alladhi at\'amahum min ju\'in wa-amanahum min khawf.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Por la unión de los Quraish. Su unión en el viaje de invierno y verano. ¡Que adoren al Señor de esta Casa (la Kaaba)! Quien los alimentó contra el hambre y los protegió del temor.',
        description: 'Se recita como sura adicional en los rezos.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Al-Ma\'un',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Ara-aytal-ladhi yukadhibu bid-din. Fadhanikal-ladhi yadu\'ul-yatim. Wa la yahuddu \'ala ta\'amil-miskin. Fawaylun lil-musallin. Aladhina hum \'an salatihim sahun. Aladhina hum yuraun. Wa yamna\'unal-ma\'un.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. ¿Has visto a quien desmiente el Juicio Final? Ese es quien rechaza al huérfano y no promueve alimentar al necesitado. ¡Ay de los que rezan pero son negligentes con su rezo, de los que solo lo hacen para ser vistos y niegan la ayuda más elemental!',
        description: 'Se recita como sura adicional en los rezos.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Al-Kawthar',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahir-rahmanir-rahim. Inna a\'taynakal-kawthar. Fa-salli li-Rabbika wanhar. Inna shani-aka huwal-abtar.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. En verdad, te hemos concedido la Abundancia (al-Kawthar). Reza, pues, a tu Señor y sacrifica. Ciertes, el que te aborrece es el que no tendrá posteridad.',
        description: 'La sura más corta del Santo Corán.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Al-Kafirun',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul ya-ayyuhal-kafirun. La a\'budu ma ta\'budun. Wa la antum \'abiduna ma a\'bud. Wa la ana \'abidun ma \'abadtum. Wa la antum \'abiduna ma a\'bud. Lakum dinukum wa-liya din.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Di: ¡Oh, incrédulos! Yo no adoro lo que vosotros adoráis. Ni vosotros adoráis lo que yo adoro. Yo no adoraré lo que habéis adorado. Ni vosotros adoraréis lo que yo adoro. Para vosotros vuestra religión y para mí mi religión.',
        description: 'Se recita como sura adicional en los rezos.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'An-Nasr',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahir-rahmanir-rahim. Idha jaa nasrullahi wal-fath. Wa ra-aytannasa yadkhuluna fi dinillahi afwaja. Fa-sabbih bihamdi Rabbika wastaghfirh. Innahu kana tawwaba.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Cuando llegue el socorro de Allah y la victoria, y veas a la gente entrar en tropel en la religión de Allah, entonces celebra las alabanzas de tu Señor e implora Su perdón. Él es el Compasivo.',
        description: 'Se recita como sura adicional en los rezos.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Al-Masad',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Tabbat yada Abi Lahabin watabb. Ma aghna \'anhu maluhu wama kasab. Sayasla naran dhata lahab. Wamra-atuhu hammalatal-hatab. Fi jidiha hablun min masad.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. ¡Que se arruinen las manos de Abu Lahab y que él mismo perezca! No le servirá de nada su hacienda ni lo que adquirió. Arderá en un fuego de llamas, junto con su mujer, la portadora de leña, que llevará al cuello una cuerda de esparto.',
        description: 'Se recita como sura adicional en los rezos.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'Al-Ikhlas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul huwallahu ahad. Allahus-samad. Lem yelid wa lem yuled. Wa lem yakun lahu kufuwan ahad.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Di: Él es Allah, Uno. Allah, el Absoluto. No engendró ni fue engendrado. Y no hay nadie que sea equivalente a Él.',
        description: 'La sura que define el Monoteísmo Islámico (Tawhid).',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Al-Falaq',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbil-falak. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharri-naffathati fil-\'uqad. Wa min sharri hasidin idha hasad.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Di: Me refugio en el Señor del amanecer, del mal de lo que creó, del mal de la oscuridad cuando se extiende, del mal de las sopladoras en los nudos, y del mal del envidioso cuando envidia.',
        description: 'Se recita para buscar protección contra los males.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'An-Nas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbinnas. Melikinnas. Ilahinnas. Min sharril-waswasil-khannas. Alladhi yuwaswisu fi sudurinnas. Minal-jinnati wannas.',
        translation: 'En el nombre de Allah, el Clemente, el Misericordioso. Di: Me refugio en el Señor de los hombres, el Rey de los hombres, el Dios de los hombres, del mal del susurrador insidioso, que susurra en el pecho de los hombres, ya sea genio o humano.',
        description: 'Se recita para buscar protección contra los susurros.',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Ettehiyyatu',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'At-tahiyyatu lillahi was-salawatu wat-tayyibat. As-salamu \'alayka ayyuhan-nabiyyu wa rahmatullahi wa barakatuh. As-salamu \'alayna wa \'ala \'ibadillahis-salihin. Ashhadu an la ilaha illallahu wa ashhadu anna Muhammadan \'abduhu wa rasuluh.',
        translation: 'Todos los cumplidos, oraciones y buenas acciones son para Allah. La paz sea contigo, oh Profeta, y la misericordia de Allah y sus bendiciones. La paz sea con nosotros y con los siervos piadosos de Allah. Atestiguo que no hay más divinidad que Allah, y atestiguo que Muhammad es Su siervo y Su mensajero.',
        description: 'Se recita en la postura sentada de cada rezo.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahumma Salli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma salli \'ala Muhammadin wa \'ala ali Muhammad. Kama sallayta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'Oh Allah, derrama bendiciones sobre Muhammad y la familia de Muhammad, como derramaste bendiciones sobre Abraham y la familia de Abraham. En verdad, Tú eres Digno de alabanza y Glorioso.',
        description: 'Se recita en el sentado final de los rezos.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahumma Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma barik \'ala Muhammadin wa \'ala ali Muhammad. Kama barakta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'Oh Allah, bendice a Muhammad y a la familia de Muhammad, como bendijiste a Abraham y a la familia de Abraham. En verdad, Tú eres Digno de alabanza y Glorioso.',
        description: 'Se recita en el sentado final de los rezos.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbana',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbana atina fid-dunya hasanaten wa fil-akhirati hasanaten waqina \'adhaban-nar. Rabbanaghfir li wa li-walidayya wa lil-mu\'minina yawma yaqumul-hisab.',
        translation: 'Señor nuestro, concédenos lo bueno en este mundo y lo bueno en el Más Allá, y protégenos del castigo del Fuego. Señor nuestro, perdóname a mí, a mis padres y a los creyentes el Día en que se realice el cómputo.',
        description: 'Se recita al final del último sentado antes del saludo de paz.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Qunut 1 (Hanafí)',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
        translation: '¡Oh Allah! Te pedimos ayuda, Te pedimos perdón y Te pedimos guía. Creemos en Ti, nos arrepentimos ante Ti y en Ti confiamos. Te alabamos con todo el bien, Te agradecemos y no somos ingratos contigo, y dejamos y abandonamos a quienquiera que Te desobedezca.',
        description: 'Se recita en la 3.ª rakat de la oración del Witr en la escuela hanafí antes de inclinarse (Ruku).',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Qunut 2 (Hanafí)',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
        translation: '¡Oh Allah! Solo a Ti adoramos, solo para Ti oramos y nos postramos. Hacia Ti nos apresuramos y corremos para servirte. Esperamos Tu misericordia y tememos Tu castigo. Ciertamente, Tu castigo alcanzará a los incrédulos.',
        description: 'Se recita en la 3.ª rakat de la oración del Witr en la escuela hanafí inmediatamente después de la primera súplica de Qunut.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Qunut (Shafi\'í)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
        translation: '¡Oh Allah! Guíame entre aquellos a quienes has guiado. Concédeme bienestar entre aquellos a quienes has concedido bienestar. Tómame como amigo entre aquellos a quienes has tomado como amigos. Bendice para mí lo que me has otorgado. Protégeme del mal de lo que has decretado, pues Tú eres Quien decreta y nadie decreta sobre Ti. Ciertamente, aquel a quien tomas bajo Tu protección nunca será humillado, y aquel a quien tienes como enemigo nunca será honrado. Bendito eres, Señor nuestro, y Exaltado. A Ti pertenecen las alabanzas por lo que has decretado. Te pido perdón y me arrepiento ante Ti. La paz y las bendiciones de Allah sean con nuestro Profeta Muhammad, su familia y sus compañeros.',
        description: 'Se recita en la 2.ª rakat de la oración del Fajr después de levantarse del Ruku en la escuela shafi\'í, y en la segunda mitad del Ramadán en el Witr.',
      ),
    ];
  }

  // --- PASOS DEL WUDU (ABDEST) ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Intención y Basmala',
      action: 'Formule la intención en su corazón: "Tengo la intención de realizar el wudu por la causa de Allah" y diga "Bismillahir-rahmanir-rahim".',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavarse las manos',
      action: 'Lávese las manos hasta las muñecas tres veces, frotando bien entre los dedos. Mueva los anillos para que el agua llegue debajo.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Enjuagarse la boca',
      action: 'Enjuáguese la boca tres veces con agua, introduciéndola con la mano derecha.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Enjuagarse la nariz',
      action: 'Aspire agua en la nariz tres veces con la mano derecha y expúlsela con la mano izquierda.',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavarse la cara',
      action: 'Lávese toda la cara tres veces, desde el nacimiento del cabello hasta la barbilla y de oreja a oreja. (En la escuela shafi\'í la intención debe hacerse al comenzar a lavar la cara).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavarse los brazos',
      action: 'Lávese el brazo derecho y luego el izquierdo hasta los codos inclusive tres veces. Asegúrese de que no quede ninguna zona seca.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Pasar las manos por la cabeza (Mesh)',
      action: 'Humedezca las manos y páselas por al menos una cuarta parte de la cabeza. (En la escuela shafi\'í basta con humedecer unos pocos cabellos).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavarse las orejas',
      action: 'Limpie el interior de las orejas con los dedos índices y la parte posterior con los pulgares.',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Pasar las manos por el cuello',
        action: 'Limpie la nuca con el dorso de los dedos húmedos (no se recomienda en la escuela shafi\'í).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Lavarse los pies',
      action: 'Lávese el pie derecho y luego el izquierdo tres veces hasta los tobillos inclusive, frotando bien entre los dedos.',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- PASOS DE LA ORACIÓN (DINÁMICO) ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 Rakat Sunnah', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Fard', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 Rakat Primera Sunnah', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Última Sunnah', 2, false, time));
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
        parts.add(_buildPart(mezhep, gender, '4 Rakat Primera Sunnah', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Última Sunnah', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Rakat Primera Sunnah', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (En congregación)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Rakat Última Sunnah', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Rakat Primera Sunnah', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (En congregación)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Última Sunnah', 2, false, time));
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
      case PrayerTime.sabah: return 'El rezo del Fajr (mañana) consta de 2 rakats sunnah y 2 rakats fard.';
      case PrayerTime.ogle: return 'El rezo del Dhuhr consta de 4 primera sunnah, 4 fard, y 2 última sunnah.';
      case PrayerTime.ikindi: return 'El rezo del Asr consta de 4 sunnah y 4 fard.';
      case PrayerTime.aksam: return 'El rezo del Maghrib consta de 3 fard y 2 sunnah.';
      case PrayerTime.yatsi: return 'El rezo del Isha consta de 4 primera sunnah, 4 fard, 2 última sunnah y Vitir.';
      case PrayerTime.cuma: return 'El rezo de Jumah se realiza en congregación a la hora del Dhuhr los viernes.';
      case PrayerTime.bayram: return 'El rezo de Eid consta de 2 rakats con tekbires adicionales el mañana de la fiesta.';
      case PrayerTime.cenaze: return 'El rezo fúnebre se realiza de pie como súplica por el fallecido.';
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
      title: 'Intención (Niyyah)',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'Formular la intención en el corazón es obligatorio. Decirla de viva voz es sunnah.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir de apertura',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah es el más Grande.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: _getTekbirNote(mezhep, gender),
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Estar de pie (Qiyam)',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Inclinación (Rukû)',
        action: gender == Gender.male
            ? 'Inclínese manteniendo la espalda recta. Sujete las rodillas con los dedos abiertos.'
            : 'Inclínese ligeramente. Coloque las manos sobre las rodillas con los dedos juntos.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Veces)',
        transcription: 'Subhana Rabbiya\'l-\'Azim',
        translation: 'Gloria a mi Señor, el Grandioso.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Eleve las manos hasta los hombros (Raf\'ul Yadeyn) al inclinarse al Rukû y diga "Allahu Akbar".'
            : 'Inclínese al Rukû diciendo el Tekbir sin elevar las manos.',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Erguirse (I\'tidal)',
        action: 'Levántese completamente del Rukû y permanezca erguido.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Sami\'allahu liman hamideh.\nRabbana laka\'l-hamd.',
        translation: 'Allah escucha a quien Le alaba.\nSeñor nuestro, a Ti la alabanza.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: '2.ª Rakat - Súplica de Qunut (Shafi\'í)',
          action: 'Tras erguirse del ruku, se levantan las manos a la altura del pecho y se recita la súplica de Qunut (luego se va a la postración sin pasarse las manos por el rostro).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
          translation: '¡Oh Allah! Guíame entre aquellos a quienes has guiado. Concédeme bienestar entre aquellos a quienes has concedido bienestar. Tómame como amigo entre aquellos a quienes has tomado como amigos. Bendice para mí lo que me has otorgado. Protégeme del mal de lo que has decretado, pues Tú eres Quien decreta y nadie decreta sobre Ti. Ciertamente, aquel a quien tomas bajo Tu protección nunca será humillado, y aquel a quien tienes como enemigo nunca será honrado. Bendito eres, Señor nuestro, y Exaltado. A Ti pertenecen las alabanzas por lo que has decretado. Te pido perdón y me arrepiento ante Ti. La paz y las bendiciones de Allah sean con nuestro Profeta Muhammad, su familia y sus compañeros.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'En la escuela shafi\'í, recitar el Qunut después del ruku en la 2.ª rakat del Fajr es una sunnah confirmada (ab\'ad sunnah).',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 1ª Postración',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Veces)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Gloria a mi Señor, el Altísimo.',
        imageKey: '${gender.name}_secde',
        note: 'Apoye primero las rodillas, luego las manos, y después la frente y la nariz en el suelo.',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Sentado (Celse)',
        action: gender == Gender.male
            ? 'Siéntese sobre el pie izquierdo manteniendo el pie derecho vertical.'
            : 'Siéntese sobre el glúteo izquierdo (Tawarruk). Las manos descansan en los muslos.',
        imageKey: '${gender.name}_celse',
        note: 'Hacer una pausa breve entre las dos postraciones es obligatorio.',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 2ª Postración',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Veces)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Gloria a mi Señor, el Altísimo.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Sentado Final',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Recitar At-Tahiyyat, Allahumma Salli, Barik y Rabbana.',
          transcription: 'Recitar las súplicas del Tashahhud una tras otra.',
          translation: 'Puede acceder a los textos completos en el menú Súplicas.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Saludo (Derecha)',
          action: 'Gire la cabeza a la derecha y diga "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَAMُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Que la paz y la misericordia de Allah sean con vosotros.',
          imageKey: '${gender.name}_selam',
          note: 'Mire hacia el hombro. Saludar a la derecha es obligatorio en la escuela shafi\'í.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Saludo (Izquierda)',
          action: 'Gire la cabeza a la izquierda y diga "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Que la paz y la misericordia de Allah sean con vosotros.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Terminar el rezo con el saludo a la izquierda.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Primer Sentado',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Recitar At-Tahiyyat.',
          transcription: 'At-tahiyyatu lillahi...',
          translation: 'Solo se lee la súplica At-Tahiyyat.',
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
      title: 'Intención (Niyyah)',
      action: 'Tengo la intención de realizar el rezo de Vitir de 3 rakats de hoy por la causa de Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir de apertura',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Recitación',
      action: 'Recitar Subhanaka, la Fatiha y una sura adicional.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Recitación',
      action: 'Recitar la Fatiha y una sura adicional.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Primer Sentado',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Recitar At-Tahiyyat y ponerse de pie.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam (Antes de Qunut)',
      action: 'Unir las manos. Recitar la Fatiha y una sura. Al terminar la sura, soltar las manos.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Tekbir del Qunut',
      action: gender == Gender.male
          ? 'Elevar las manos a los lóbulos de las orejas, decir "Allahu Akbar" y unirlas de nuevo bajo el ombligo.'
          : 'Elevar las manos al nivel del pecho, decir "Allahu Akbar" y unirlas de nuevo sobre el pecho.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Específico de la escuela hanafí antes de la súplica del Qunut.',
    ));

    // Súplica de Qunut 1
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Súplica de Qunut 1',
      action: 'Recitar la primera súplica del Qunut con las manos unidas.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
      translation: '¡Oh Allah! Te pedimos ayuda, Te pedimos perdón y Te pedimos guía. Creemos en Ti, nos arrepentimos ante Ti y en Ti confiamos. Te alabamos con todo el bien, Te agradecemos y no somos ingratos contigo, y dejamos y abandonamos a quienquiera que Te desobedezca.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Súplica de Qunut 2
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Súplica de Qunut 2',
      action: 'Inmediatamente después de Qunut 1, recitar la segunda súplica con las manos unidas.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
      translation: '¡Oh Allah! Solo a Ti adoramos, solo para Ti oramos y nos postramos. Hacia Ti nos apresuramos y corremos para servirte. Esperamos Tu misericordia y tememos Tu castigo. Ciertamente, Tu castigo alcanzará a los incrédulos.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'Inclinarse al Rukû.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Veces)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Erguirse',
      action: 'Erguirse del Rukû.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1ª Postración',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Sentado',
      action: 'Sentarse.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2ª Postración',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Sentado Final',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Recitar At-Tahiyyat, Salli, Barik y Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Derecha)',
      action: 'Dar el saludo a la derecha.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Izquierda)',
      action: 'Dar el saludo a la izquierda para terminar.',
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
      title: 'Intención (Niyyah)',
      action: 'Tengo la intención de realizar el rezo de Vitir por la causa de Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir de apertura',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Recitación',
      action: 'Recitar la súplica de apertura, la Fatiha y Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Recitación',
      action: 'Recitar la Fatiha y Al-Kafirun.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Sentado y Saludos',
      action: 'Sentarse, leer At-Tahiyyat, Salli, Barik y saludar a derecha/izquierda. Luego ponerse de pie para la última rakat única.',
      imageKey: '${gender.name}_selam',
      note: 'En la escuela shafi\'í, malikí y hanbalí es preferible realizar el Vitir en 2+1 rakats.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 (Única) - Intención & Tekbir',
      action: 'Intención para la última rakat del Vitir. Tomar el Tekbir de apertura.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam & Recitación',
      action: 'Reciter la Fatiha y Al-Ikhlas.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'Inclinarse al Rukû.',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Erguirse (Qunut)',
      action: mezhep == Mezhep.shafii
          ? 'En la segunda mitad del Ramadán, tras erguirse del ruku, se levantan las manos y se recita la súplica de Qunut.'
          : 'Erguirse del Rukû.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? '¡Oh Allah! Guíame entre aquellos a quienes has guiado. Concédeme bienestar entre aquellos a quienes has concedido bienestar. Tómame como amigo entre aquellos a quienes has tomado como amigos. Bendice para mí lo que me has otorgado. Protégeme del mal de lo que has decretado, pues Tú eres Quien decreta y nadie decreta sobre Ti. Ciertamente, aquel a quien tomas bajo Tu protección nunca será humillado, y aquel a quien tienes como enemigo nunca será honrado. Bendito eres, Señor nuestro, y Exaltado. A Ti pertenecen las alabanzas por lo que has decretado. Te pido perdón y me arrepiento ante Ti. La paz y las bendiciones de Allah sean con nuestro Profeta Muhammad, su familia y sus compañeros.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'En la escuela shafi\'í, recitar el Qunut después del ruku en la última rakat del Witr durante la segunda mitad del Ramadán es Sunnah.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1ª Postración',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Sentado',
      action: 'Sentarse.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2ª Postración',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Sentado Final',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Recitar At-Tahiyyat, Salli, Barik y Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Derecha)',
      action: 'Dar el saludo a la derecha.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Izquierda)',
      action: 'Dar el saludo a la izquierda.',
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
      title: 'Intención (Niyyah)',
      action: 'Tengo la intención de realizar el rezo de Eid de hoy por la causa de Allah, siguiendo al Imam presente.',
      imageKey: '${gender.name}_niyet',
      note: 'Los rezos de Eid al-Fitr (Ramazan) y Eid al-Adha (Kurban) se realizan exactamente igual.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Tekbir de apertura',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Súplica de apertura',
      action: mezhep == Mezhep.shafii
          ? 'Recitar la súplica del Veccehtu.'
          : 'Recitar la súplica del Subhanaka.',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Tekbires adicionales (7 Veces)',
        action: 'Elevar las manos y decir 7 veces "Allahu Akbar". Unir las manos tras cada Tekbir. Recitar "Subhanallahi..." en los intervalos.',
        arabicText: 'اللهُ أَكْبَرُ (7 Veces)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Tekbires adicionales (3 Veces)',
        action: 'Elevar las manos y decir 3 veces "Allahu Akbar". Soltar las manos en el 1º y 2º, unirlas en el 3º.',
        arabicText: 'اللهُ أَكْبَرُ (3 Veces)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Recitación',
      action: 'Recitar la Fatiha y Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Tekbires adicionales (5 Veces)',
        action: 'Al iniciar la rakat 2, antes de la recitación, elevar las manos 5 veces y recitar el Tekbir.',
        arabicText: 'اللهُ أَكْبَرُ (5 Veces)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Recitación',
        action: 'Recitar la Fatiha y Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Recitación',
        action: 'Recitar la Fatiha y Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Tekbires adicionales (3 Veces)',
        action: 'Tras la recitación y antes del Rukû, elevar las manos 3 veces en "Allahu Akbar", dejándolas caer a los lados.',
        arabicText: 'اللهُ أَكْبَرُ (3 Veces)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Ir al Rukû',
        action: 'Decir un 4º Tekbir sin elevar las manos e inclinarse directamente al Rukû.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Erguirse',
        action: 'Erguirse.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 1ª Postración',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Sentado',
        action: 'Sentarse.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 2ª Postración',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Sentado Final',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Recitar At-Tahiyyat, Salli, Barik y Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Derecha)',
      action: 'Dar el saludo a la derecha.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Izquierda)',
      action: 'Dar el saludo a la izquierda.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Rezo de Eid',
      rakatCount: 2,
      steps: steps,
    );
  }

  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Intención (Niyyah)',
      action: 'Tengo la intención de realizar el rezo fúnebre por la causa de Allah, salawat por el Profeta, y la súplica por el difunto, siguiendo al Imam presente.',
      imageKey: '${gender.name}_niyet',
      note: 'El rezo fúnebre se realiza completamente de pie. No tiene inclinación ni prosternación.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1er Tekbir',
      action: gender == Gender.male
          ? 'Elevar las manos a los lóbulos de las orejas, decir "Allahu Akbar" y unirlas bajo el ombligo.'
          : 'Elevar las manos al nivel del pecho, decir "Allahu Akbar" y unirlas sobre el pecho.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Recitación del 1er Tekbir',
      action: mezhep == Mezhep.shafii
          ? 'Recitar silenciosamente la sura Al-Fatiha.'
          : 'Recitar la súplica de Subhanaka con la frase "wa jalla sanauka".',
      arabicText: mezhep == Mezhep.shafii ? 'Al-Fatiha' : 'Subhanaka (con wa jalla sanauka)',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2º Tekbir & Salavats',
      action: 'Tomar el Tekbir. Recitar Allahumma Salli y Barik.',
      arabicText: 'Allahumma Salli & Allahumma Barik',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3er Tekbir & Súplica fúnebre',
      action: 'Tomar el 3er Tekbir. Recitar la súplica especial por el difunto.',
      arabicText: 'Súplica Fúnebre',
      imageKey: '${gender.name}_kiyam',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '4º Tekbir',
      action: 'Tomar el 4º Tekbir, quedarse brevemente de pie, soltar las manos a los lados.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Derecha)',
      action: 'Dar el saludo a la derecha de pie.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Saludo (Izquierda)',
      action: 'Dar el saludo a la izquierda de pie para terminar el rezo fúnebre.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'Rezo Fúnebre',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Rukû',
      action: 'Inclinarse al Rukû.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Erguirse',
      action: 'Erguirse.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 1ª Postración',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Sentado',
      action: 'Sentarse.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 2ª Postración',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPER ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'Formule la intención: "Tengo la intención de realizar el rezo de ${time.name} ($partName) de hoy por la causa de Allah."';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Elevar las manos hasta que los pulgares toquen los lóbulos de las orejas. Decir "Allahu Akbar" y unirlas bajo el ombligo.';
      } else {
        return 'Elevar las manos al nivel de los hombros. Decir "Allahu Akbar" y unirlas bajo el pecho.';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'Elevar las manos al nivel del pecho. Decir "Allahu Akbar" y unirlas sobre el pecho, la mano derecha sobre la izquierda.';
      } else {
        return 'Elevar las manos al nivel de los hombros, tomar el Tekbir y unirlas sobre el pecho.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'En la escuela shafi\'í, elevar las manos al nivel de los hombros durante el Tekbir es sunnah.';
    }
    return 'Los hombres elevan las manos a las orejas, las mujeres al pecho.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Permanecer erguido de pie. Unir las manos bajo el ombligo, mano derecha sobre el puño izquierdo. Mirar hacia el suelo de prostración.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Permanecer erguido. Unir las manos sobre el ombligo, bajo el pecho (altura del corazón).';
      } else {
        structure = 'Permanecer erguido. Dejar los brazos caídos a los lados (Sadl) o unirlos bajo el pecho.';
      }
    } else {
      structure = 'Permanecer erguido. Unir las manos sobre el pecho, la mano derecha sobre la izquierda sin apretar. Mirar hacia el lugar de prostración.';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nRecitar la súplica de apertura (Veccehtu). Decir Euzü-Besmele, recitar la Fatiha en voz alta y luego recitar una sura adicional.';
      }
      return '$structure\nRecitar Subhanaka. Decir Euzü-Besmele, Fatiha y una sura adicional (Zamm-ı Sure).';
    } else if (rekat == 2) {
      return '$structure\nDecir Besmele, recitar la Fatiha y una sura adicional.';
    } else {
      if (isFarz) {
        return '$structure\nDecir Besmele y recitar únicamente la Fatiha. Sin sura adicional.';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          return '$structure\nEn la 3ª rakat de estas Sunnahs, recitar primero Subhanaka, luego la Fatiha y una sura.';
        }
        return '$structure\nDecir Besmele, recitar la Fatiha y una sura adicional.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('First Sunnah') || partName.contains('Primera')) {
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
        arabic.writeln('[SÚPLICA DE APERTURA SHAFI\'I (VECCEHTÜ)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Súplica de apertura Shafi\'i (Veccehtü)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.');
        translation.writeln('[Súplica de apertura Shafi\'i Traducción]');
        translation.writeln('Ciertamente, dirijo mi rostro hacia Quien ha creado los cielos y la tierra, como creyente puro, y no pertenezco a los politeístas. Ciertamente, mi oración, mis ritos de devoción, mi vida y mi muerte pertenecen a Allah, Señor de los mundos. Él no tiene socio alguno. Esto es lo que se me ha ordenado, y soy uno de los sometidos (musulmanes).');
      } else {
        arabic.writeln('[SÚPLICA SUBHANAKA]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Súplica Subhanaka]');
        transcription.writeln('Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa la ilaha ghayruk.');
        translation.writeln('[Súplica Subhanaka Traducción]');
        translation.writeln('¡Gloria a Ti, oh Allah, y alabado seas! Bendito sea Tu nombre, y exaltada sea Tu majestad. No hay más divinidad digna de adoración excepto Tú.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[SURA AL-FATIHA]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْمِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُOBِ عَلَيْهِمْ وَلَا الضَّALّ۪ينَ');
    transcription.writeln('[Al-Fatiha]');
    transcription.writeln('Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.');
    translation.writeln('[Al-Fatiha Traducción]');
    translation.writeln('En el nombre de Allah, el Clemente, el Misericordioso. Alabado sea Allah, Señor de los mundos. El Clemente, el Misericordioso. Soberano del Día del Juicio. Solo a Ti te adoramos y solo a Ti te pedimos ayuda. Guíanos por el camino recto. El camino de los que has colmado con Tus favores, no el de los que han incurrido en Tu ira, ni el de los extraviados.');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[SURA ADICIONAL (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Sura ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[${zamm.name} Traducción]');
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
      return 'En la escuela shafi\'í, recitar Veccehtu en vez de Subhanaka en la 1ª rakat. Recitar la Basmala en voz alta.';
    }
    return 'Qiyam es estar de pie. Fijar la mirada en el punto de procreación ayuda a concentrarse.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Elevar las manos al nivel de los hombros al erguirse.';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' En la escuela shafi\'í, recitar la súplica del Qunut de pie en la 2ª rakat.';
    }
    return note.isNotEmpty ? note : 'Permanecer erguido brevemente para calmarse.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Postración (Sujud). La frente y la nariz tocan el suelo. Los dedos apuntan a la Qibla. Mantener codos despegados del suelo y apartados del cuerpo.';
    } else {
      return 'Postración. La frente y la nariz tocan el suelo. Los codos quedan apoyados en el suelo y pegados al cuerpo (postura encogida).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'En el sentado final, sentarse en el glúteo izquierdo, con el pie izquierdo pasando bajo la pierna derecha (Tawarruk).';
      }
      return 'Sentarse sobre el pie izquierdo, manteniendo el derecho vertical (Iftirish). Las manos descansan en los muslos.';
    } else {
      return 'En ambos sentados, sentarse en el glúteo izquierdo dirigiendo los pies hacia la derecha (Tawarruk).';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'Recitar At-Tahiyyat, Salli, Barik y Rabbana.';
    }
    return 'Recitar solo At-Tahiyyat en el primer sentado.';
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
          translation: 'Ciertamente, dirijo mi rostro hacia Quien ha creado los cielos y la tierra, como creyente puro, y no pertenezco a los politeístas. Ciertamente, mi oración, mi sacrificio, mi vida y mi muerte pertenecen a Allah, Señor de los mundos. Él no tiene socio alguno. Esto es lo que se me ha ordenado, y soy uno de los sometidos (musulmanes).',
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
