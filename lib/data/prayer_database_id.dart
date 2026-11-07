import '../models/prayer_models.dart';

class PrayerDatabaseId {
  // --- SURAHS AND PRAYERS ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Subhanaka',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa jalla sanauka (Hanya dalam Shalat Jenazah). Wa la ilaha ghayruk.',
        translation: 'Maha Suci Engkau ya Allah, dan segala puji bagi-Mu. Maha Suci nama-Mu, dan Maha Tinggi keagungan-Mu. Maha Agung puji-Mu (Hanya dalam Shalat Jenazah), dan tidak ada tuhan yang berhak disembah selain Engkau.',
        description: 'Ini adalah doa pembuka yang dibaca pada rakaat pertama shalat, tepat setelah takbiratul ihram.',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Al-Fatihah',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Segala puji bagi Allah, Tuhan semesta alam. Yang Maha Pengasih lagi Maha Penyayang. Pemilik hari pembalasan. Hanya kepada Engkaulah kami menyembah dan hanya kepada Engkaulah kami mohon pertolongan. Tunjukilah kami jalan yang lurus. (Yaitu) jalan orang-orang yang telah Engkau beri nikmat kepadanya, bukan (jalan) mereka yang dimurkai dan bukan (pula jalan) mereka yang sesat.',
        description: 'Ini adalah rukun inti dari shalat, wajib dibaca di setiap rakaat.',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Al-Fil',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alam tara kayfa fa\'ala rabbuka bi-ashabil-fil. Alam yaj\'al kaydahum fi tadlil. Wa arsala \'alayhim tayran ababil. Tarmihim bi-hijaratin min sijjil. Faja\'alahum ka\'asfin ma\'kul.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Tidakkah engkau (Muhammad) perhatikan bagaimana Tuhanmu telah bertindak terhadap pasukan bergajah? Bukankah Dia telah menjadikan tipu daya mereka itu sia-sia? Dan Dia mengirimkan kepada mereka burung yang berbondong-bondong. Yang melempari mereka dengan batu dari tanah liat yang dibakar. Sehingga mereka dijadikan-Nya seperti daun-daun yang dimakan (ulat).',
        description: 'Salah satu surah pendek yang dibaca sebagai surah tambahan (zamm-i surah) dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Quraisy',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Li-ilafi Quraysh. Ilafihim rihlatash-shitai was-sayf. Fal-ya\'budu Rabba hadhal-bayt. Alladhi at\'amahum min ju\'in wa-amanahum min khawf.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Karena kebiasaan orang-orang Quraisy. (Yaitu) kebiasaan mereka bepergian pada musim dingin dan musim panas. Maka hendaklah mereka menyembah Tuhan (Pemilik) rumah ini (Ka\'bah). Yang telah memberi makanan kepada mereka untuk menghilangkan lapar dan mengamankan mereka dari rasa ketakutan.',
        description: 'Dibaca sebagai surah tambahan dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Al-Ma\'un',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Ara-aytal-ladhi yukadhibu bid-din. Fadhanikal-ladhi yadu\'ul-yatim. Wa la yahuddu \'ala ta\'amil-miskin. Fawaylun lil-musallin. Aladhina hum \'an salatihim sahun. Aladhina hum yuraun. Wa yamna\'unal-ma\'un.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Tahukah kamu (orang) yang mendustakan agama? Maka itulah orang yang menghardik anak yatim. Dan tidak mendorong memberi makan orang miskin. Maka celakalah orang yang shalat. (Yaitu) orang-orang yang lalai dari shalatnya. Orang-orang yang berbuat riya. Dan enggan (memberikan) bantuan barang berguna.',
        description: 'Dibaca sebagai surah tambahan dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Al-Kautsar',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahir-rahmanir-rahim. Inna a\'taynakal-kawthar. Fa-salli li-Rabbika wanhar. Inna shani-aka huwal-abtar.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Sungguh, Kami telah memberimu (Muhammad) nikmat yang banyak. Maka laksanakanlah shalat karena Tuhanmu, dan berkurbanlah (sebagai ibadah dan mendekatkan diri kepada Allah). Sungguh, orang-orang yang membencimu dialah yang terputus (dari rahmat Allah).',
        description: 'Surah terpendek di dalam Al-Qur\'an.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Al-Kafirun',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul ya-ayyuhal-kafirun. La a\'budu ma ta\'budun. Wa la antum \'abiduna ma a\'bud. Wa la ana \'abidun ma \'abadtum. Wa la antum \'abiduna ma a\'bud. Lakum dinukum wa-liya din.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Katakanlah (Muhammad): Hai orang-orang kafir! Aku tidak akan menyembah apa yang kamu sembah. Dan kamu bukan penyembah Tuhan yang aku sembah. Dan aku tidak pernah menjadi penyembah apa yang kamu sembah. Dan kamu tidak pernah (pula) menjadi penyembah Tuhan yang aku sembah. Untukmu agamamu, dan untukku agamaku.',
        description: 'Dibaca sebagai surah tambahan dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'An-Nashr',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahir-rahmanir-rahim. Idha jaa nasrullahi wal-fath. Wa ra-aytannasa yadkhuluna fi dinillahi afwaja. Fa-sabbih bihamdi Rabbika wastaghfirh. Innahu kana tawwaba.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Apabila telah datang pertolongan Allah dan kemenangan. Dan engkau melihat manusia berbondong-bondong masuk agama Allah. Maka bertasbihlah dengan memuji Tuhanmu dan mohonlah ampunan kepada-Nya. Sungguh, Dia Maha Penerima taubat.',
        description: 'Dibaca sebagai surah tambahan dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Al-Lahab',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Tabbat yada Abi Lahabin watabb. Ma aghna \'anhu maluhu wama kasab. Sayasla naran dhata lahab. Wamra-atuhu hammalatal-hatab. Fi jidiha hablun min masad.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Binasalah kedua tangan Abu Lahab dan benar-benar binasa dia! Tidaklah berguna baginya hartanya dan apa yang dia usahakan. Kelak dia akan masuk ke dalam api yang bergejolak (neraka). Dan (begitu pula) istrinya, pembawa kayu bakar (penyebar fitnah). Di lehernya ada tali dari sabut yang dipintal.',
        description: 'Dibaca sebagai surah tambahan dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'Al-Ikhlas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul huwallahu ahad. Allahus-samad. Lem yalid wa lem yuled. Wa lem yakun lahu kufuwan ahad.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Katakanlah (Muhammad): Dialah Allah, Yang Maha Esa. Allah tempat meminta segala sesuatu. (Allah) tidak beranak dan tidak pula diperanakkan. Dan tidak ada sesuatu yang setara dengan Dia.',
        description: 'Surah inti yang mendefinisikan Tauhid Islam.',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Al-Falaq',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbil-falak. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharri-naffathati fil-\'uqad. Wa min sharri hasidin idha hasad.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Katakanlah: Aku berlindung kepada Tuhan yang menguasai subuh (fajar). Dari kejahatan (makhluk yang) Dia ciptakan. Dan dari kejahatan malam apabila telah gelap gulita. Dan dari kejahatan (perempuan-perempuan) penyihir yang meniup pada buhul-buhul (talinya). Dan dari kejahatan orang yang dengki apabila dia dengki.',
        description: 'Dibaca untuk memohon perlindungan dari kejahatan.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'An-Nas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbinnas. Melikinnas. Ilahinnas. Min sharril-waswasil-khannas. Alladhi yuwaswisu fi sudurinnas. Minal-jinnati wannas.',
        translation: 'Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Katakanlah: Aku berlindung kepada Tuhannya manusia. Rajanya manusia. Sembahan manusia. Dari kejahatan (bisikan) setan yang bersembunyi. Yang membisikkan (kejahatan) ke dalam dada manusia. Dari (golongan) jin dan manusia.',
        description: 'Dibaca untuk memohon perlindungan dari bisikan (setan).',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Tahiyat',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'At-tahiyyatu lillahi was-salawatu wat-tayyibat. As-salamu \'alayka ayyuhan-nabiyyu wa rahmatullahi wa barakatuh. As-salamu \'alayna wa \'ala \'ibadillahis-salihin. Ashhadu an la ilaha illallahu wa ashhadu anna Muhammadan \'abduhu wa rasuluh.',
        translation: 'Segala penghormatan, shalat, dan kebaikan adalah milik Allah. Semoga keselamatan, rahmat Allah, dan keberkahan-Nya senantiasa tercurah kepadamu, wahai Nabi. Semoga keselamatan senantiasa tercurah kepada kami dan hamba-hamba Allah yang saleh. Aku bersaksi bahwa tidak ada tuhan yang berhak disembah selain Allah, dan aku bersaksi bahwa Muhammad adalah hamba dan utusan-Nya.',
        description: 'Dibaca pada posisi duduk di setiap shalat.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahumma Shalli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma salli \'ala Muhammadin wa \'ala ali Muhammad. Kama sallayta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad dan keluarga Nabi Muhammad, sebagaimana Engkau telah melimpahkan rahmat kepada Nabi Ibrahim dan keluarga Nabi Ibrahim. Sesungguhnya Engkau Maha Terpuji lagi Maha Mulia.',
        description: 'Dibaca pada posisi duduk tasyahud akhir dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahumma Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma barik \'ala Muhammadin wa \'ala ali Muhammad. Kama barakta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'Ya Allah, limpahkanlah keberkahan kepada Nabi Muhammad dan keluarga Nabi Muhammad, sebagaimana Engkau telah melimpahkan keberkahan kepada Nabi Ibrahim dan keluarga Nabi Ibrahim. Sesungguhnya Engkau Maha Terpuji lagi Maha Mulia.',
        description: 'Dibaca pada posisi duduk tasyahud akhir dalam shalat.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbana',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbana atina fid-dunya hasanaten wa fil-akhirati hasanaten waqina \'adhaban-nar. Rabbanaghfir li wa li-walidayya wa lil-mu\'minina yawma yaqumul-hisab.',
        translation: 'Ya Tuhan kami, berilah kami kebaikan di dunia dan kebaikan di akhirat, dan lindungilah kami dari azab neraka. Ya Tuhan kami, ampunilah aku, kedua orang tuaku, dan orang-orang mukmin pada hari terjadinya hisab (kiamat).',
        description: 'Dibaca di bagian paling akhir dari duduk terakhir sebelum mengucapkan Salam.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Doa Qunut 1',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
        translation: 'Ya Allah! Sesungguhnya kami memohon pertolongan-Mu, memohon ampunan-Mu, dan memohon petunjuk-Mu. Kami beriman kepada-Mu, bertaubat kepada-Mu, dan bertawakal kepada-Mu. Kami memuji-Mu dengan segala kebaikan, kami bersyukur kepada-Mu dan tidak mengingkari nikmat-Mu, serta kami berlepas diri dan meninggalkan orang yang mendurhakai-Mu.',
        description: 'Doa Qunut pertama yang dibaca sebelum ruku\' pada rakaat ke-3 shalat Witir dalam mazhab Hanafi.',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Doa Qunut 2',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
        translation: 'Ya Allah! Hanya kepada-Mu kami menyembah, hanya untuk-Mu kami shalat dan bersujud. Kepada-Mu kami berusaha dan bergegas melayani. Kami mengharapkan rahmat-Mu dan takut akan siksa-Mu. Sesungguhnya siksa-Mu pasti menimpa orang-orang kafir.',
        description: 'Doa Qunut kedua yang dibaca langsung setelah doa Qunut pertama pada rakaat ke-3 shalat Witir dalam mazhab Hanafi.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Doa Qunut (Syafi\'i)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allahummahdini fimen hedayt, wa \'afini fimen \'afayt, wa tawallani fimen tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fainnaka taqdi wa la yuqda \'alayk, wa innahu la yadhillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
        translation: 'Ya Allah, berilah aku petunjuk sebagaimana orang yang telah Engkau beri petunjuk, berilah aku keselamatan sebagaimana orang yang telah Engkau beri keselamatan, peliharalah aku sebagaimana orang yang telah Engkau pelihara, berkahilah bagiku apa yang telah Engkau berikan, dan lindungilah aku dari keburukan apa yang telah Engkau tetapkan. Sesungguhnya Engkau yang menetapkan dan tidak ada yang menetapkan atas-Mu. Sesungguhnya tidak akan terhina orang yang Engkau cintai, dan tidak akan mulia orang yang Engkau musuhi. Maha Berkah Engkau, wahai Tuhan kami, dan Maha Tinggi Engkau. Maka bagi-Mu segala puji atas apa yang telah Engkau tetapkan. Aku memohon ampunan kepada-Mu dan bertaubat kepada-Mu. Dan semoga shalawat serta salam senantiasa tercurah kepada junjungan kami Nabi Muhammad, beserta keluarga dan para sahabatnya.',
        description: 'Dibaca pada rakaat ke-2 shalat Subuh setelah bangkit dari ruku\' dan pada paruh kedua shalat Witir di bulan Ramadhan dalam mazhab Syafi\'i.',
      ),
    ];
  }

  // --- WUDU (ABLUTION) STEPS ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Niat dan Basmalah',
      action: 'Berniat di dalam hati: "Saya berniat wudhu karena Allah" dan membaca "Bismillahir-rahmanir-rahim".',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Mencuci Tangan',
      action: 'Cuci tangan hingga pergelangan tangan tiga kali, sela-sela jari. Pastikan air mengalir ke bawah cincin.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Berkumur',
      action: 'Berkumur tiga kali dengan air menggunakan tangan kanan, putar-putar di dalam mulut secara menyeluruh.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Membersihkan Hidung',
      action: 'Masukkan air ke dalam hidung tiga kali menggunakan tangan kanan, dan keluarkan dengan tangan kiri.',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Membasuh Wajah',
      action: 'Basuh seluruh wajah tiga kali, dari batas rambut di dahi hingga bawah dagu, dan dari telinga ke telinga. (Dalam mazhab Syafi\'i, niat harus dilakukan pada awal membasuh wajah).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Membasuh Lengan',
      action: 'Basuh lengan kanan hingga siku tiga kali, lalu ulangi pada lengan kiri.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Mengusap Kepala (Mesh)',
      action: 'Basahi tangan dan usap setidaknya seperempat kepala. (Dalam mazhab Syafi\'i, mengusap beberapa helai rambut saja sudah cukup).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Mengusap Telinga',
      action: 'Usap bagian dalam telinga dengan jari telunjuk dan bagian belakang dengan ibu jari.',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Mengusap Leher',
        action: 'Usap bagian belakang leher dengan punggung jari (tidak dianjurkan dalam mazhab Syafi\'i).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Membasuh Kaki',
      action: 'Basuh kaki kanan hingga mata kaki tiga kali, dimulai dari jari kaki, kemudian lakukan hal yang sama untuk kaki kiri.',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- DYNAMIC PRAYER STEPS GENERATOR ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 Rakaat Sunnah', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakaat Fardhu', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 Rakaat Sunnah Muakkad', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Rakaat Fardhu', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakaat Sunnah Ba\'diyah', 2, false, time));
        break;
      case PrayerTime.ikindi:
        parts.add(_buildPart(mezhep, gender, '4 Rakaat Sunnah', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakaat Fardhu', 4, true, time));
        break;
      case PrayerTime.aksam:
        parts.add(_buildPart(mezhep, gender, '3 Rakaat Fardhu', 3, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakaat Sunnah', 2, false, time));
        break;
      case PrayerTime.yatsi:
        parts.add(_buildPart(mezhep, gender, '4 Rakaat Sunnah Muakkad', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakaat Fardhu', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakaat Sunnah Ba\'diyah', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Rakaat Sunnah Muakkad', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakaat Fardhu (Berjamaah)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Rakaat Sunnah Ba\'diyah', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Rakaat Sunnah Qabliyah', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakaat Fardhu (Berjamaah)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakaat Sunnah Ba\'diyah', 2, false, time));
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
      case PrayerTime.sabah: return 'Shalat Subuh terdiri dari 2 rakaat sunnah dan 2 rakaat fardhu.';
      case PrayerTime.ogle: return 'Shalat Dzuhur terdiri dari 4 rakaat sunnah qabliyah, 4 fardhu, dan 2 sunnah ba\'diyah.';
      case PrayerTime.ikindi: return 'Shalat Ashar terdiri dari 4 rakaat sunnah dan 4 fardhu.';
      case PrayerTime.aksam: return 'Shalat Maghrib terdiri dari 3 rakaat fardhu dan 2 sunnah.';
      case PrayerTime.yatsi: return 'Shalat Isya terdiri dari 4 rakaat sunnah qabliyah, 4 fardhu, 2 sunnah ba\'diyah, dan Witir.';
      case PrayerTime.cuma: return 'Shalat Jumat dilaksanakan secara berjamaah pada waktu Dzuhur di hari Jumat.';
      case PrayerTime.bayram: return 'Shalat Id terdiri dari 2 rakaat yang dilaksanakan pada pagi hari raya dengan tambahan takbir.';
      case PrayerTime.cenaze: return 'Shalat Jenazah dilakukan sepenuhnya dengan berdiri, memohon ampunan untuk almarhum.';
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
      title: 'Niat',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'Niat wajib di dalam hati. Melafalkannya dengan lisan dianjurkan.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbiratul Ihram',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah Maha Besar.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: _getTekbirNote(mezhep, gender),
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat $rekat - Berdiri & Membaca',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat $rekat - Ruku\'',
        action: gender == Gender.male
            ? 'Membungkuk dengan punggung lurus. Pegang lutut dengan jari-jari direnggangkan. Pandangan ke arah tempat sujud.'
            : 'Membungkuk sedikit (lebih rendah dari pria). Letakkan tangan di lutut dengan jari-jari dirapatkan.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Times)',
        transcription: 'Subhana Rabbiya\'l-\'Azim',
        translation: 'Maha Suci Tuhanku Yang Maha Agung.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Angkat kedua tangan sejajar bahu (Raf\'ul Yadeyn) saat turun untuk Ruku\' sambil membaca "Allahu Akbar".'
            : 'Turun untuk Ruku\' sambil membaca "Allahu Akbar" tanpa mengangkat tangan.',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat $rekat - Bangkit (I\'tidal)',
        action: 'Berdiri tegak dari Ruku\'.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Sami\'allahu liman hamideh.\nRabbana laka\'l-hamd.',
        translation: 'Allah Maha Mendengar orang yang memuji-Nya.\nYa Tuhan kami, bagi-Mu lah segala puji.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Rakaat 2 - Doa Qunut (Syafi\'i)',
          action: 'Setelah bangkit dari ruku\', angkat kedua tangan setinggi dada dan bacalah doa Qunut (kemudian langsung sujud tanpa mengusapkan tangan ke wajah).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allahummahdini fimen hedayt, wa \'afini fimen \'afayt, wa tawallani fimen tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fainnaka taqdi wa la yuqda \'alayk, wa innahu la yadhillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
          translation: 'Ya Allah, berilah aku petunjuk sebagaimana orang yang telah Engkau beri petunjuk, berilah aku keselamatan sebagaimana orang yang telah Engkau beri keselamatan, peliharalah aku sebagaimana orang yang telah Engkau pelihara, berkahilah bagiku apa yang telah Engkau berikan, dan lindungilah aku dari keburukan apa yang telah Engkau tetapkan. Sesungguhnya Engkau yang menetapkan dan tidak ada yang menetapkan atas-Mu. Sesungguhnya tidak akan terhina orang yang Engkau cintai, dan tidak akan mulia orang yang Engkau musuhi. Maha Berkah Engkau, wahai Tuhan kami, dan Maha Tinggi Engkau. Maka bagi-Mu segala puji atas apa yang telah Engkau tetapkan. Aku memohon ampunan kepada-Mu dan bertaubat kepada-Mu. Dan semoga shalawat serta salam senantiasa tercurah kepada junjungan kami Nabi Muhammad, beserta keluarga dan para sahabatnya.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'Dalam mazhab Syafi\'i, membaca doa Qunut setelah bangkit dari ruku\' pada rakaat ke-2 shalat Subuh adalah sunnah ab\'adh (sangat dianjurkan).',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat $rekat - Sujud Ke-1',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Times)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Maha Suci Tuhanku Yang Maha Tinggi.',
        imageKey: '${gender.name}_secde',
        note: 'Saat turun untuk sujud, sentuh lutut terlebih dahulu, lalu tangan, lalu dahi dan hidung ke lantai.',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat $rekat - Duduk Antara Dua Sujud',
        action: gender == Gender.male
            ? 'Duduk di atas kaki kiri sambil membiarkan kaki kanan tegak dengan jari-jari kaki menghadap ke kiblat.'
            : 'Duduk di atas pinggul kiri dengan kedua kaki dikeluarkan ke sisi kanan (Tawarruk).',
        imageKey: '${gender.name}_celse',
        note: 'Berhenti sejenak di antara dua sujud adalah wajib (thuma\'ninah).',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat $rekat - Sujud Ke-2',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Times)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Maha Suci Tuhanku Yang Maha Tinggi.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Duduk Tasyahud Akhir',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Baca At-Tahiyyat, Allahumma Salli, Barik, dan Rabbana.',
          transcription: 'Baca doa Tasyahud.',
          translation: 'Anda dapat mengakses terjemahan lengkap di tab Doa.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salam (Kanan)',
          action: 'Palingkan kepala ke kanan dan baca "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Semoga keselamatan dan rahmat Allah senantiasa menyertaimu.',
          imageKey: '${gender.name}_selam',
          note: 'Pandangan ke arah bahu. Salam pertama hukumnya wajib dalam mazhab Syafi\'i.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salam (Kiri)',
          action: 'Palingkan kepala ke kiri dan baca "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'Semoga keselamatan dan rahmat Allah senantiasa menyertaimu.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Selesaikan shalat dengan Salam ke arah kiri.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Duduk Tasyahud Awal',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Baca At-Tahiyyat.',
          transcription: 'At-tahiyyatu lillahi...',
          translation: 'Hanya doa At-Tahiyyat yang dibaca.',
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
      title: 'Niat',
      action: 'Saya berniat shalat Witir 3 rakaat hari ini karena Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbiratul Ihram',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 1 - Berdiri & Membaca',
      action: 'Baca Subhanaka, Fatihah, dan Surah tambahan.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 2 - Berdiri & Membaca',
      action: 'Baca Fatihah dan Surah tambahan.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 2 - Duduk Tasyahud Awal',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Baca At-Tahiyyat dan berdiri kembali.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Berdiri (Sebelum Qunut)',
      action: 'Berdiri dan bersedekap. Baca Fatihah dan Surah. Setelah Surah selesai, lepaskan tangan.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Takbir Qunut',
      action: gender == Gender.male
          ? 'Angkat kedua tangan hingga cuping telinga, baca "Allahu Akbar" dan bersedekap kembali di bawah pusar.'
          : 'Angkat kedua tangan hingga dada, baca "Allahu Akbar" dan bersedekap kembali di dada.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Khusus untuk mazhab Hanafi. Dilakukan sebelum membaca doa Qunut.',
    ));

    // Doa Qunut 1
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Doa Qunut 1',
      action: 'Baca doa Qunut pertama dengan tangan bersedekap.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
      translation: 'Ya Allah! Sesungguhnya kami memohon pertolongan-Mu, memohon ampunan-Mu, dan memohon petunjuk-Mu. Kami beriman kepada-Mu, bertaubat kepada-Mu, dan bertawakal kepada-Mu. Kami memuji-Mu dengan segala kebaikan, kami bersyukur kepada-Mu dan tidak mengingkari nikmat-Mu, serta kami berlepas diri dan meninggalkan orang yang mendurhakai-Mu.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Doa Qunut 2
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Doa Qunut 2',
      action: 'Tepat setelah Qunut 1, lanjutkan membaca doa Qunut kedua dengan tangan bersedekap.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
      translation: 'Ya Allah! Hanya kepada-Mu kami menyembah, hanya untuk-Mu kami shalat dan bersujud. Kepada-Mu kami berusaha dan bergegas melayani. Kami mengharapkan rahmat-Mu dan takut akan siksa-Mu. Sesungguhnya siksa-Mu pasti menimpa orang-orang kafir.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Ruku\'',
      action: 'Ruku\'.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Times)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Bangkit',
      action: 'Bangkit dari Ruku\'.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Sujud Ke-1',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Duduk Antara Dua Sujud',
      action: 'Duduk di antara dua sujud.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Sujud Ke-2',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Duduk Tasyahud Akhir',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Baca At-Tahiyyat, Salli, Barik, dan Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kanan)',
      action: 'Ucapkan Salam ke arah kanan.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kiri)',
      action: 'Ucapkan Salam ke arah kiri untuk menyelesaikan shalat.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: '3 Rakaat Witir Wajib',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildVitirOther(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niat',
      action: 'Saya berniat shalat Witir hari ini karena Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbiratul Ihram',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 1 - Berdiri & Membaca',
      action: 'Baca doa Iftitah. Fatihah dan Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 2 - Berdiri & Membaca',
      action: 'Baca Fatihah dan Al-Kafirun.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 2 - Duduk dan Salam',
      action: 'Duduk, baca At-Tahiyyat, Salli, Barik dan salam. Kemudian berdiri lagi untuk 1 rakaat terakhir.',
      imageKey: '${gender.name}_selam',
      note: 'Dalam mazhab Syafi\'i, Maliki, dan Hanbali, yang paling utama adalah melaksanakan Witir dalam 2+1 rakaat.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 (Tunggal) - Niat & Takbir',
      action: 'Saya berniat shalat rakaat terakhir Witir. Lakukan Takbiratul Ihram.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Berdiri & Membaca',
      action: 'Baca Fatihah dan Al-Ikhlas.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Ruku\'',
      action: 'Ruku\'.',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Bangkit (Qunut)',
      action: mezhep == Mezhep.shafii
          ? 'Pada separuh kedua bulan Ramadhan, setelah bangkit dari ruku\', angkat tangan dan bacalah doa Qunut.'
          : 'Bangkit dari Ruku\'.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allahummahdini fimen hedayt, wa \'afini fimen \'afayt, wa tawallani fimen tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fainnaka taqdi wa la yuqda \'alayk, wa innahu la yadhillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'Ya Allah, berilah aku petunjuk sebagaimana orang yang telah Engkau beri petunjuk, berilah aku keselamatan sebagaimana orang yang telah Engkau beri keselamatan, peliharalah aku sebagaimana orang yang telah Engkau pelihara, berkahilah bagiku apa yang telah Engkau berikan, dan lindungilah aku dari keburukan apa yang telah Engkau tetapkan. Sesungguhnya Engkau yang menetapkan dan tidak ada yang menetapkan atas-Mu. Sesungguhnya tidak akan terhina orang yang Engkau cintai, dan tidak akan mulia orang yang Engkau musuhi. Maha Berkah Engkau, wahai Tuhan kami, dan Maha Tinggi Engkau. Maka bagi-Mu segala puji atas apa yang telah Engkau tetapkan. Aku memohon ampunan kepada-Mu dan bertaubat kepada-Mu. Dan semoga shalawat serta salam senantiasa tercurah kepada junjungan kami Nabi Muhammad, beserta keluarga dan para sahabatnya.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'Dalam mazhab Syafi\'i, membaca doa Qunut setelah ruku\' pada rakaat terakhir shalat Witir selama separuh kedua bulan Ramadhan adalah sunnah.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Sujud Ke-1',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Duduk',
      action: 'Duduk.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 3 - Sujud Ke-2',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Duduk Tasyahud Akhir',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Baca At-Tahiyyat, Salli, Barik, dan Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kanan)',
      action: 'Ucapkan Salam ke arah kanan.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kiri)',
      action: 'Ucapkan Salam ke arah kiri untuk menyelesaikan shalat.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Witir (2+1 Rakaat)',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildBayram(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niat',
      action: 'Saya berniat shalat Id hari ini karena Allah, mengikuti Imam.',
      imageKey: '${gender.name}_niyet',
      note: 'Shalat Idul Fitri dan Idul Adha dilaksanakan dengan cara yang sama persis.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbiratul Ihram',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 1 - Doa Iftitah',
      action: mezhep == Mezhep.shafii
          ? 'Baca doa Veccehtu.'
          : 'Baca doa Subhanaka.',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 1 - Takbir Tambahan (7 Kali)',
        action: 'Angkat kedua tangan sejajar bahu dan baca "Allahu Akbar" 7 kali. Bersedekap setelah setiap takbir. Baca "Subhanallahi wal-hamdulillah..." di antara takbir.',
        arabicText: 'اللهُ أَكْبَرُ (7 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Dibaca sebelum memulai bacaan surah dalam mazhab Syafi\'i.',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 1 - Takbir Tambahan (3 Kali)',
        action: 'Angkat tangan hingga telinga dan baca "Allahu Akbar" 3 kali. Lepaskan tangan ke samping pada takbir ke-1 dan ke-2, lalu bersedekap pada takbir ke-3.',
        arabicText: 'اللهُ أَكْبَرُ (3 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Wajib dalam mazhab Hanafi sebelum membaca surah.',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakaat 1 - Berdiri & Membaca',
      action: 'Baca Fatihah dan Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Takbir Tambahan (5 Kali)',
        action: 'Baca "Allahu Akbar" 5 kali sebelum membaca surah, bersedekap dan membaca tasbih di antara takbir.',
        arabicText: 'اللهُ أَكْبَرُ (5 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Berdiri & Membaca',
        action: 'Baca Fatihah dan Al-Ghasyiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Berdiri & Membaca',
        action: 'Baca Fatihah dan Al-Ghasyiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Takbir Tambahan (3 Kali)',
        action: 'Setelah bacaan surah selesai dan sebelum ruku\', angkat tangan ke telinga 3 kali dan baca "Allahu Akbar", melepaskan tangan setiap kali.',
        arabicText: 'اللهُ أَكْبَرُ (3 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Ruku\'',
        action: 'Baca "Allahu Akbar" untuk keempat kalinya dan ruku\' tanpa mengangkat tangan.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Bangkit',
        action: 'Bangkit dari Ruku\'.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Sujud Ke-1',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Duduk',
        action: 'Duduk.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakaat 2 - Sujud Ke-2',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Duduk Tasyahud Akhir',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Baca At-Tahiyyat, Salli, Barik, dan Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kanan)',
      action: 'Ucapkan Salam ke arah kanan.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kiri)',
      action: 'Selesaikan shalat dengan Salam ke arah kiri.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Shalat Idul Fitri/Adha',
      rakatCount: 2,
      steps: steps,
    );
  }

  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Niat',
      action: 'Saya berniat shalat jenazah karena Allah, bershalawat untuk Nabi, dan berdoa untuk almarhum, mengikuti Imam.',
      imageKey: '${gender.name}_niyet',
      note: 'Shalat jenazah dilakukan sepenuhnya dengan berdiri. Tidak ada ruku\' maupun sujud.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir Ke-1',
      action: gender == Gender.male
          ? 'Angkat tangan hingga ibu jari menyentuh cuping telinga, telapak tangan menghadap kiblat. Baca "Allahu Akbar" dan bersedekap di bawah pusar.'
          : 'Angkat tangan sejajar dada, telapak tangan menghadap kiblat. Baca "Allahu Akbar" dan bersedekap di dada, tangan kanan di atas tangan kiri.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Bacaan Takbir Ke-1',
      action: mezhep == Mezhep.shafii
          ? 'Baca Surah Al-Fatihah di dalam hati.'
          : 'Baca Subhanaka dengan tambahan "wa jalla sanauka".',
      arabicText: mezhep == Mezhep.shafii ? 'Al-Fatiha' : 'Subhanaka (with wa jalla sanauka)',
      imageKey: '${gender.name}_kiyam',
      note: 'Fatihah diwajibkan dalam mazhab Syafi\'i. Dalam mazhab Hanafi, bacaan utamanya adalah Subhanaka.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir Ke-2 & Shalawat',
      action: mezhep == Mezhep.shafii
          ? 'Angkat tangan sejajar bahu, takbir ke-2, bersedekap lagi, dan baca Allahumma Salli serta Barik.'
          : 'Lakukan takbir ke-2 tanpa mengangkat tangan, dan baca Allahumma Salli serta Barik.',
      arabicText: 'Allahumma Salli & Allahumma Barik',
      imageKey: '${gender.name}_kiyam',
      note: 'Mengangkat tangan pada setiap takbir disunnahkan dalam mazhab Syafi\'i.',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir Ke-3 & Doa Jenazah',
      action: 'Lakukan takbir ke-3. Baca doa khusus untuk jenazah.',
      arabicText: 'Funeral Supplication',
      imageKey: '${gender.name}_kiyam',
      note: 'Doa yang tulus dipanjatkan untuk almarhum.',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Takbir Ke-4',
      action: mezhep == Mezhep.shafii
          ? 'Lakukan takbir ke-4, diam sejenak, lalu lepaskan tangan ke samping.'
          : 'Lakukan takbir ke-4 dan segera lepaskan tangan ke samping.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah Maha Besar.',
      imageKey: '${gender.name}_kiyam',
      note: 'Tidak ada doa setelah takbir ke-4, langsung dilanjutkan dengan Salam.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kanan)',
      action: 'Ucapkan Salam ke arah kanan sambil berdiri.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'As-salamu \'alaykum wa rahmatullah.',
      translation: 'Semoga keselamatan dan rahmat Allah senantiasa menyertaimu.',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salam (Kiri)',
      action: 'Ucapkan Salam ke arah kiri untuk menyelesaikan shalat Jenazah.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'As-salamu \'alaykum wa rahmatullah.',
      translation: 'Semoga keselamatan dan rahmat Allah senantiasa menyertaimu.',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'Shalat Jenazah',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakaat $rekat - Ruku\'',
      action: 'Ruku\'.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakaat $rekat - Bangkit',
      action: 'Bangkit dari Ruku\'.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakaat $rekat - Sujud Ke-1',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakaat $rekat - Duduk',
      action: 'Duduk di antara dua sujud.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakaat $rekat - Sujud Ke-2',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPERS ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'Niat: "Saya berniat melaksanakan shalat ${time.name} hari ini ($partName) karena Allah."';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Angkat tangan hingga ibu jari menyentuh cuping telinga, telapak tangan menghadap kiblat. Baca "Allahu Akbar" dan bersedekap di bawah pusar.';
      } else {
        return 'Angkat tangan sejajar bahu, telapak tangan menghadap kiblat. Baca "Allahu Akbar" dan bersedekap di bawah dada (atau lepaskan di mazhab Maliki).';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'Angkat tangan sejajar dada, telapak tangan menghadap kiblat. Baca "Allahu Akbar" dan bersedekap di dada, tangan kanan di atas tangan kiri.';
      } else {
        return 'Angkat tangan sejajar bahu, baca "Allahu Akbar" dan bersedekap di dada.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'Dalam mazhab Syafi\'i, mengangkat tangan sejajar bahu saat Takbir disunnahkan. Telapak tangan harus menghadap kiblat.';
    }
    return 'Pria mengangkat tangan hingga telinga, wanita hingga sejajar dada.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Berdiri tegak. Bersedekap di bawah pusar, tangan kanan memegang pergelangan tangan kiri. Pandangan ke arah tempat sujud.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Berdiri tegak. Bersedekap di bawah dada, di atas pusar.';
      } else {
        structure = 'Berdiri tegak dengan tangan lurus di samping badan (Sadl), atau bersedekap di bawah dada.';
      }
    } else {
      structure = 'Berdiri tegak. Letakkan tangan kanan di atas tangan kiri di dada, tanpa menggenggam. Pandangan ke tempat sujud.';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nBaca doa Iftitah (Veccehtu). Ucapkan Ta\'awudz dan Basmalah, lalu baca Fatihah dan Surah tambahan.';
      } else if (mezhep == Mezhep.maliki) {
        return '$structure\nBaca Fatihah secara langsung tanpa Subhanaka atau Ta\'awudz-Basmalah (dalam shalat fardhu). Kemudian baca Surah tambahan.';
      } else {
        return '$structure\nBaca Subhanaka. Ucapkan Ta\'awudz dan Basmalah, lalu baca Fatihah dan Surah tambahan (Zamm-ı Surah).';
      }
    } else if (rekat == 2) {
      if (mezhep == Mezhep.maliki) {
        return '$structure\nBaca Fatihah dan Surah tambahan secara langsung.';
      }
      return '$structure\nUcapkan Basmalah lalu baca Fatihah dan Surah tambahan.';
    } else {
      if (isFarz) {
        if (mezhep == Mezhep.maliki) {
          return '$structure\nBaca hanya Surah Al-Fatihah. Tidak membaca Surah tambahan.';
        }
        return '$structure\nUcapkan Basmalah lalu baca hanya Surah Al-Fatihah. Tidak membaca Surah tambahan.';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
            return '$structure\nPada rakaat ke-3 shalat Sunnah ini, baca Subhanaka terlebih dahulu, lalu Fatihah dan Surah tambahan.';
          } else {
            return '$structure\nPada rakaat ke-3, ucapkan Basmalah lalu baca Fatihah dan Surah.';
          }
        }
        if (mezhep == Mezhep.maliki) {
          return '$structure\nBaca Fatihah dan Surah tambahan secara langsung.';
        }
        return '$structure\nUcapkan Basmalah lalu baca Fatihah dan Surah tambahan.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('Sunnah Muakkad') || partName.contains('First Sunnah') || partName.contains('Qabliyah')) {
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
        arabic.writeln('[DOA IFTITAH SYAFI\'I (VECCEHTU)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Doa Iftitah Syafi\'i (Veccehtu)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.');
        translation.writeln('[Terjemahan Doa Iftitah Syafi\'i]');
        translation.writeln('Sesungguhnya aku hadapkan wajahku kepada Zat yang menciptakan langit dan bumi dengan keadaan lurus dan pasrah, dan aku bukanlah dari golongan orang-orang musyrik. Sesungguhnya shalatku, ibadahku, hidupku, dan matiku hanyalah untuk Allah, Tuhan semesta alam. Tidak ada sekutu bagi-Nya. Dan demikianlah yang diperintahkan kepadaku, dan aku adalah dari golongan orang-orang muslim.');
      } else {
        arabic.writeln('[DOA SUBHANAKA]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Doa Subhanaka]');
        transcription.writeln('Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa la ilaha ghayruk.');
        translation.writeln('[Terjemahan Doa Subhanaka]');
        translation.writeln('Maha Suci Engkau ya Allah, dan segala puji bagi-Mu. Maha Suci nama-Mu, dan Maha Tinggi keagungan-Mu. Tidak ada tuhan yang berhak disembah selain Engkau.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[SURAH AL-FATIHAH]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْmِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[Al-Fatihah]');
    transcription.writeln('Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.');
    translation.writeln('[Terjemahan Al-Fatihah]');
    translation.writeln('Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang. Segala puji bagi Allah, Tuhan semesta alam. Yang Maha Pengasih lagi Maha Penyayang. Pemilik hari pembalasan. Hanya kepada Engkaulah kami menyembah dan hanya kepada Engkaulah kami mohon pertolongan. Tunjukilah kami jalan yang lurus. (Yaitu) jalan orang-orang yang telah Engkau beri nikmat kepadanya, bukan (jalan) mereka yang dimurkai dan bukan (pula jalan) mereka yang sesat.');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[SURAH TAMBAHAN (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Surah ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[Terjemahan ${zamm.name}]');
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
      return 'Dalam mazhab Syafi\'i, baca Veccehtu menggantikan Subhanaka pada rakaat pertama. Baca Basmalah dengan suara keras pada shalat yang bacaannya dikeraskan.';
    }
    return 'Qiyam adalah berdiri. Sangat dianjurkan untuk menjaga pandangan ke arah tempat sujud agar lebih khusyuk.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Angkat tangan sejajar bahu saat bangkit (Raf\'ul Yadeyn).';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' Dalam mazhab Syafi\'i, baca doa Qunut sambil berdiri pada rakaat ke-2 shalat Subuh.';
    }
    return note.isNotEmpty ? note : 'Bangkit dan diam sejenak (thuma\'ninah) sampai posisi stabil.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Turun untuk sujud. Dahi dan hidung menyentuh lantai. Kaki tegak dengan jari-jari menghadap kiblat. Jauhkan siku dari lantai dan dari lambung, serta jauhkan perut dari paha.';
    } else {
      return 'Turun untuk sujud. Dahi dan hidung menyentuh lantai. Dekatkan siku ke tubuh dan ke lantai, serta dekatkan perut ke paha (posisi lebih merapat).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'Pada duduk tasyahud akhir, duduk di atas pinggul kiri dengan kaki kiri dikeluarkan di bawah kaki kanan (Tawarruk). Tangan berada di atas lutut.';
      }
      return 'Duduk di atas kaki kiri, kaki kanan ditegakkan dengan jari-jari menghadap kiblat (Iftirasy). Tangan berada di lutut.';
    } else {
      return 'Pada kedua duduk, duduk di atas pinggul kiri dengan kedua kaki dikeluarkan ke sisi kanan (Tawarruk). Tangan berada di lutut dengan jari-jari dirapatkan.';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'Baca doa Tasyahud, Salli, Barik, dan Rabbana pada duduk tasyahud akhir.';
    }
    return 'Hanya baca doa Tasyahud (At-Tahiyyat) pada duduk tasyahud awal.';
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
          name: 'Doa Iftitah',
          arabic: 'وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ. إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ. لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ.',
          transcription: 'Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.',
          translation: 'Sesungguhnya aku hadapkan wajahku kepada Zat yang menciptakan langit dan bumi dengan keadaan lurus dan pasrah, dan aku bukanlah dari golongan orang-orang musyrik. Sesungguhnya shalatku, ibadahku, hidupku, dan matiku hanyalah untuk Allah, Tuhan semesta alam. Tidak ada sekutu bagi-Nya. Dan demikianlah yang diperintahkan kepadaku, dan aku adalah dari golongan orang-orang muslim.',
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
