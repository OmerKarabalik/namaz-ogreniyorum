import '../models/prayer_models.dart';

class PrayerDatabaseEn {
  // --- SURAHS AND PRAYERS ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'Subhanaka',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa jalla sanauka (Only in Funeral Prayer). Wa la ilaha ghayruk.',
        translation: 'Glory be to You, O Allah, and all praise. Blessed is Your name, and exalted is Your majesty. Glorious is Your praise (Only in Funeral Prayer), and there is no deity worthy of worship besides You.',
        description: 'This is the opening supplication read in the first rakat of prayers, immediately after the opening tekbir.',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'Al-Fatiha',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. All praise is due to Allah, Lord of the worlds. The Entirely Merciful, the Especially Merciful. Sovereign of the Day of Recompense. It is You we worship and You we ask for help. Guide us to the straight path. The path of those upon whom You have bestowed favor, not of those who have evoked [Your] anger or of those who are astray.',
        description: 'It is the core pillar of prayer, obligatory to be recited in every single rakat.',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'Al-Fil',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Alam tara kayfa fa\'ala rabbuka bi-ashabil-fil. Alam yaj\'al kaydahum fi tadlil. Wa arsala \'alayhim tayran ababil. Tarmihim bi-hijaratin min sijjil. Faja\'alahum ka\'asfin ma\'kul.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. Have you not considered, O Muhammad, how your Lord dealt with the companions of the elephant? Did He not make their plan into misguidance? And He sent against them birds in flocks, striking them with stones of hard clay. And He made them like eaten straw.',
        description: 'One of the short surahs recited as an additional surah (zamm-i surah) in prayers.',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'Quraysh',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Li-ilafi Quraysh. Ilafihim rihlatash-shitai was-sayf. Fal-ya\'budu Rabba hadhal-bayt. Alladhi at\'amahum min ju\'in wa-amanahum min khawf.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. For the accustomed security of the Quraysh. Their accustomed security in the caravan of winter and summer. Let them worship the Lord of this House, Who has fed them, [saving them] from hunger and made them safe, [saving them] from fear.',
        description: 'Recited as an additional surah in prayers.',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'Al-Ma\'un',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Ara-aytal-ladhi yukadhibu bid-din. Fadhanikal-ladhi yadu\'ul-yatim. Wa la yahuddu \'ala ta\'amil-miskin. Fawaylun lil-musallin. Aladhina hum \'an salatihim sahun. Aladhina hum yuraun. Wa yamna\'unal-ma\'un.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. Have you seen the one who denies the Recompense? For that is the one who drives away the orphan, and does not encourage the feeding of the poor. So woe to those who pray [but] who are heedless of their prayer - those who make show [of their deeds] and withhold simple assistance.',
        description: 'Recited as an additional surah in prayers.',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'Al-Kawthar',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'Bismillahir-rahmanir-rahim. Inna a\'taynakal-kawthar. Fa-salli li-Rabbika wanhar. Inna shani-aka huwal-abtar.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. Indeed, We have granted you, O Muhammad, al-Kawthar (abundance). So pray to your Lord and sacrifice [to Him alone]. Indeed, your enemy is the one cut off.',
        description: 'The shortest surah in the Holy Quran.',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'Al-Kafirun',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul ya-ayyuhal-kafirun. La a\'budu ma ta\'budun. Wa la antum \'abiduna ma a\'bud. Wa la ana \'abidun ma \'abadtum. Wa la antum \'abiduna ma a\'bud. Lakum dinukum wa-liya din.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. De ki: O you disbelievers! I do not worship what you worship. Nor are you worshippers of what I worship. Nor will I be a worshipper of what you worship. Nor will you be worshippers of what I worship. For you is your religion, and for me is my religion.',
        description: 'Recited as an additional surah in prayers.',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'An-Nasr',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'Bismillahir-rahmanir-rahim. Idha jaa nasrullahi wal-fath. Wa ra-aytannasa yadkhuluna fi dinillahi afwaja. Fa-sabbih bihamdi Rabbika wastaghfirh. Innahu kana tawwaba.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. When the victory of Allah has come and the conquest, and you see the people entering into the religion of Allah in multitudes, then exalt [Him] with praise of your Lord and ask forgiveness of Him. Indeed, He is ever Accepting of repentance.',
        description: 'Recited as an additional surah in prayers.',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'Al-Masad',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'Bismillahir-rahmanir-rahim. Tabbat yada Abi Lahabin watabb. Ma aghna \'anhu maluhu wama kasab. Sayasla naran dhata lahab. Wamra-atuhu hammalatal-hatab. Fi jidiha hablun min masad.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. May the hands of Abu Lahab be ruined, and ruined is he. His wealth will not avail him or that which he gained. He will [enter to] burn in a Fire of [blazing] flame. And his wife [as well] - the carrier of firewood. Around her neck is a rope of [twisted] fiber.',
        description: 'Recited as an additional surah in prayers.',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'Al-Ikhlas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul huwallahu ahad. Allahus-samad. Lem yalid wa lem yuled. Wa lem yakun lahu kufuwan ahad.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. Say: He is Allah, [who is] One. Allah, the Eternal Refuge. He neither begets nor is born. Nor is there to Him any equivalent.',
        description: 'The core surah defining Islamic Monotheism.',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'Al-Falaq',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbil-falak. Min sharri ma khalaq. Wa min sharri ghasiqin idha waqab. Wa min sharri-naffathati fil-\'uqad. Wa min sharri hasidin idha hasad.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. Say: I seek refuge in the Lord of daybreak. From the evil of that which He created. And from the evil of darkness when it settles. And from the evil of the blowers in knots. And from the evil of an envier when he envies.',
        description: 'Recited for seeking protection from evils.',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'An-Nas',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'Bismillahir-rahmanir-rahim. Kul a\'udhu biRabbinnas. Melikinnas. Ilahinnas. Min sharril-waswasil-khannas. Alladhi yuwaswisu fi sudurinnas. Minal-jinnati wannas.',
        translation: 'In the name of Allah, the Entirely Merciful, the Especially Merciful. Say: I seek refuge in the Lord of mankind. The Sovereign of mankind. The God of mankind. From the evil of the retreating whisperer - Who whispers [evil] into the breasts of mankind - From among the jinn and mankind.',
        description: 'Recited for seeking protection from whispers.',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'Ettehiyyatu',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'At-tahiyyatu lillahi was-salawatu wat-tayyibat. As-salamu \'alayka ayyuhan-nabiyyu wa rahmatullahi wa barakatuh. As-salamu \'alayna wa \'ala \'ibadillahis-salihin. Ashhadu an la ilaha illallahu wa ashhadu anna Muhammadan \'abduhu wa rasuluh.',
        translation: 'All compliments, prayers, and pure deeds are due to Allah. Peace be upon you, O Prophet, and the mercy of Allah and His blessings. Peace be upon us and upon the righteous servants of Allah. I bear witness that there is no deity worthy of worship except Allah, and I bear witness that Muhammad is His servant and His messenger.',
        description: 'Recited in the sitting posture of every prayer.',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'Allahumma Salli',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma salli \'ala Muhammadin wa \'ala ali Muhammad. Kama sallayta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'O Allah, send prayers upon Muhammad and upon the family of Muhammad, as You sent prayers upon Abraham and upon the family of Abraham. Indeed, You are Praiseworthy and Glorious.',
        description: 'Recited in the final sitting posture of prayers.',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'Allahumma Barik',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'Allahumma barik \'ala Muhammadin wa \'ala ali Muhammad. Kama barakta \'ala Ibrahima wa \'ala ali Ibrahim. Innaka Hamidun Majid.',
        translation: 'O Allah, bless Muhammad and the family of Muhammad, as You blessed Abraham and the family of Abraham. Indeed, You are Praiseworthy and Glorious.',
        description: 'Recited in the final sitting posture of prayers.',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'Rabbana',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'Rabbana atina fid-dunya hasanaten wa fil-akhirati hasanaten waqina \'adhaban-nar. Rabbanaghfir li wa li-walidayya wa lil-mu\'minina yawma yaqumul-hisab.',
        translation: 'Our Lord, give us in this world [that which is] good and in the Hereafter [that which is] good and protect us from the punishment of the Fire. Our Lord, forgive me and my parents and the believers the Day the account is established.',
        description: 'Recited at the very end of the final sitting before giving Salaam.',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'Qunut 1 (Hanafi)',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
        translation: 'O Allah! We seek Your help, and ask for Your forgiveness, and seek Your guidance. We believe in You, and repent to You, and put our trust in You. We praise You with all goodness, we thank You and are not ungrateful to You, and we leave and forsake whoever disobeys You.',
        description: 'Recited in the 3rd rakat of Witr prayer in the Hanafi school before bowing (Ruku).',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'Qunut 2 (Hanafi)',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
        translation: 'O Allah! You alone we worship, and to You we pray and prostrate. To You we hasten and rush to serve. We hope for Your mercy and fear Your punishment. Indeed, Your punishment will surely reach the disbelievers.',
        description: 'Recited in the 3rd rakat of Witr prayer in the Hanafi school right after the first Qunut supplication.',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'Qunut (Shafii)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
        translation: 'O Allah, guide me among those whom You have guided. Grant me well-being among those whom You have granted well-being. Befriend me among those whom You have befriended. Bless for me in what You have bestowed. Protect me from the evil of what You have decreed, for indeed You decree and none can decree over You. Indeed, he whom You befriend is never humiliated, and he whom You take as an enemy is never honored. Blessed are You, our Lord, and Exalted. All praise is due to You for what You have decreed. I seek Your forgiveness and repent to You. May the peace and blessings of Allah be upon our Master Muhammad and upon his family and companions.',
        description: 'Recited in the 2nd rakat of Fajr prayer after rising from Ruku in the Shafi\'i school, and during the second half of Ramadan in Witr.',
      ),
    ];
  }

  // --- WUDU (ABLUTION) STEPS ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Intention and Basmala',
      action: 'Make intention mentally: "I intend to perform wudu for the sake of Allah" and say "Bismillahir-rahmanir-rahim".',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Washing the Hands',
      action: 'Wash hands up to the wrists three times, rubbing between fingers. Ensure water reaches under rings.',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Rinsing the Mouth',
      action: 'Rinse the mouth three times with water using the right hand, swirling it thoroughly.',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Rinsing the Nose',
      action: 'Snuff water into the nose three times using the right hand, and blow it out with the left hand.',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Washing the Face',
      action: 'Wash the entire face three times, from the top of the forehead to the bottom of the chin, and from ear to ear. (In Shafi\'i, intention must be made at the beginning of washing the face).',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Washing the Arms',
      action: 'Wash the right arm up to and including the elbow three times, then repeat with the left arm.',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Wiping the Head (Mesh)',
      action: 'Wet the hands and wipe at least a quarter of the head. (In Shafi\'i, wiping even a few hairs is sufficient).',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Washing the Ears',
      action: 'Wipe the inner parts of the ears with the index fingers and the back with the thumbs.',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'Wiping the Neck',
        action: 'Wipe the back of the neck with the back of the fingers (not recommended in Shafi\'i).',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'Washing the Feet',
      action: 'Wash the right foot up to and including the ankles three times, starting with the toes, then do the same for the left foot.',
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
        parts.add(_buildPart(mezhep, gender, '4 Rakat First Sunnah', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Last Sunnah', 2, false, time));
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
        parts.add(_buildPart(mezhep, gender, '4 Rakat First Sunnah', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 Rakat Fard', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 Rakat Last Sunnah', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 Rakat First Sunnah', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (In Congregation)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 Rakat Last Sunnah', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 Rakat First Sunnah', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Fard (In Congregation)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 Rakat Last Sunnah', 2, false, time));
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
      case PrayerTime.sabah: return 'Fajr prayer consists of 2 rakats sunnah and 2 rakats fard.';
      case PrayerTime.ogle: return 'Dhuhr prayer consists of 4 first sunnah, 4 fard, and 2 last sunnah.';
      case PrayerTime.ikindi: return 'Asr prayer consists of 4 sunnah and 4 fard.';
      case PrayerTime.aksam: return 'Maghrib prayer consists of 3 fard and 2 sunnah.';
      case PrayerTime.yatsi: return 'Isha prayer consists of 4 first sunnah, 4 fard, 2 last sunnah, and Vitir.';
      case PrayerTime.cuma: return 'Jumah prayer is performed in congregation during Dhuhr time on Friday.';
      case PrayerTime.bayram: return 'Eid prayer consists of 2 rakats performed on Eid mornings with additional tekbirs.';
      case PrayerTime.cenaze: return 'Funeral prayer is performed entirely standing, asking forgiveness for the deceased.';
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
      note: 'Intention is mentally required. Pronouncing it with the tongue is recommended.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Opening Tekbir',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah is the Greatest.',
      imageKey: '${gender.name}_tekbir',
      note: _getTekbirNote(mezhep, gender),
      audioPath: 'tekbir.mp3',
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
            ? 'Bend down keeping the back straight. Grasp the knees with fingers spread wide. Look at the place of prostration.'
            : 'Bend down slightly (less than men). Place hands on knees with fingers together.',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Times)',
        transcription: 'Subhana Rabbiya\'l-\'Azim',
        translation: 'Glory be to my Lord, the Almighty.',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'Raise hands up to shoulders (Raf\'ul Yadeyn) while going down to Rukû and say "Allahu Akbar".'
            : 'Go down to Rukû saying "Allahu Akbar" without raising hands.',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Rising (I\'tidal)',
        action: 'Stand up completely straight from Rukû.',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'Sami\'allahu liman hamideh.\nRabbana laka\'l-hamd.',
        translation: 'Allah listens to those who praise Him.\nOur Lord, praise is Yours.',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Rakat 2 - Qunut Supplication (Shafi\'i)',
          action: 'After rising from ruku, raise hands to chest level and recite the Qunut supplication (then go to prostration without wiping hands on face).',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.',
          translation: 'O Allah, guide me among those whom You have guided. Grant me well-being among those whom You have granted well-being. Befriend me among those whom You have befriended. Bless for me in what You have bestowed. Protect me from the evil of what You have decreed, for indeed You decree and none can decree over You. Indeed, he whom You befriend is never humiliated, and he whom You take as an enemy is never honored. Blessed are You, our Lord, and Exalted. All praise is due to You for what You have decreed. I seek Your forgiveness and repent to You. May the peace and blessings of Allah be upon our Master Muhammad and upon his family and companions.',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'In the Shafi\'i school, reciting Qunut after rising from ruku in the 2nd rakat of Fajr is a confirmed sunnah (ab\'ad sunnah).',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 1st Prostration',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Times)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Glory be to my Lord, the Most High.',
        imageKey: '${gender.name}_secde',
        note: 'When going to Sujud, touch knees first, then hands, then forehead and nose to the ground.',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - Sitting (Celse)',
        action: gender == Gender.male
            ? 'Sit on the left foot while keeping the right foot upright with toes pointing towards Qibla.'
            : 'Sit on the left hip with both feet coming out to the right side (Tawarruk).',
        imageKey: '${gender.name}_celse',
        note: 'Pausing briefly between the two prostrations is obligatory.',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat $rekat - 2nd Prostration',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 Times)',
        transcription: 'Subhana Rabbiya\'l-A\'la',
        translation: 'Glory be to my Lord, the Most High.',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Final Sitting',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'Read At-Tahiyyat, Allahumma Salli, Barik and Rabbana.',
          transcription: 'Recite Tashahhud supplications.',
          translation: 'You can access full translations in the Supplications tab.',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salaam (Right)',
          action: 'Turn the head to the right and say "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'May the peace and mercy of Allah be upon you.',
          imageKey: '${gender.name}_selam',
          note: 'Look at the shoulders. Sağa selam is fard in Shafi\'i.',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'Salaam (Left)',
          action: 'Turn the head to the left and say "As-salamu \'alaykum wa rahmatullah".',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'As-salamu \'alaykum wa rahmatullah.',
          translation: 'May the peace and mercy of Allah be upon you.',
          imageKey: '${gender.name}_selam_sol',
          note: 'Complete the prayer with Salaam to the left.',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'First Sitting',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'Recite At-Tahiyyat.',
          transcription: 'At-tahiyyatu lillahi...',
          translation: 'Only At-Tahiyyat supplication is read.',
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
      action: 'I intend to pray today\'s 3 rakat Vitir prayer for the sake of Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Opening Tekbir',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Qira\'at',
      action: 'Recite Subhanaka, Fatiha, and an additional Surah.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Qira\'at',
      action: 'Recite Fatiha and an additional Surah.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - First Sitting',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'Recite At-Tahiyyat and stand back up.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam (Before Qunut)',
      action: 'Stand up and bind hands. Recite Fatiha and a Surah. After the Surah ends, release hands.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qunut Tekbir',
      action: gender == Gender.male
          ? 'Raise hands to earlobes, say "Allahu Akbar" and bind them again under the navel.'
          : 'Raise hands to chest level, say "Allahu Akbar" and bind them again on the chest.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'Specific to the Hanafi school. Taken before Qunut supplication.',
    ));

    // Qunut 1 Supplication
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qunut 1 Supplication',
      action: 'Recite the first Qunut supplication with hands folded.',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'Allahumma inna nastainuka wa nastaghfiruka wa nastahdika, wa nu\'minu bika wa natubu ilayk, wa natawakkalu alayk, wa nuthni alaykal-khayra kullahu, nashkuruka wa la nakfuruk, wa nakhla\'u wa natruku man yafjuruk.',
      translation: 'O Allah! We seek Your help, and ask for Your forgiveness, and seek Your guidance. We believe in You, and repent to You, and put our trust in You. We praise You with all goodness, we thank You and are not ungrateful to You, and we leave and forsake whoever disobeys You.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // Qunut 2 Supplication
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qunut 2 Supplication',
      action: 'Immediately following Qunut 1, recite the second Qunut supplication with hands folded.',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'Allahumma iyyaka na\'budu, wa laka nusalli wa nasjud, wa ilayka nas\'a wa nahfid, narju rahmataka wa nakhsha \'adhabak, inna \'adhabaka bil-kaffirina mulhiq.',
      translation: 'O Allah! You alone we worship, and to You we pray and prostrate. To You we hasten and rush to serve. We hope for Your mercy and fear Your punishment. Indeed, Your punishment will surely reach the disbelievers.',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'Go to Rukû.',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 Times)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rising',
      action: 'Rise from Rukû.',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1st Prostration',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Sitting',
      action: 'Sit between prostrations.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2nd Prostration',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Final Sitting',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'Recite At-Tahiyyat, Salli, Barik and Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Right)',
      action: 'Give Salaam to the right.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Left)',
      action: 'Give Salaam to the left to complete the prayer.',
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
      title: 'Intention (Niyyah)',
      action: 'I intend to pray today\'s Vitir prayer for the sake of Allah.',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Opening Tekbir',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Qira\'at',
      action: 'Recite opening supplication. Fatiha and Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Qiyam & Qira\'at',
      action: 'Recite Fatiha and Al-Kafirun.',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 2 - Sitting and Salaam',
      action: 'Sit, recite At-Tahiyyat, Salli, Barik and give Salaam. Then stand back up for the final 1 rakat.',
      imageKey: '${gender.name}_selam',
      note: 'In Shafi\'i, Maliki, and Hanbali schools, it is most virtous to perform Vitir in 2+1 rakats.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 (Single) - Intention & Tekbir',
      action: 'I intend to pray the final rakat of Vitir prayer. Take opening Tekbir.',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Qiyam & Qira\'at',
      action: 'Recite Fatiha and Al-Ikhlas.',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rukû',
      action: 'Go to Rukû.',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Rising (Qunut)',
      action: mezhep == Mezhep.shafii
          ? 'In the second half of Ramadan, after rising from ruku, raise hands and recite the Qunut supplication.'
          : 'Rise from Rukû.',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'Allahummahdini fiman hadayt, wa \'afini fiman \'afayt, wa tawallani fiman tawallayt, wa barik li fima a\'tayt, wa qini sharra ma qadayt, fa\'innaka taqdi wa la yuqda \'alayk, wa innahu la yazillu man walayt, wa la ya\'izzu man \'adayt, tabarakta rabbana wa ta\'alayt, falakal-hamdu \'ala ma qadayt, astaghfiruka wa atubu ilayk, wa sallallahu \'ala sayyidina Muhammadin wa \'ala alihi wa sahbihi wa sallam.'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'O Allah, guide me among those whom You have guided. Grant me well-being among those whom You have granted well-being. Befriend me among those whom You have befriended. Bless for me in what You have bestowed. Protect me from the evil of what You have decreed, for indeed You decree and none can decree over You. Indeed, he whom You befriend is never humiliated, and he whom You take as an enemy is never honored. Blessed are You, our Lord, and Exalted. All praise is due to You for what You have decreed. I seek Your forgiveness and repent to You. May the peace and blessings of Allah be upon our Master Muhammad and upon his family and companions.'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'In the Shafi\'i school, reciting Qunut after rising from ruku in the final rakat of Witr during the second half of Ramadan is Sunnah.'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 1st Prostration',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - Sitting',
      action: 'Sit.',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 3 - 2nd Prostration',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Final Sitting',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Recite At-Tahiyyat, Salli, Barik and Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Right)',
      action: 'Give Salaam to the right.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Left)',
      action: 'Give Salaam to the left to complete the prayer.',
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
      title: 'Intention (Niyyah)',
      action: 'I intend to pray today\'s Eid prayer for the sake of Allah, following the present Imam.',
      imageKey: '${gender.name}_niyet',
      note: 'Eid al-Fitr and Eid al-Adha prayers are performed in exactly the same way.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Opening Tekbir',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Opening Supplication',
      action: mezhep == Mezhep.shafii
          ? 'Recite Veccehtu duası.'
          : 'Recite Subhanaka duası.',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Additional Tekbirs (7 Times)',
        action: 'Raise hands up to shoulders and say "Allahu Akbar" 7 times. Bind hands after each tekbir. Recite "Subhanallahi wal-hamdulillah..." in between.',
        arabicText: 'اللهُ أَكْبَرُ (7 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Recited before starting Qira\'at in the Shafi\'i school.',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 1 - Additional Tekbirs (3 Times)',
        action: 'Raise hands up to ears and say "Allahu Akbar" 3 times. Release hands to the sides on the 1st and 2nd tekbir, and bind them on the 3rd.',
        arabicText: 'اللهُ أَكْبَرُ (3 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'Wajib in the Hanafi school before Qira\'at.',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Rakat 1 - Qiyam & Qira\'at',
      action: 'Recite Fatiha and Al-A\'la.',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Additional Tekbirs (5 Times)',
        action: 'Recite "Allahu Akbar" 5 times before Qira\'at, binding hands and reciting tasbih in between.',
        arabicText: 'اللهُ أَكْبَرُ (5 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Qira\'at',
        action: 'Recite Fatiha and Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Qiyam & Qira\'at',
        action: 'Recite Fatiha and Al-Ghashiyah.',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Additional Tekbirs (3 Times)',
        action: 'After Qira\'at is complete and before going to Rukû, raise hands to ears 3 times and say "Allahu Akbar", letting hands hang on each.',
        arabicText: 'اللهُ أَكْبَرُ (3 Times)',
        transcription: 'Allahu Akbar',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Going to Rukû',
        action: 'Say "Allahu Akbar" a 4th time and go down to Rukû without raising hands.',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Rising',
        action: 'Rise from Rukû.',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 1st Prostration',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - Sitting',
        action: 'Sit.',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'Rakat 2 - 2nd Prostration',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Final Sitting',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'Recite At-Tahiyyat, Salli, Barik and Rabbana.',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Right)',
      action: 'Give Salaam to the right.',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Left)',
      action: 'Give Salaam to the left.',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'Eid Prayer',
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
      action: 'I intend to pray the Funeral prayer for the sake of Allah, salawat for the Prophet, and supplication for the deceased, following the present Imam.',
      imageKey: '${gender.name}_niyet',
      note: 'Funeral prayer is performed entirely standing. It has no rükû or prostration.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1st Tekbir',
      action: gender == Gender.male
          ? 'Raise hands to earlobes, say "Allahu Akbar" and bind them under the navel.'
          : 'Raise hands to chest level, say "Allahu Akbar" and bind them on the chest.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '1st Tekbir Recitation',
      action: mezhep == Mezhep.shafii
          ? 'Recite Fatiha Suresi silently.'
          : 'Recite Subhanaka with "wa jalla sanauka" phrase.',
      arabicText: mezhep == Mezhep.shafii ? 'Al-Fatiha' : 'Subhanaka (with wa jalla sanauka)',
      imageKey: '${gender.name}_kiyam',
      note: 'Fatiha is fard in the Shafi\'i school. In Hanafi, Subhanaka is the primary recitation.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '2nd Tekbir & Salavat',
      action: mezhep == Mezhep.shafii
          ? 'Raise hands to shoulders, take the 2nd tekbir, bind them again, and recite Allahumma Salli and Barik.'
          : 'Take 2nd tekbir without raising hands, and recite Allahumma Salli and Barik.',
      arabicText: 'Allahumma Salli & Allahumma Barik',
      imageKey: '${gender.name}_kiyam',
      note: 'Raising hands in every tekbir is sunnah in Shafi\'i.',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '3rd Tekbir & Funeral Dua',
      action: 'Take the 3rd tekbir. Recite the special Funeral supplication for the deceased.',
      arabicText: 'Funeral Supplication',
      imageKey: '${gender.name}_kiyam',
      note: 'Sincere prayers are made for the deceased.',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: '4th Tekbir',
      action: mezhep == Mezhep.shafii
          ? 'Take the 4th tekbir, pause briefly standing, then release hands to the sides.'
          : 'Take the 4th tekbir and release hands to the sides immediately.',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'Allahu Akbar',
      translation: 'Allah is the Greatest.',
      imageKey: '${gender.name}_kiyam',
      note: 'No supplication is read after the 4th tekbir, proceed directly to Salaam.',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Right)',
      action: 'Give Salaam to the right standing.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'As-salamu \'alaykum wa rahmatullah.',
      translation: 'May the peace and mercy of Allah be upon you.',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'Salaam (Left)',
      action: 'Give Salaam to the left to complete the Funeral prayer.',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'As-salamu \'alaykum wa rahmatullah.',
      translation: 'May the peace and mercy of Allah be upon you.',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'Funeral Prayer',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Rukû',
      action: 'Go to Rukû.',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Rising',
      action: 'Rise from Rukû.',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 1st Prostration',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - Sitting',
      action: 'Sit between prostrations.',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'Rakat $rekat - 2nd Prostration',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPERS ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'Make intention: "I intend to perform today\'s ${time.name} prayer ($partName) for the sake of Allah."';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'Raise hands until thumbs touch the earlobes, with palms facing Qibla. Say "Allahu Akbar" and bind them below the navel.';
      } else {
        return 'Raise hands to shoulder level with palms facing Qibla. Say "Allahu Akbar" and bind them under the chest (or let them hang in Maliki).';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'Raise hands up to chest level with palms facing Qibla. Say "Allahu Akbar" and bind them on the chest, right hand over left.';
      } else {
        return 'Raise hands to shoulder level, say "Allahu Akbar" and bind them on the chest.';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'In Shafi\'i, raising hands to shoulder level during Tekbir is sunnah. Palms must face Qibla.';
    }
    return 'Men raise hands to ears, women to chest level.';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'Stand straight. Bind hands below the navel, right hand grasping left wrist. Keep eyes on the place of prostration.';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'Stand straight. Bind hands below the chest, above the navel (heart level).';
      } else {
        structure = 'Stand straight with arms hanging at sides (Sadl), or bind them below the chest.';
      }
    } else {
      structure = 'Stand straight. Place right hand over left on the chest, without grasping. Keep eyes on prostration spot.';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nRecite opening supplication (Veccehtu). Say Euzü-Besmele and recite Fatiha, then recite an additional Surah.';
      } else if (mezhep == Mezhep.maliki) {
        return '$structure\nRecite Fatiha directly without Subhanaka or Euzü-Besmele (in farz prayers). Then recite an additional Surah.';
      } else {
        return '$structure\nRecite Subhanaka. Say Euzü-Besmele and recite Fatiha, then recite an additional Surah (Zamm-ı Surah).';
      }
    } else if (rekat == 2) {
      if (mezhep == Mezhep.maliki) {
        return '$structure\nRecite Fatiha and an additional Surah directly.';
      }
      return '$structure\nSay Besmele and recite Fatiha and an additional Surah.';
    } else {
      if (isFarz) {
        if (mezhep == Mezhep.maliki) {
          return '$structure\nRecite only Fatiha Suresi. Additional Surah is not recited.';
        }
        return '$structure\nSay Besmele and recite only Fatiha Suresi. Additional Surah is not recited.';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
            return '$structure\nIn the 3rd rakat of these Sunnahs, recite Subhanaka first, then Fatiha and a Surah.';
          } else {
            return '$structure\nIn the 3rd rakat, say Besmele and recite Fatiha and a Surah.';
          }
        }
        if (mezhep == Mezhep.maliki) {
          return '$structure\nRecite Fatiha and an additional Surah.';
        }
        return '$structure\nSay Besmele and recite Fatiha and an additional Surah.';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('First Sunnah')) {
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
        arabic.writeln('[SHAFI\'I OPENING SUPPLICATION (VECCEHTÜ)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[Shafi\'i Opening Supplication (Veccehtü)]');
        transcription.writeln('Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.');
        translation.writeln('[Shafi\'i Opening Supplication Translation]');
        translation.writeln('Indeed, I have turned my face toward He who created the heavens and the earth, inclining toward truth, and I am not of those who associate partners with Allah. Indeed, my prayer, my rites, my living, and my dying are for Allah, Lord of the worlds. No partner has He. And this I have been commanded, and I am of the Muslims.');
      } else {
        arabic.writeln('[SUBHANAKA SUPPLICATION]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[Subhanaka Supplication]');
        transcription.writeln('Subhanakallahumma wa bihamdika. Wa tabarakasmuka. Wa ta\'ala jadduka. Wa la ilaha ghayruk.');
        translation.writeln('[Subhanaka Supplication Translation]');
        translation.writeln('Glory be to You, O Allah, and all praise. Blessed is Your name, and exalted is Your majesty. There is no deity worthy of worship besides You.');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[AL-FATIHA SURAH]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْmِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[Al-Fatiha]');
    transcription.writeln('Bismillahir-rahmanir-rahim. Alhamdu lillahi Rabbil-\'alamin. Ar-Rahmanir-Rahim. Maliki yawmid-din. Iyyaka na\'budu wa iyyaka nasta\'in. Ihdinas-siratal-mustaqim. Siratal-ladhina an\'amta \'alayhim, ghayril-maghdubi \'alayhim walad-dallin.');
    translation.writeln('[Al-Fatiha Translation]');
    translation.writeln('In the name of Allah, the Entirely Merciful, the Especially Merciful. All praise is due to Allah, Lord of the worlds. The Entirely Merciful, the Especially Merciful. Sovereign of the Day of Recompense. It is You we worship and You we ask for help. Guide us to the straight path. The path of those upon whom You have bestowed favor, not of those who have evoked [Your] anger or of those who are astray.');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[ADDITIONAL SURAH (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[Surah ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[${zamm.name} Translation]');
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
      return 'In Shafi\'i, recite Veccehtu instead of Subhanaka in the 1st rakat. Recite Basmala aloud in aloud-recited prayers.';
    }
    return 'Qiyam is standing. Keeping eyes on the spot of prostration is highly recommended for focus.';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'Raise hands to shoulder level when rising (Raf\'ul Yadeyn).';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' In Shafi\'i, recite Qunut supplication standing in the 2nd rakat of Fajr.';
    }
    return note.isNotEmpty ? note : 'Rise and pause briefly to be completely settled.';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'Go down to prostration (Sujud). Forehead and nose touch the ground. Feet remain upright with toes pointing Qibla. Keep elbows off the ground and away from sides, and abdomen away from thighs.';
    } else {
      return 'Go down to prostration. Forehead and nose touch the ground. Keep elbows close to the body and touching the ground, with abdomen close to thighs (contracted posture).';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'In the final sitting, sit on the left hip with the left foot coming out under the right leg (Tawarruk). Hands rest on knees.';
      }
      return 'Sit on the left foot, keeping the right foot upright with toes pointing to Qibla (Iftirish). Hands rest on knees.';
    } else {
      return 'In both sittings, sit on the left hip with feet extending to the right side (Tawarruk). Hands rest on knees with fingers together.';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'Recite Tashahhud, Salli, Barik and Rabbana supplications in the final sitting.';
    }
    return 'Recite only Tashahhud (At-Tahiyyat) supplication in the first sitting.';
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
          transcription: 'Veccehtü vechiye lillezî faterassemâvâti vel-arda hanîfen vemâ ene minel-müşrikîn. İnne salâtî ve nüsükî ve mahyâye ve memâtî lillâhi rabbil\'âlemîn. Lâ şerîke lehû ve bizâlike ümirtü ve ene minel-müslimîn.',
          translation: 'Indeed, I have turned my face toward He who created the heavens and the earth, inclining toward truth, and I am not of those who associate partners with Allah. Indeed, my prayer, my rites, my living, and my dying are for Allah, Lord of the worlds. No partner has He. And this I have been commanded, and I am of the Muslims.',
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
