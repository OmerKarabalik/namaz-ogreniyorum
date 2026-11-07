import '../models/prayer_models.dart';

class PrayerDatabaseUr {
  // --- SURAHS AND PRAYERS ---
  static List<DuaSurah> getDuaSurahs() {
    return [
      DuaSurah(
          audioFileName: 'subhaneke.mp3',
          name: 'سبحانک',
          arabic: 'سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ. وَتَبَارَكَ اسْمُكَ. وَتَعَالَى جَدُّكَ. وَجَلَّ ثَنَاؤُكَ (Sadece cenaze namazında). وَلَا إِلَهَ غَيْرُكَ.',
          transcription: 'سبحانک اللھم وبحمدک۔ وتبارک اسمک۔ وتعالٰی جدک۔ وجل ثناؤک (صرف نماز جنازہ میں)۔ ولا الہ غیرک۔',
        translation: 'اے اللہ! تو پاک ہے اور سب تعریفیں تیرے ہی لئے ہیں۔ تیرا نام برکت والا ہے، اور تیری شان بہت بلند ہے۔ تیری تعریف بہت عظیم ہے (صرف نماز جنازہ میں)، اور تیرے سوا کوئی عبادت کے لائق نہیں۔',
        description: 'یہ ابتدائی دعا ہے جو نماز کی پہلی رکعت میں تکبیر تحریمہ کے فوراً بعد پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'fatiha.mp3',
          name: 'سورۃ الفاتحہ',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ. الرَّحْمَٰنِ الرَّحِيمِ. مَالِكِ يَوْمِ الدِّينِ. إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَعِينُ. اهْدِنَا الصِّرَاطَ الْمُسْتَقِيمَ. صِرَاطَ الَّذِينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالِّينَ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ الحمد للہ رب العالمین۔ الرحمٰن الرحیم۔ مالک یوم الدین۔ ایاک نعبد و ایاک نستعین۔ اھدنا الصراط المستقیم۔ صراط الذین انعمت علیھم غیر المغضوب علیھم ولا الضالین۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ سب تعریفیں اللہ کے لئے ہیں جو تمام جہانوں کا پالنے والا ہے۔ نہایت مہربان، رحم والا ہے۔ روزِ جزا کا مالک ہے۔ ہم صرف تیری ہی عبادت کرتے ہیں اور صرف تجھ ہی سے مدد مانگتے ہیں۔ ہمیں سیدھا راستہ دکھا۔ ان لوگوں کا راستہ جن پر تو نے انعام کیا، نہ کہ ان لوگوں کا جن پر تیرا غضب ہوا اور نہ گمراہوں کا۔',
        description: 'یہ نماز کا بنیادی رکن ہے، ہر رکعت میں اس کا پڑھنا فرض ہے۔',
      ),
      DuaSurah(
          audioFileName: 'fil.mp3',
          name: 'سورۃ الفیل',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَلَمْ تَرَ كَيْفَ فَعَلَ رَبُّكَ بِأَصْحَابِ الْفِيلِ. أَلَمْ يَجْعَلْ كَيْدَهُمْ فِي تَضْلِيلٍ. وَأَرْسَلَ عَلَيْهِمْ طَيْرًا أَبَابِيلَ. تَرْمِيهِم بِحِجَارَةٍ مِّن سِجِّيلٍ. فَجَعَلَهُمْ كَعَصْفٍ مَّأْكُولٍ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ الم تر کیف فعل ربک باصحاب الفیل۔ الم یجعل کیدھم فی تضلیل۔ وارسل علیھم طیرًا ابابیل۔ ترمیھم بحجارۃ من سجیل۔ فجعلھم کعصف ماکول۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ (اے نبی) کیا آپ نے نہیں دیکھا کہ آپ کے رب نے ہاتھی والوں کے ساتھ کیا سلوک کیا؟ کیا اس نے ان کی چال کو ناکام نہیں کر دیا؟ اور ان پر پرندوں کے جھنڈ کے جھنڈ بھیج دیے۔ جو ان پر پکی ہوئی مٹی کے پتھر مارتے تھے۔ پھر انہیں کھائے ہوئے بھوسے کی طرح کر دیا۔',
        description: 'یہ ان چھوٹی سورتوں میں سے ایک ہے جو نماز میں (ضم سورہ کے طور پر) پڑھی جاتی ہیں۔',
      ),
      DuaSurah(
          audioFileName: 'kureys.mp3',
          name: 'سورۃ قریش',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. لِإِيلَافِ قُرَيْشٍ. إِيلَافِهِمْ رِحْلَةَ الشِّتَاءِ وَالصَّيْفِ. فَلْيَعْبُدُوا رَبَّ هَٰذَا الْبَيْتِ. الَّذِي أَطْعَمَهُم مِّن جُوعٍ وَآمَنَهُم مِّنْ خَوْفٍ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ لایلاف قریش۔ ایلافھم رحلۃ الشتاء والصیف۔ فلیعبدوا رب ھذا البیت۔ الذی اطعمھم من جوع وامنھم من خوف۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ چونکہ قریش مانوس ہوئے۔ (یعنی) سردی اور گرمی کے سفر سے ان کے مانوس ہونے کے باعث۔ تو انہیں چاہیے کہ اس گھر (کعبہ) کے رب کی عبادت کریں۔ جس نے انہیں بھوک میں کھانا دیا اور خوف سے امن بخشا۔',
        description: 'نماز میں ایک اضافی سورہ کے طور پر پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'maun.mp3',
          name: 'سورۃ الماعون',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. أَرَأَيْتَ الَّذِي يُكَذِّبُ بِالدِّينِ. فَذَٰلِكَ الَّذِي يَدُعُّ الْيَتِيمَ. وَلَا يَحُضُّ عَلَىٰ طَعَامِ الْمِسْكِينِ. فَوَيْلٌ لِّلْمُصَلِّينَ. الَّذِينَ هُمْ عَن صَلَاتِهِمْ سَاهُونَ. الَّذِينَ هُمْ يُرَاءُونَ. وَيَمْنَعُونَ الْمَاعُونَ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ ارایت الذی یکذب بالدین۔ فذلک الذی یدع الیتیم۔ ولا یحض علی طعام المسکین۔ فویل للمصلین۔ الذین ھم عن صلاتھم ساھون۔ الذین ھم یراؤون۔ و یمنعون الماعون۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ کیا تم نے اس شخص کو دیکھا جو روزِ جزا کو جھٹلاتا ہے؟ تو یہ وہی ہے جو یتیم کو دھکے دیتا ہے۔ اور مسکین کو کھانا کھلانے کی ترغیب نہیں دیتا۔ پس ہلاکت ہے ان نمازیوں کے لئے۔ جو اپنی نمازوں سے غافل ہیں۔ جو دکھاوا کرتے ہیں۔ اور عام استعمال کی چیزیں (مانگنے پر بھی) نہیں دیتے۔',
        description: 'نماز میں ایک اضافی سورہ کے طور پر پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'kevser.mp3',
          name: 'سورۃ الکوثر',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِنَّا أَعْطَيْنَاكَ الْكَوْثَرَ. فَصَلِّ لِرَبِّكَ وَانْحَرْ. إِنَّ شَانِئَكَ هُوَ الْأَبْتَرُ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ انا اعطیناک الکوثر۔ فصل لربک وانحر۔ ان شانئک ھو الابتر۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ بے شک ہم نے آپ کو کوثر (بے شمار بھلائیاں) عطا فرمائی ہے۔ پس آپ اپنے رب کے لئے نماز پڑھیں اور قربانی کریں۔ بے شک آپ کا دشمن ہی جڑ کٹا (بے نام و نشان) ہے۔',
        description: 'یہ قرآن مجید کی سب سے چھوٹی سورہ ہے۔',
      ),
      DuaSurah(
          audioFileName: 'kafirun.mp3',
          name: 'سورۃ الکافرون',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ يَا أَيُّهَا الْكَافِرُونَ. لَا أَعْبُدُ مَا تَعْبُدُونَ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ. وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ. لَكُمْ دِينُكُمْ وَلِيَ دِينِ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ قل یا ایھا الکافرون۔ لا اعبد ما تعبدون۔ ولا انتم عابدون ما اعبد۔ ولا انا عابد ما عبدتم۔ ولا انتم عابدون ما اعبد۔ لکم دینکم ولی دین۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ آپ کہہ دیجیے کہ اے کافرو! میں ان کی عبادت نہیں کرتا جن کی تم عبادت کرتے ہو۔ اور نہ تم اس کی عبادت کرنے والے ہو جس کی میں عبادت کرتا ہوں۔ اور نہ میں ان کی عبادت کروں گا جن کی تم نے عبادت کی۔ اور نہ تم اس کی عبادت کرو گے جس کی میں عبادت کرتا ہوں۔ تمہارے لئے تمہارا دین ہے اور میرے لئے میرا دین۔',
        description: 'نماز میں ایک اضافی سورہ کے طور پر پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'nasr.mp3',
          name: 'سورۃ النصر',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. إِذَا جَاءَ نَصْرُ اللَّهِ وَالْفَتْحُ. وَرَأَيْتَ النَّاسَ يَدْخُلُونَ فِي دِينِ اللَّهِ أَفْوَاجًا. فَسَبِّحْ بِحَمْدِ رَبِّكَ وَاسْتَغْفِرْهُ ۚ إِنَّهُ كَانَ تَوَّابًا.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ اذا جاء نصر اللہ والفتح۔ ورایت الناس یدخلون فی دین اللہ افواجا۔ فسبح بحمد ربک واستغفرہ۔ انہ کان توابا۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ جب اللہ کی مدد اور فتح آ جائے۔ اور آپ لوگوں کو دیکھیں کہ وہ اللہ کے دین میں جوق در جوق داخل ہو رہے ہیں۔ تو اپنے رب کی حمد کے ساتھ تسبیح کریں اور اس سے مغفرت مانگیں۔ بے شک وہ بہت توبہ قبول کرنے والا ہے۔',
        description: 'نماز میں ایک اضافی سورہ کے طور پر پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'tebbet.mp3',
          name: 'سورۃ المسد',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. تَبَّتْ يَدَا أَبِي لَهَبٍ وَتَبَّ. مَا أَغْنَىٰ عَنْهُ مَالُهُ وَمَا كَسَبَ. سَيَصْلَىٰ نَارًا ذَاتَ لَهَبٍ. وَامْرَأَتُهُ حَمَّالَةَ الْحَطَبِ. فِي جِيدِهَا حَبْلٌ مِّن مَّسَدٍ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ تبت یدا ابی لھب وتب۔ ما اغنی عنہ مالہ وما کسب۔ سیصلی نارا ذات لھب۔ وامراتہ حمالۃ الحطب۔ فی جیدھا حبل من مسد۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ ابو لہب کے دونوں ہاتھ ٹوٹ جائیں اور وہ ہلاک ہو جائے۔ اس کا مال اور جو اس نے کمایا اس کے کچھ کام نہ آیا۔ وہ جلد ہی بھڑکتی ہوئی آگ میں داخل ہوگا۔ اور اس کی بیوی بھی جو لکڑیاں ڈھونے والی ہے۔ اس کی گردن میں کھجور کی چھال کی بٹی ہوئی رسی ہوگی۔',
        description: 'نماز میں ایک اضافی سورہ کے طور پر پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'ihlas.mp3',
          name: 'سورۃ الاخلاص',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ هُوَ اللَّهُ أَحَدٌ. اللَّهُ الصَّمَدُ. لَمْ يَلِدْ وَلَمْ يُولَدْ. وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ قل ھو اللہ احد۔ اللہ الصمد۔ لم یلد ولم یولد۔ ولم یکن لہ کفوا احد۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ آپ فرما دیجیے کہ وہ اللہ ایک ہے۔ اللہ بے نیاز ہے۔ نہ اس کی کوئی اولاد ہے اور نہ وہ کسی کی اولاد ہے۔ اور اس کے برابر کا کوئی نہیں ہے۔',
        description: 'اسلامی توحید کو بیان کرنے والی بنیادی سورہ۔',
      ),
      DuaSurah(
          audioFileName: 'felak.mp3',
          name: 'سورۃ الفلق',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ. مِن شَرِّ مَا خَلَقَ. وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ. وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ. وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ قل اعوذ برب الفلق۔ من شر ما خلق۔ ومن شر غاسق اذا وقب۔ ومن شر النفاثات فی العقد۔ ومن شر حاسد اذا حسد۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ آپ کہہ دیجیے کہ میں صبح کے رب کی پناہ مانگتا ہوں۔ ہر اس چیز کے شر سے جو اس نے پیدا کی ہے۔ اور اندھیری رات کے شر سے جب وہ چھا جائے۔ اور گرہوں میں پھونک مارنے والیوں کے شر سے۔ اور حسد کرنے والے کے شر سے جب وہ حسد کرے۔',
        description: 'شر سے پناہ مانگنے کے لئے پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'nas.mp3',
          name: 'سورۃ الناس',
          arabic: 'بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيمِ. قُلْ أَعُوذُ بِرَبِّ النَّاسِ. مَلِكِ النَّاسِ. إِلَٰهِ النَّاسِ. مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ. الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ. مِنَ الْجِنَّةِ وَالنَّاسِ.',
          transcription: 'بسم اللہ الرحمٰن الرحیم۔ قل اعوذ برب الناس۔ ملک الناس۔ الہ الناس۔ من شر الوسواس الخناس۔ الذی یوسوس فی صدور الناس۔ من الجنۃ والناس۔',
        translation: 'اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ آپ کہہ دیجیے کہ میں لوگوں کے رب کی پناہ مانگتا ہوں۔ لوگوں کے بادشاہ کی۔ لوگوں کے معبود کی۔ پیچھے ہٹ جانے والے وسوسہ ڈالنے والے کے شر سے۔ جو لوگوں کے سینوں میں وسوسہ ڈالتا ہے۔ خواہ وہ جنوں میں سے ہو یا انسانوں میں سے۔',
        description: 'وسوسوں سے پناہ مانگنے کے لئے پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'ettehiyyatu.mp3',
          name: 'التحیات',
          arabic: 'التَّحِيَّاتُ لِلَّهِ وَالصَّلَوَاتُ وَالطَّيِّبَاتُ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللَّهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَى عِبَادِ اللَّهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا اللَّهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهُ وَرَسُولُهُ.',
          transcription: 'التحیات للہ والصلوات والطیبات۔ السلام علیک ایھا النبی ورحمۃ اللہ وبرکاتہ۔ السلام علینا وعلی عباد اللہ الصالحین۔ اشھد ان لا الہ الا اللہ واشھد ان محمدا عبدہ ورسولہ۔',
        translation: 'تمام زبانی، بدنی اور مالی عبادتیں اللہ ہی کے لئے ہیں۔ اے نبی! آپ پر سلامتی ہو اور اللہ کی رحمت اور اس کی برکتیں نازل ہوں۔ ہم پر اور اللہ کے تمام نیک بندوں پر سلامتی ہو۔ میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں، اور میں گواہی دیتا ہوں کہ محمد (صلی اللہ علیہ وسلم) اس کے بندے اور رسول ہیں۔',
        description: 'نماز کے ہر قعدہ (بیٹھنے کی حالت) میں پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'salli.mp3',
          name: 'درود ابراہیمی 1',
          arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'اللھم صل علی محمد وعلی آل محمد۔ کما صلیت علی ابراھیم وعلی آل ابراھیم۔ انک حمید مجید۔',
        translation: 'اے اللہ! محمد (صلی اللہ علیہ وسلم) اور ان کی آل پر رحمت نازل فرما، جیسا کہ تو نے ابراہیم (علیہ السلام) اور ان کی آل پر رحمت نازل فرمائی۔ بے شک تو تعریف کے لائق اور بزرگ ہے۔',
        description: 'نماز کے آخری قعدہ میں پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'barik.mp3',
          name: 'درود ابراہیمی 2',
          arabic: 'اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ. كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ. إِنَّكَ حَمِيدٌ مَجِيدٌ.',
          transcription: 'اللھم بارک علی محمد وعلی آل محمد۔ کما بارکت علی ابراھیم وعلی آل ابراھیم۔ انک حمید مجید۔',
        translation: 'اے اللہ! محمد (صلی اللہ علیہ وسلم) اور ان کی آل پر برکت نازل فرما، جیسا کہ تو نے ابراہیم (علیہ السلام) اور ان کی آل پر برکت نازل فرمائی۔ بے شک تو تعریف کے لائق اور بزرگ ہے۔',
        description: 'نماز کے آخری قعدہ میں پڑھی جاتی ہے۔',
      ),
      DuaSurah(
          audioFileName: 'rabbena.mp3',
          name: 'ربنا آتنا',
          arabic: 'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ. رَبَّنَا اغْفِرْ لِي وَلِوَالِدَيَّ وَلِلْمُؤْمِنِينَ يَوْمَ يَقُومُ الْحِسَابُ.',
          transcription: 'ربنا آتنا فی الدنیا حسنۃ وفی الآخرۃ حسنۃ وقنا عذاب النار۔ ربنا اغفر لی ولوالدی وللمومنین یوم یقوم الحساب۔',
        translation: 'اے ہمارے رب! ہمیں دنیا میں بھی بھلائی عطا فرما اور آخرت میں بھی بھلائی عطا فرما، اور ہمیں دوزخ کے عذاب سے بچا۔ اے ہمارے رب! مجھے اور میرے والدین کو اور تمام مومنوں کو اس دن بخش دے جب حساب قائم ہوگا۔',
        description: 'سلام پھیرنے سے پہلے آخری قعدہ کے بالکل آخر میں پڑھی جاتی ہے۔',
      ),
      DuaSurah(
        audioFileName: 'kunut_1.mp3',
        name: 'دعائے قنوت 1',
        arabic: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
        transcription: 'اللّٰھُمَّ اِنَّا نَسْتَعِیْنُکَ وَنَسْتَغْفِرُکَ وَنَسْتَھْدِیْکَ، وَنُؤْمِنُ بِکَ وَنَتُوْبُ اِلَیْکَ، وَنَتَوَکَّلُ عَلَیْکَ، وَنُثْنِیْ عَلَیْکَ الْخَیْرَ کُلَّہٗ، نَشْکُرُکَ وَلَا نَکْفُرُکَ، وَنَخْلَعُ وَنَتْرُکُ مَنْ یَّفْجُرُکَ۔',
        translation: 'اے اللہ! ہم تجھ سے مدد مانگتے ہیں، اور تجھ سے مغفرت طلب کرتے ہیں، اور تجھ سے ہدایت چاہتے ہیں۔ ہم تجھ پر ایمان لاتے ہیں، تیری طرف توبہ کرتے ہیں، اور تجھ پر بھروسہ کرتے ہیں۔ ہم تیری بہترین تعریف کرتے ہیں، تیرا شکر ادا کرتے ہیں اور تیری ناشکری نہیں کرتے، اور ہم ایسے ہر شخص سے قطع تعلق کرتے اور اسے چھوڑتے ہیں جو تیری نافرمانی کرے۔',
        description: 'حنفی مسلک میں نمازِ وتر کی تیسری رکعت میں رکوع سے پہلے پڑھی جانے والی پہلی دعائے قنوت۔',
      ),
      DuaSurah(
        audioFileName: 'kunut_2.mp3',
        name: 'دعائے قنوت 2',
        arabic: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
        transcription: 'اللّٰھُمَّ اِیَّاکَ نَعْبُدُ، وَلَکَ نُصَلِّیْ وَنَسْجُدُ، وَاِلَیْکَ نَسْعٰی وَنَحْفِدُ، نَرْجُوْ رَحْمَتَکَ، وَنَخْشٰی عَذَابَکَ، اِنَّ عَذَابَکَ بِالْکَافِرِیْنَ مُلْحَقٌ۔',
        translation: 'اے اللہ! ہم تیری ہی عبادت کرتے ہیں، اور تیرے ہی لئے نماز پڑھتے اور سجدہ کرتے ہیں۔ تیری ہی طرف دوڑتے اور حاضر ہوتے ہیں۔ تیری رحمت کے امیدوار ہیں اور تیرے عذاب سے ڈرتے ہیں۔ بے شک تیرا عذاب کافروں کو پہنچنے والا ہے۔',
        description: 'حنفی مسلک میں نمازِ وتر کی تیسری رکعت میں پہلی دعا کے فوراً بعد پڑھی جانے والی دوسری دعا۔',
      ),
      DuaSurah(
        audioFileName: 'kunut_safii.mp3',
        name: 'دعائے قنوت (شافعی)',
        arabic: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
        transcription: 'اللّٰھُمَّ اھْدِنِیْ فِیْمَنْ ھَدَیْتَ، وَعَافِنِیْ فِیْمَنْ عَافَیْتَ، وَتَوَلَّنِیْ فِیْمَنْ تَوَلَّیْتَ، وَبَارِکْ لِیْ فِیْمَا اَعْطَیْتَ، وَقِنِیْ شَرَّ مَا قَضَیْتَ، فَاِنَّکَ تَقْضِیْ وَلَا یُقْضٰی عَلَیْکَ، وَاِنَّہٗ لَا یَذِلُّ مَنْ وَّالَیْتَ، وَلَا یَعِزُّ مَنْ عَادَیْتَ، تَبَارَکْتَ رَبَّنَا وَتَعَالَیْتَ، فَلَکَ الْحَمْدُ عَلٰی مَا قَضَیْتَ، اَسْتَغْفِرُکَ وَاَتُوْبُ اِلَیْکَ، وَصَلَّی اللہُ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَّعَلٰی اٰلِہٖ وَصَحْبِہٖ وَسَلَّمَ۔',
        translation: 'اے اللہ! مجھے ہدایت دے ان لوگوں کے ساتھ جنہیں تو نے ہدایت دی، اور مجھے عافیت دے ان لوگوں کے ساتھ جنہیں تو نے عافیت دی، اور میرا کارساز بن ان لوگوں کے ساتھ جن کا تو کارساز بنا، اور جو کچھ تو نے مجھے عطا کیا ہے اس میں برکت ڈال، اور مجھے اس شر سے بچا جو تو نے مقدر فرمایا ہے۔ یقیناً تو ہی فیصلہ کرتا ہے اور تیرے خلاف کوئی فیصلہ نہیں ہو سکتا۔ بے شک وہ ذلیل نہیں ہوتا جس کا تو دوست ہو، اور وہ عزت نہیں پا سکتا جس سے تیری دشمنی ہو۔ اے ہمارے رب! تو بابرکت اور بلند و برتر ہے۔ پس جو فیصلہ تو نے کیا اس پر تمام تعریفیں تیرے ہی لئے ہیں۔ میں تجھ سے بخشش مانگتا ہوں اور تیری طرف توبہ کرتا ہوں۔ اور اللہ کی رحمتیں اور سلامتی نازل ہو ہمارے آقا حضرت محمد ﷺ پر اور ان کی آل اور ان کے تمام اصحاب پر۔',
        description: 'شافعی مسلک میں نمازِ فجر کی دوسری رکعت میں رکوع سے کھڑے ہو کر اور رمضان کے آخری نصف میں نماز وتر میں پڑھی جانے والی دعائے قنوت۔',
      ),
    ];
  }

  // --- WUDU (ABLUTION) STEPS ---
  static List<AbdestStep> getAbdestSteps(Mezhep mezhep) {
    List<AbdestStep> steps = [];
    int stepNum = 1;

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'نیت اور بسم اللہ',
      action: 'دل میں نیت کریں: "میں اللہ کی رضا کے لئے وضو کرنے کی نیت کرتا/کرتی ہوں" اور "بسم اللہ الرحمٰن الرحیم" پڑھیں۔',
      imageKey: 'abdest_niyet',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'ہاتھ دھونا',
      action: 'گٹوں تک دونوں ہاتھ تین بار دھوئیں۔ انگلیوں کا خلال کریں۔ اگر انگوٹھی پہنی ہو تو اس کے نیچے بھی پانی پہنچائیں۔',
      imageKey: 'abdest_eller',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'کلی کرنا',
      action: 'دائیں ہاتھ سے پانی لے کر تین بار اچھی طرح کلی کریں۔',
      imageKey: 'abdest_agiz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'ناک میں پانی ڈالنا',
      action: 'دائیں ہاتھ سے تین بار ناک میں پانی چڑھائیں اور بائیں ہاتھ سے ناک صاف کریں۔',
      imageKey: 'abdest_burun',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'چہرہ دھونا',
      action: 'پیشانی کے بالوں سے لے کر ٹھوڑی کے نیچے تک، اور ایک کان کی لو سے دوسرے کان کی لو تک پورا چہرہ تین بار دھوئیں۔ (شافعی مسلک میں چہرہ دھوتے وقت نیت کرنا فرض ہے)۔',
      imageKey: 'abdest_yuz',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'بازو دھونا',
      action: 'پہلے دایاں بازو کہنیوں سمیت تین بار دھوئیں۔ پھر بایاں بازو کہنیوں سمیت تین بار دھوئیں۔',
      imageKey: 'abdest_kollar',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'سر کا مسح کرنا',
      action: 'ہاتھ گیلے کریں اور سر کے کم از کم چوتھائی حصے کا مسح کریں۔ (شافعی مسلک میں چند بالوں کا مسح کرنا بھی کافی ہے)۔',
      imageKey: 'abdest_bas',
    ));

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'کانوں کا مسح کرنا',
      action: 'شہادت کی انگلیوں سے کانوں کے اندرونی حصے اور انگوٹھوں سے کانوں کے پچھلے حصے کا مسح کریں۔',
      imageKey: 'abdest_kulak',
    ));

    if (mezhep != Mezhep.shafii) {
      steps.add(AbdestStep(
        stepNumber: stepNum++,
        title: 'گردن کا مسح کرنا',
        action: 'انگلیوں کی پشت سے گردن کا مسح کریں۔ (شافعی مسلک میں یہ مستحب نہیں ہے)۔',
        imageKey: 'abdest_boyun',
      ));
    }

    steps.add(AbdestStep(
      stepNumber: stepNum++,
      title: 'پاؤں دھونا',
      action: 'پہلے دایاں پاؤں ٹخنوں سمیت تین بار دھوئیں، انگلیوں سے شروع کریں۔ پھر اسی طرح بایاں پاؤں دھوئیں۔',
      imageKey: 'abdest_ayaklar',
    ));

    return steps;
  }

  // --- DYNAMIC PRAYER STEPS GENERATOR ---
  static Prayer getPrayer(Mezhep mezhep, Gender gender, PrayerTime time) {
    List<PrayerPart> parts = [];

    switch (time) {
      case PrayerTime.sabah:
        parts.add(_buildPart(mezhep, gender, '2 رکعت سنت', 2, false, time));
        parts.add(_buildPart(mezhep, gender, '2 رکعت فرض', 2, true, time));
        break;
      case PrayerTime.ogle:
        parts.add(_buildPart(mezhep, gender, '4 رکعت سنتِ مؤکدہ', 4, false, time));
        parts.add(_buildPart(mezhep, gender, '4 رکعت فرض', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 رکعت سنتِ مؤکدہ', 2, false, time));
        break;
      case PrayerTime.ikindi:
        parts.add(_buildPart(mezhep, gender, '4 رکعت سنتِ غیر مؤکدہ', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 رکعت فرض', 4, true, time));
        break;
      case PrayerTime.aksam:
        parts.add(_buildPart(mezhep, gender, '3 رکعت فرض', 3, true, time));
        parts.add(_buildPart(mezhep, gender, '2 رکعت سنت', 2, false, time));
        break;
      case PrayerTime.yatsi:
        parts.add(_buildPart(mezhep, gender, '4 رکعت سنتِ غیر مؤکدہ', 4, false, time, isIkindiYatsiSunnet: true));
        parts.add(_buildPart(mezhep, gender, '4 رکعت فرض', 4, true, time));
        parts.add(_buildPart(mezhep, gender, '2 رکعت سنت', 2, false, time));
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildVitirHanafi(gender));
        } else {
          parts.add(_buildVitirOther(mezhep, gender));
        }
        break;
      case PrayerTime.cuma:
        if (mezhep == Mezhep.hanafi) {
          parts.add(_buildPart(mezhep, gender, '4 رکعت سنت', 4, false, time));
          parts.add(_buildPart(mezhep, gender, '2 رکعت فرض (باجماعت)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '4 رکعت سنت', 4, false, time));
        } else {
          parts.add(_buildPart(mezhep, gender, '2 رکعت سنت', 2, false, time));
          parts.add(_buildPart(mezhep, gender, '2 رکعت فرض (باجماعت)', 2, true, time));
          parts.add(_buildPart(mezhep, gender, '2 رکعت سنت', 2, false, time));
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
      case PrayerTime.sabah: return 'فجر کی نماز 2 رکعت سنت اور 2 رکعت فرض پر مشتمل ہے۔';
      case PrayerTime.ogle: return 'ظہر کی نماز 4 رکعت سنت، 4 رکعت فرض، اور 2 رکعت سنتِ مؤکدہ پر مشتمل ہے۔';
      case PrayerTime.ikindi: return 'عصر کی نماز 4 رکعت سنت اور 4 رکعت فرض پر مشتمل ہے۔';
      case PrayerTime.aksam: return 'مغرب کی نماز 3 رکعت فرض اور 2 رکعت سنت پر مشتمل ہے۔';
      case PrayerTime.yatsi: return 'عشاء کی نماز 4 رکعت سنتِ غیر مؤکدہ، 4 رکعت فرض، 2 رکعت سنتِ مؤکدہ اور 3 رکعت وتر پر مشتمل ہے۔';
      case PrayerTime.cuma: return 'جمعہ کی نماز جمعہ کے دن ظہر کے وقت باجماعت ادا کی جاتی ہے۔';
      case PrayerTime.bayram: return 'عید کی نماز عید کی صبح اضافی تکبیرات کے ساتھ 2 رکعت ادا کی جاتی ہے۔';
      case PrayerTime.cenaze: return 'نماز جنازہ مکمل طور پر کھڑے ہو کر ادا کی جاتی ہے، جس میں میت کے لئے دعائے مغفرت کی جاتی ہے۔';
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
      title: 'نیت',
      action: _getNiyetText(mezhep, gender, time, partName),
      imageKey: '${gender.name}_niyet',
      note: 'دل میں نیت کرنا ضروری ہے۔ زبان سے ادا کرنا مستحب ہے۔',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'تکبیر تحریمہ',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'اللہ اکبر',
      translation: 'اللہ سب سے بڑا ہے۔',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: _getTekbirNote(mezhep, gender),
    ));

    for (int rekat = 1; rekat <= totalRakat; rekat++) {
      final recitation = _getKiyamRecitation(mezhep, time, partName, rekat, isFarz, isIkindiYatsiSunnet);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت $rekat - قیام اور قراءت',
        action: _getKiyamActionText(mezhep, gender, rekat, isFarz, isIkindiYatsiSunnet),
        arabicText: recitation['arabic'],
        transcription: recitation['transcription'],
        translation: recitation['translation'],
        imageKey: '${gender.name}_kiyam',
        note: _getKiyamNote(mezhep, gender),
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت $rekat - رکوع',
        action: gender == Gender.male
            ? 'کمر سیدھی رکھتے ہوئے جھکیں۔ انگلیاں پھیلا کر گھٹنوں کو پکڑیں۔ نظر سجدہ کی جگہ پر رکھیں۔'
            : 'تھوڑا سا جھکیں (مردوں سے کم)۔ انگلیاں ملا کر گھٹنوں پر رکھیں۔',
        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 مرتبہ)',
        transcription: 'سبحان ربی العظیم',
        translation: 'پاک ہے میرا رب جو بہت عظمت والا ہے۔',
        imageKey: '${gender.name}_ruku',
        note: (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali)
            ? 'رکوع میں جاتے وقت ہاتھ کندھوں تک اٹھائیں (رفع الیدین) اور "اللہ اکبر" کہیں۔'
            : '"اللہ اکبر" کہتے ہوئے رکوع میں جائیں، ہاتھ نہ اٹھائیں۔',
        audioPath: 'ruku.mp3',
      ));

      bool isSabahFarzSecondRekat = (time == PrayerTime.sabah && isFarz && rekat == 2);
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت $rekat - قومہ (رکوع سے اٹھنا)',
        action: 'رکوع سے بالکل سیدھے کھڑے ہو جائیں۔',
        arabicText: 'سَمِعَ اللهُ لِمَنْ حَمِدَهُ\nرَبَّنَا لَكَ الْحَمْدُ',
        transcription: 'سمع اللہ لمن حمدہ\nربنا لک الحمد',
        translation: 'اللہ نے اس کی سن لی جس نے اس کی تعریف کی۔\nاے ہمارے رب، سب تعریف تیرے ہی لئے ہے۔',
        imageKey: '${gender.name}_itidal',
        note: _getItidalNote(mezhep, isSabahFarzSecondRekat),
        audioPath: 'itidal.mp3',
      ));

      if (mezhep == Mezhep.shafii && isSabahFarzSecondRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'دوسری رکعت - دعائے قنوت (شافعی)',
          action: 'رکوع سے سیدھے کھڑے ہونے کے بعد دونوں ہاتھوں کو سینے کی اونچائی تک اٹھا کر دعائے قنوت پڑھیں (پھر ہاتھ چہرے پر پھیرے بغیر سجدے میں جائیں)۔',
          arabicText: 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.',
          transcription: 'اللّٰھُمَّ اھْدِنِیْ فِیْمَنْ ھَدَیْتَ، وَعَافِنِیْ فِیْمَنْ عَافَیْتَ، وَتَوَلَّنِیْ فِیْمَنْ تَوَلَّیْتَ، وَبَارِکْ لِیْ فِیْمَا اَعْطَیْتَ، وَقِنِیْ شَرَّ مَا قَضَیْتَ، فَاِنَّکَ تَقْضِیْ وَلَا یُقْضٰی عَلَیْکَ، وَاِنَّہٗ لَا یَذِلُّ مَنْ وَّالَیْتَ، وَلَا یَعِزُّ مَنْ عَادَیْتَ، تَبَارَکْتَ رَبَّنَا وَتَعَالَیْتَ، فَلَکَ الْحَمْدُ عَلٰی مَا قَضَیْتَ، اَسْتَغْفِرُکَ وَاَتُوْبُ اِلَیْکَ، وَصَلَّی اللہُ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَّعَلٰی اٰلِہٖ وَصَحْبِہٖ وَسَلَّمَ۔',
          translation: 'اے اللہ! مجھے ہدایت دے ان لوگوں کے ساتھ جنہیں تو نے ہدایت دی، اور مجھے عافیت دے ان لوگوں کے ساتھ جنہیں تو نے عافیت دی، اور میرا کارساز بن ان لوگوں کے ساتھ جن کا تو کارساز بنا، اور جو کچھ تو نے مجھے عطا کیا ہے اس میں برکت ڈال، اور مجھے اس شر سے بچا جو تو نے مقدر فرمایا ہے۔ یقیناً تو ہی فیصلہ کرتا ہے اور تیرے خلاف کوئی فیصلہ نہیں ہو سکتا۔ بے شک وہ ذلیل نہیں ہوتا جس کا تو دوست ہو، اور وہ عزت نہیں پا سکتا جس سے تیری دشمنی ہو۔ اے ہمارے رب! تو بابرکت اور بلند و برتر ہے۔ پس جو فیصلہ تو نے کیا اس پر تمام تعریفیں تیرے ہی لئے ہیں۔ میں تجھ سے بخشش مانگتا ہوں اور تیری طرف توبہ کرتا ہوں۔ اور اللہ کی رحمتیں اور سلامتی نازل ہو ہمارے آقا حضرت محمد ﷺ پر اور ان کی آل اور ان کے تمام اصحاب پر۔',
          imageKey: '${gender.name}_itidal',
          audioPath: 'kunut_safii.mp3',
          note: 'شافعی مسلک میں فجر کی فرض نماز کی دوسری رکعت میں رکوع کے بعد دعائے قنوت پڑھنا سنتِ مؤکدہ (ابعاض سنت) ہے۔',
        ));
      }

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت $rekat - پہلا سجدہ',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 مرتبہ)',
        transcription: 'سبحان ربی الاعلیٰ',
        translation: 'پاک ہے میرا رب جو بہت بلند ہے۔',
        imageKey: '${gender.name}_secde',
        note: 'سجدہ میں جاتے وقت پہلے گھٹنے، پھر ہاتھ، پھر ناک اور پیشانی زمین پر رکھیں۔',
        audioPath: 'secde.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت $rekat - جلسہ (سجدوں کے درمیان بیٹھنا)',
        action: gender == Gender.male
            ? 'بائیں پاؤں پر بیٹھیں اور دائیں پاؤں کو کھڑا رکھیں، جس کی انگلیاں قبلہ رخ ہوں۔'
            : 'بائیں کولہے پر بیٹھیں اور دونوں پاؤں دائیں طرف نکال دیں (تورک)۔',
        imageKey: '${gender.name}_celse',
        note: 'دونوں سجدوں کے درمیان تھوڑی دیر بیٹھنا واجب ہے۔',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت $rekat - دوسرا سجدہ',
        action: _getSecdeActionText(gender),
        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى (3 مرتبہ)',
        transcription: 'سبحان ربی الاعلیٰ',
        translation: 'پاک ہے میرا رب جو بہت بلند ہے۔',
        imageKey: '${gender.name}_secde',
        audioPath: 'secde.mp3',
      ));

      bool isLastRekat = (rekat == totalRakat);
      bool isSecondRekatOfFour = (rekat == 2 && totalRakat == 4);
      bool isSecondRekatOfThree = (rekat == 2 && totalRakat == 3);

      if (isLastRekat) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'آخری قعدہ',
          action: _getOturusActionText(mezhep, gender, true),
          arabicText: 'التحیات، درود شریف (صل اور بارک) اور ربنا کی دعائیں پڑھیں۔',
          transcription: 'تشہد کی دعائیں پڑھیں۔',
          translation: 'آپ دعاؤں کے ٹیب میں مکمل ترجمہ دیکھ سکتے ہیں۔',
          imageKey: '${gender.name}_oturus',
          note: _getOturusNote(mezhep, true),
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'سلام (دائیں طرف)',
          action: 'سر کو دائیں طرف موڑیں اور "السلام علیکم ورحمۃ اللہ" کہیں۔',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'السلام علیکم ورحمۃ اللہ',
          translation: 'تم پر اللہ کی سلامتی اور رحمت ہو۔',
          imageKey: '${gender.name}_selam',
          note: 'کندھوں کی طرف دیکھیں۔ دائیں طرف سلام پھیرنا شافعی مسلک میں فرض ہے۔',
          audioPath: 'selam_saga.mp3',
        ));

        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'سلام (بائیں طرف)',
          action: 'سر کو بائیں طرف موڑیں اور "السلام علیکم ورحمۃ اللہ" کہیں۔',
          arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
          transcription: 'السلام علیکم ورحمۃ اللہ',
          translation: 'تم پر اللہ کی سلامتی اور رحمت ہو۔',
          imageKey: '${gender.name}_selam_sol',
          note: 'بائیں طرف سلام پھیر کر نماز مکمل کریں۔',
          audioPath: 'selam_sola.mp3',
        ));
      } else if (isSecondRekatOfFour || isSecondRekatOfThree) {
        steps.add(PrayerStep(
          stepNumber: stepCounter++,
          title: 'پہلا قعدہ',
          action: _getOturusActionText(mezhep, gender, false),
          arabicText: 'صرف التحیات پڑھیں۔',
          transcription: 'التحیات للہ...',
          translation: 'صرف التحیات پڑھی جاتی ہے۔',
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
      title: 'نیت',
      action: 'میں آج کی 3 رکعت وتر واجب نماز اللہ کی رضا کے لئے ادا کرنے کی نیت کرتا/کرتی ہوں۔',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'تکبیر تحریمہ',
      action: _getTekbirText(Mezhep.hanafi, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'اللہ اکبر',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 1 - قیام اور قراءت',
      action: 'سبحانک، سورہ فاتحہ اور ایک اضافی سورہ پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 2 - قیام اور قراءت',
      action: 'سورہ فاتحہ اور ایک اضافی سورہ پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 2 - پہلا قعدہ',
      action: _getOturusActionText(Mezhep.hanafi, gender, false),
      arabicText: 'التحیات پڑھیں اور دوبارہ کھڑے ہو جائیں۔',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - قیام (قنوت سے پہلے)',
      action: 'کھڑے ہوں اور ہاتھ باندھ لیں۔ سورہ فاتحہ اور ایک سورہ پڑھیں۔ سورہ ختم ہونے کے بعد ہاتھ چھوڑ دیں۔',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - تکبیر قنوت',
      action: gender == Gender.male
          ? 'ہاتھ کانوں تک اٹھائیں، "اللہ اکبر" کہیں اور دوبارہ ناف کے نیچے باندھ لیں۔'
          : 'ہاتھ سینے تک اٹھائیں، "اللہ اکبر" کہیں اور دوبارہ سینے پر باندھ لیں۔',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'اللہ اکبر',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
      note: 'یہ حنفی مسلک کے لئے مخصوص ہے۔ دعائے قنوت پڑھنے سے پہلے تکبیر کہی جاتی ہے۔',
    ));

    // دعائے قنوت 1
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - دعائے قنوت 1',
      action: 'ہاتھ باندھے ہوئے پہلی دعائے قنوت پڑھیں۔',
      arabicText: 'اللَّهُمَّ إِنَّا نَسْتَعِينُكَ وَنَسْتَغْفِرُكَ وَنَسْتَهْدِيكَ، وَنُؤْمِنُ بِكَ وَنَتُوبُ إِلَيْكَ، وَنَتَوَكَّلُ عَلَيْكَ، وَنُثْنِي عَلَيْكَ الْخَيْرَ كُلَّهُ، نَشْكُرُكَ وَلَا نَكْفُرُكَ، وَنَخْلَعُ وَنَتْرُكُ مَنْ يَفْجُرُكَ.',
      transcription: 'اللّٰھُمَّ اِنَّا نَسْتَعِیْنُکَ وَنَسْتَغْفِرُکَ وَنَسْتَھْدِیْکَ، وَنُؤْمِنُ بِکَ وَنَتُوْبُ اِلَیْکَ، وَنَتَوَکَّلُ عَلَیْکَ، وَنُثْنِیْ عَلَیْکَ الْخَیْرَ کُلَّہٗ، نَشْکُرُکَ وَلَا نَکْفُرُکَ، وَنَخْلَعُ وَنَتْرُکُ مَنْ یَّفْجُرُکَ۔',
      translation: 'اے اللہ! ہم تجھ سے مدد مانگتے ہیں، اور تجھ سے مغفرت طلب کرتے ہیں، اور تجھ سے ہدایت چاہتے ہیں۔ ہم تجھ پر ایمان لاتے ہیں، تیری طرف توبہ کرتے ہیں، اور تجھ پر بھروسہ کرتے ہیں۔ ہم تیری بہترین تعریف کرتے ہیں، تیرا شکر ادا کرتے ہیں اور تیری ناشکری نہیں کرتے، اور ہم ایسے ہر شخص سے قطع تعلق کرتے اور اسے چھوڑتے ہیں جو تیری نافرمانی کرے۔',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_1.mp3',
    ));

    // دعائے قنوت 2
    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - دعائے قنوت 2',
      action: 'پہلی دعائے قنوت کے فوراً بعد ہاتھ باندھے ہوئے دوسری دعا پڑھیں۔',
      arabicText: 'اللَّهُمَّ إِيَّاكَ نَعْبُدُ، وَلَكَ نُصَلِّي وَنَسْجُدُ، وَإِلَيْكَ نَسْعَى وَنَحْفِدُ، نَرْجُو رَحْمَتَكَ، وَنَخْشَى عَذَابَكَ، إِنَّ عَذَابَكَ بِالْكَافِرِينَ مُلْحَقٌ.',
      transcription: 'اللّٰھُمَّ اِیَّاکَ نَعْبُدُ، وَلَکَ نُصَلِّیْ وَنَسْجُدُ، وَاِلَیْکَ نَسْعٰی وَنَحْفِدُ، نَرْجُوْ رَحْمَتَکَ، وَنَخْشٰی عَذَابَکَ، اِنَّ عَذَابَکَ بِالْکَافِرِیْنَ مُلْحَقٌ۔',
      translation: 'اے اللہ! ہم تیری ہی عبادت کرتے ہیں، اور تیرے ہی لئے نماز پڑھتے اور سجدہ کرتے ہیں۔ تیری ہی طرف دوڑتے اور حاضر ہوتے ہیں۔ تیری رحمت کے امیدوار ہیں اور تیرے عذاب سے ڈرتے ہیں۔ بے شک تیرا عذاب کافروں کو پہنچنے والا ہے۔',
      imageKey: '${gender.name}_kiyam',
      audioPath: 'kunut_2.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - رکوع',
      action: 'رکوع میں جائیں۔',
      arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ (3 مرتبہ)',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - قومہ',
      action: 'رکوع سے اٹھیں۔',
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - پہلا سجدہ',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - جلسہ',
      action: 'سجدوں کے درمیان بیٹھیں۔',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - دوسرا سجدہ',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'آخری قعدہ',
      action: _getOturusActionText(Mezhep.hanafi, gender, true),
      arabicText: 'التحیات، درود شریف اور ربنا کی دعائیں پڑھیں۔',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (دائیں طرف)',
      action: 'دائیں طرف سلام پھیریں۔',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (بائیں طرف)',
      action: 'بائیں طرف سلام پھیر کر نماز مکمل کریں۔',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: '3 رکعت وتر واجب',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildVitirOther(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'نیت',
      action: 'میں آج کی وتر کی نماز اللہ کی رضا کے لئے ادا کرنے کی نیت کرتا/کرتی ہوں۔',
      imageKey: '${gender.name}_niyet',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'تکبیر تحریمہ',
      action: _getTekbirText(mezhep, gender),
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 1 - قیام اور قراءت',
      action: 'دعائے ثناء، سورہ فاتحہ اور سورہ الاعلیٰ پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 2 - قیام اور قراءت',
      action: 'سورہ فاتحہ اور سورہ الکافرون پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));
    _addStandartMovement(steps, gender, 2, ref: stepCounter);
    stepCounter += 5;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 2 - قعدہ اور سلام',
      action: 'بیٹھیں، التحیات، درود شریف پڑھیں اور سلام پھیریں۔ پھر آخری 1 رکعت کے لئے دوبارہ کھڑے ہو جائیں۔',
      imageKey: '${gender.name}_selam',
      note: 'شافعی، مالکی اور حنبلی مسالک میں وتر کی نماز 1+2 رکعت کر کے پڑھنا زیادہ افضل ہے۔',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 (اکیلے) - نیت اور تکبیر',
      action: 'میں وتر کی آخری رکعت کی نیت کرتا/کرتی ہوں۔ تکبیر تحریمہ کہیں۔',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - قیام اور قراءت',
      action: 'سورہ فاتحہ اور سورہ الاخلاص پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - رکوع',
      action: 'رکوع میں جائیں۔',
      imageKey: '${gender.name}_ruku',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - قومہ (قنوت)',
      action: mezhep == Mezhep.shafii
          ? 'رمضان کے دوسرے نصف حصے میں، رکوع سے اٹھنے کے بعد دونوں ہاتھ اٹھائیں اور دعائے قنوت پڑھیں۔'
          : 'رکوع سے اٹھیں۔',
      arabicText: mezhep == Mezhep.shafii
          ? 'اللَّهُمَّ اهْدِنِي فِيمَنْ هَدَيْتَ، وَعَافِنِي فِيمَنْ عَافَيْتَ، وَتَوَلَّنِي فِيمَنْ تَوَلَّيْتَ، وَبَارِكْ لِي فِيمَا أَعْطَيْتَ، وَقِنِي شَرَّ مَا قَضَيْتَ، فَإِنَّكَ تَقْضِي وَلَا يُقْضَى عَلَيْكَ، وَإِنَّهُ لَا يَذِلُّ مَنْ وَالَيْتَ، وَلَا يَعِزُّ مَنْ عَادَيْتَ، تَبَارَكْتَ رَبَّنَا وَتَعَالَيْتَ، فَلَكَ الْحَمْدُ عَلَى مَا قَضَيْتَ، أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيْكَ، وَصَلَّى اللَّهُ عَلَى سَيِّدِنَا مُحَمَّدٍ وَعَلَى آلِهِ وَصَحْبِهِ وَسَلَّمَ.'
          : null,
      transcription: mezhep == Mezhep.shafii
          ? 'اللّٰھُمَّ اھْدِنِیْ فِیْمَنْ ھَدَیْتَ، وَعَافِنِیْ فِیْمَنْ عَافَیْتَ، وَتَوَلَّنِیْ فِیْمَنْ تَوَلَّیْتَ، وَبَارِکْ لِیْ فِیْمَا اَعْطَیْتَ، وَقِنِیْ شَرَّ مَا قَضَیْتَ، فَاِنَّکَ تَقْضِیْ وَلَا یُقْضٰی عَلَیْکَ، وَاِنَّہٗ لَا یَذِلُّ مَنْ وَّالَیْتَ، وَلَا یَعِزُّ مَنْ عَادَیْتَ، تَبَارَکْتَ رَبَّنَا وَتَعَالَیْتَ، فَلَکَ الْحَمْدُ عَلٰی مَا قَضَیْتَ، اَسْتَغْفِرُکَ وَاَتُوْبُ اِلَیْکَ، وَصَلَّی اللہُ عَلٰی سَیِّدِنَا مُحَمَّدٍ وَّعَلٰی اٰلِہٖ وَصَحْبِہٖ وَسَلَّمَ۔'
          : null,
      translation: mezhep == Mezhep.shafii
          ? 'اے اللہ! مجھے ہدایت دے ان لوگوں کے ساتھ جنہیں تو نے ہدایت دی، اور مجھے عافیت دے ان لوگوں کے ساتھ جنہیں تو نے عافیت دی، اور میرا کارساز بن ان لوگوں کے ساتھ جن کا تو کارساز بنا، اور جو کچھ تو نے مجھے عطا کیا ہے اس میں برکت ڈال، اور مجھے اس شر سے بچا جو تو نے مقدر فرمایا ہے۔ یقیناً تو ہی فیصلہ کرتا ہے اور تیرے خلاف کوئی فیصلہ نہیں ہو سکتا۔ بے شک وہ ذلیل نہیں ہوتا جس کا تو دوست ہو، اور وہ عزت نہیں پا سکتا جس سے تیری دشمنی ہو۔ اے ہمارے رب! تو بابرکت اور بلند و برتر ہے۔ پس جو فیصلہ تو نے کیا اس پر تمام تعریفیں تیرے ہی لئے ہیں۔ میں تجھ سے بخشش مانگتا ہوں اور تیری طرف توبہ کرتا ہوں۔ اور اللہ کی رحمتیں اور سلامتی نازل ہو ہمارے آقا حضرت محمد ﷺ پر اور ان کی آل اور ان کے تمام اصحاب پر۔'
          : null,
      audioPath: mezhep == Mezhep.shafii ? 'kunut_safii.mp3' : null,
      note: mezhep == Mezhep.shafii
          ? 'شافعی مسلک میں رمضان کے آخری نصف حصے میں وتر کی آخری رکعت میں رکوع کے بعد دعائے قنوت پڑھنا سنت ہے۔'
          : null,
      imageKey: '${gender.name}_itidal',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - پہلا سجدہ',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - جلسہ',
      action: 'بیٹھیں۔',
      imageKey: '${gender.name}_celse',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 3 - دوسرا سجدہ',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'آخری قعدہ',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'التحیات، درود شریف اور ربنا کی دعائیں پڑھیں۔',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (دائیں طرف)',
      action: 'دائیں طرف سلام پھیریں۔',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (بائیں طرف)',
      action: 'بائیں طرف سلام پھیر کر نماز مکمل کریں۔',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'وتر (2+1 رکعت)',
      rakatCount: 3,
      steps: steps,
    );
  }

  static PrayerPart _buildBayram(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'نیت',
      action: 'میں امام کے پیچھے اللہ کی رضا کے لئے آج کی عید کی نماز کی نیت کرتا/کرتی ہوں۔',
      imageKey: '${gender.name}_niyet',
      note: 'عید الفطر اور عید الاضحیٰ کی نمازیں بالکل ایک ہی طریقے سے ادا کی جاتی ہیں۔',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'تکبیر تحریمہ',
      action: _getTekbirText(mezhep, gender),
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'اللہ اکبر',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 1 - دعائے ثناء',
      action: mezhep == Mezhep.shafii
          ? 'دعائے وجہت پڑھیں۔'
          : 'سبحانک کی دعا پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 1 - اضافی تکبیرات (7 مرتبہ)',
        action: 'ہاتھ کندھوں تک اٹھائیں اور 7 بار "اللہ اکبر" کہیں۔ ہر تکبیر کے بعد ہاتھ باندھ لیں۔ درمیان میں "سبحان اللہ والحمد للہ..." پڑھیں۔',
        arabicText: 'اللهُ أَكْبَرُ (7 مرتبہ)',
        transcription: 'اللہ اکبر',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'شافعی مسلک میں قراءت شروع کرنے سے پہلے پڑھی جاتی ہے۔',
      ));
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 1 - اضافی تکبیرات (3 مرتبہ)',
        action: 'ہاتھ کانوں تک اٹھائیں اور 3 بار "اللہ اکبر" کہیں۔ پہلی اور دوسری تکبیر پر ہاتھ چھوڑ دیں اور تیسری پر باندھ لیں۔',
        arabicText: 'اللهُ أَكْبَرُ (3 مرتبہ)',
        transcription: 'اللہ اکبر',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
        note: 'حنفی مسلک میں قراءت سے پہلے واجب ہے۔',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'رکعت 1 - قیام اور قراءت',
      action: 'سورہ فاتحہ اور سورہ الاعلیٰ پڑھیں۔',
      imageKey: '${gender.name}_kiyam',
    ));

    _addStandartMovement(steps, gender, 1, ref: stepCounter);
    stepCounter += 5;

    if (mezhep == Mezhep.shafii) {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - اضافی تکبیرات (5 مرتبہ)',
        action: 'قراءت سے پہلے 5 بار "اللہ اکبر" کہیں۔ ہاتھ باندھیں اور درمیان میں تسبیح پڑھیں۔',
        arabicText: 'اللهُ أَكْبَرُ (5 مرتبہ)',
        transcription: 'اللہ اکبر',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - قیام اور قراءت',
        action: 'سورہ فاتحہ اور سورہ الغاشیہ پڑھیں۔',
        imageKey: '${gender.name}_kiyam',
      ));

      _addStandartMovement(steps, gender, 2, ref: stepCounter);
      stepCounter += 5;
    } else {
      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - قیام اور قراءت',
        action: 'سورہ فاتحہ اور سورہ الغاشیہ پڑھیں۔',
        imageKey: '${gender.name}_kiyam',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - اضافی تکبیرات (3 مرتبہ)',
        action: 'قراءت مکمل ہونے کے بعد اور رکوع میں جانے سے پہلے 3 بار ہاتھ کانوں تک اٹھائیں اور "اللہ اکبر" کہہ کر ہاتھ چھوڑ دیں۔',
        arabicText: 'اللهُ أَكْبَرُ (3 مرتبہ)',
        transcription: 'اللہ اکبر',
        imageKey: '${gender.name}_tekbir',
        audioPath: 'tekbir.mp3',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - رکوع میں جانا',
        action: 'چوتھی بار "اللہ اکبر" کہیں اور ہاتھ اٹھائے بغیر رکوع میں جائیں۔',
        arabicText: 'اللهُ أَكْبَرُ',
        imageKey: '${gender.name}_ruku',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - قومہ',
        action: 'رکوع سے اٹھیں۔',
        imageKey: '${gender.name}_itidal',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - پہلا سجدہ',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - جلسہ',
        action: 'بیٹھیں۔',
        imageKey: '${gender.name}_celse',
      ));

      steps.add(PrayerStep(
        stepNumber: stepCounter++,
        title: 'رکعت 2 - دوسرا سجدہ',
        action: _getSecdeActionText(gender),
        imageKey: '${gender.name}_secde',
      ));
    }

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'آخری قعدہ',
      action: _getOturusActionText(mezhep, gender, true),
      arabicText: 'التحیات، درود شریف اور ربنا کی دعائیں پڑھیں۔',
      imageKey: '${gender.name}_oturus',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (دائیں طرف)',
      action: 'دائیں طرف سلام پھیریں۔',
      imageKey: '${gender.name}_selam',
      audioPath: 'selam_saga.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (بائیں طرف)',
      action: 'بائیں طرف سلام پھیریں۔',
      imageKey: '${gender.name}_selam_sol',
      audioPath: 'selam_sola.mp3',
    ));

    return PrayerPart(
      name: 'نماز عید',
      rakatCount: 2,
      steps: steps,
    );
  }

  static PrayerPart _buildCenaze(Mezhep mezhep, Gender gender) {
    List<PrayerStep> steps = [];
    int stepCounter = 1;

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'نیت',
      action: 'میں امام کے پیچھے اللہ کی رضا کے لئے نماز جنازہ، نبی کریم پر درود، اور میت کے لئے دعا کی نیت کرتا/کرتی ہوں۔',
      imageKey: '${gender.name}_niyet',
      note: 'نماز جنازہ مکمل طور پر کھڑے ہو کر ادا کی جاتی ہے۔ اس میں کوئی رکوع یا سجدہ نہیں ہوتا۔',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'پہلی تکبیر',
      action: gender == Gender.male
          ? 'ہاتھ کانوں تک اٹھائیں، "اللہ اکبر" کہیں اور ناف کے نیچے باندھ لیں۔'
          : 'ہاتھ سینے تک اٹھائیں، "اللہ اکبر" کہیں اور سینے پر باندھ لیں۔',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'اللہ اکبر',
      imageKey: '${gender.name}_tekbir',
      audioPath: 'tekbir.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'پہلی تکبیر کی قراءت',
      action: mezhep == Mezhep.shafii
          ? 'خاموشی سے سورہ فاتحہ پڑھیں۔'
          : '"وجل ثناؤک" کے اضافے کے ساتھ سبحانک پڑھیں۔',
      arabicText: mezhep == Mezhep.shafii ? 'الفاتحہ' : 'سبحانک (وجل ثناؤک کے ساتھ)',
      imageKey: '${gender.name}_kiyam',
      note: 'شافعی مسلک میں سورہ فاتحہ پڑھنا فرض ہے۔ حنفی مسلک میں سبحانک پڑھی جاتی ہے۔',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'دوسری تکبیر اور درود',
      action: mezhep == Mezhep.shafii
          ? 'ہاتھ کندھوں تک اٹھائیں، دوسری تکبیر کہیں، دوبارہ ہاتھ باندھیں اور درود ابراہیمی پڑھیں۔'
          : 'ہاتھ اٹھائے بغیر دوسری تکبیر کہیں اور درود ابراہیمی پڑھیں۔',
      arabicText: 'اللھم صل اور اللھم بارک',
      imageKey: '${gender.name}_kiyam',
      note: 'شافعی مسلک میں ہر تکبیر پر ہاتھ اٹھانا سنت ہے۔',
      audioPath: 'Allahümme_Salli_Barik.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'تیسری تکبیر اور دعائے جنازہ',
      action: 'تیسری تکبیر کہیں۔ میت کے لئے مخصوص دعائے جنازہ پڑھیں۔',
      arabicText: 'دعائے جنازہ',
      imageKey: '${gender.name}_kiyam',
      note: 'میت کے لئے خلوص دل سے دعا کی جاتی ہے۔',
      audioPath: gender == Gender.male ? 'Cenaze_Duası_Erkek.mp3' : 'CenazeDuası_Kadin.mp3',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'چوتھی تکبیر',
      action: mezhep == Mezhep.shafii
          ? 'چوتھی تکبیر کہیں، کھڑے ہو کر تھوڑا توقف کریں، پھر ہاتھ اطراف میں چھوڑ دیں۔'
          : 'چوتھی تکبیر کہیں اور فوراً ہاتھ اطراف میں چھوڑ دیں۔',
      arabicText: 'اللهُ أَكْبَرُ',
      transcription: 'اللہ اکبر',
      translation: 'اللہ سب سے بڑا ہے۔',
      imageKey: '${gender.name}_kiyam',
      note: 'چوتھی تکبیر کے بعد کوئی دعا نہیں پڑھی جاتی، براہ راست سلام پھیریں۔',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (دائیں طرف)',
      action: 'کھڑے ہو کر دائیں طرف سلام پھیریں۔',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'السلام علیکم ورحمۃ اللہ',
      translation: 'تم پر اللہ کی سلامتی اور رحمت ہو۔',
      imageKey: '${gender.name}_cenaze_selam',
    ));

    steps.add(PrayerStep(
      stepNumber: stepCounter++,
      title: 'سلام (بائیں طرف)',
      action: 'بائیں طرف سلام پھیر کر نماز جنازہ مکمل کریں۔',
      arabicText: 'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ',
      transcription: 'السلام علیکم ورحمۃ اللہ',
      translation: 'تم پر اللہ کی سلامتی اور رحمت ہو۔',
      imageKey: '${gender.name}_cenaze_selam_sol',
    ));

    return PrayerPart(
      name: 'نماز جنازہ',
      rakatCount: 0,
      steps: steps,
    );
  }

  static void _addStandartMovement(List<PrayerStep> steps, Gender gender, int rekat, {required int ref}) {
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'رکعت $rekat - رکوع',
      action: 'رکوع میں جائیں۔',
      imageKey: '${gender.name}_ruku',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'رکعت $rekat - قومہ',
      action: 'رکوع سے اٹھیں۔',
      imageKey: '${gender.name}_itidal',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'رکعت $rekat - پہلا سجدہ',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'رکعت $rekat - جلسہ',
      action: 'سجدوں کے درمیان بیٹھیں۔',
      imageKey: '${gender.name}_celse',
    ));
    steps.add(PrayerStep(
      stepNumber: ref++,
      title: 'رکعت $rekat - دوسرا سجدہ',
      action: _getSecdeActionText(gender),
      imageKey: '${gender.name}_secde',
    ));
  }

  // --- TEXT HELPERS ---
  static String _getNiyetText(Mezhep mezhep, Gender gender, PrayerTime time, String partName) {
    return 'نیت کریں: "میں اللہ کی رضا کے لئے آج کی ${time.name} کی نماز ($partName) ادا کرنے کی نیت کرتا/کرتی ہوں۔"';
  }

  static String _getTekbirText(Mezhep mezhep, Gender gender) {
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        return 'اپنے انگوٹھے کانوں کی لو سے چھونے تک ہاتھ اٹھائیں، ہتھیلیاں قبلہ رخ ہوں۔ "اللہ اکبر" کہیں اور ناف کے نیچے ہاتھ باندھ لیں۔';
      } else {
        return 'ہاتھ کندھوں کے برابر تک اٹھائیں، ہتھیلیاں قبلہ رخ ہوں۔ "اللہ اکبر" کہیں اور سینے کے نیچے ہاتھ باندھ لیں (یا مالکی مسلک میں ہاتھ کھلے چھوڑ دیں)۔';
      }
    } else {
      if (mezhep == Mezhep.hanafi) {
        return 'اپنے ہاتھ سینے تک اٹھائیں، ہتھیلیاں قبلہ رخ ہوں۔ "اللہ اکبر" کہیں اور سینے پر ہاتھ باندھ لیں، دایاں ہاتھ بائیں ہاتھ کے اوپر۔';
      } else {
        return 'اپنے ہاتھ کندھوں تک اٹھائیں، "اللہ اکبر" کہیں اور سینے پر ہاتھ باندھ لیں۔';
      }
    }
  }

  static String _getTekbirNote(Mezhep mezhep, Gender gender) {
    if (mezhep == Mezhep.shafii) {
      return 'شافعی مسلک میں، تکبیر کے دوران ہاتھ کندھوں تک اٹھانا سنت ہے۔ ہتھیلیاں قبلہ رخ ہونی چاہئیں۔';
    }
    return 'مرد کانوں تک ہاتھ اٹھائیں، خواتین سینے تک۔';
  }

  static String _getKiyamActionText(Mezhep mezhep, Gender gender, int rekat, bool isFarz, bool isIkindiYatsi) {
    String structure = '';
    if (gender == Gender.male) {
      if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
        structure = 'سیدھے کھڑے ہوں۔ ناف کے نیچے ہاتھ باندھیں، دایاں ہاتھ بائیں کلائی کو پکڑے ہوئے۔ اپنی نظریں سجدہ گاہ پر رکھیں۔';
      } else if (mezhep == Mezhep.shafii) {
        structure = 'سیدھے کھڑے ہوں۔ سینے کے نیچے اور ناف کے اوپر (دل کے مقام پر) ہاتھ باندھیں۔';
      } else {
        structure = 'سیدھے کھڑے ہوں اور بازو اطراف میں لٹکتے رہیں (سدل)، یا انہیں سینے کے نیچے باندھ لیں۔';
      }
    } else {
      structure = 'سیدھے کھڑے ہوں۔ دایاں ہاتھ بائیں ہاتھ پر سینے پر رکھیں، بغیر پکڑے ہوئے۔ نظریں سجدہ گاہ پر رکھیں۔';
    }

    if (rekat == 1) {
      if (mezhep == Mezhep.shafii) {
        return '$structure\nدعائے وجہت پڑھیں۔ اعوذ باللہ اور بسم اللہ پڑھ کر سورہ فاتحہ پڑھیں، پھر کوئی اضافی سورہ پڑھیں۔';
      } else if (mezhep == Mezhep.maliki) {
        return '$structure\n(فرض نمازوں میں) سبحانک اور اعوذ باللہ، بسم اللہ کے بغیر براہ راست سورہ فاتحہ پڑھیں۔ پھر کوئی اضافی سورہ پڑھیں۔';
      } else {
        return '$structure\nسبحانک پڑھیں۔ اعوذ باللہ اور بسم اللہ پڑھ کر سورہ فاتحہ پڑھیں، پھر کوئی اضافی سورہ (ضم سورہ) پڑھیں۔';
      }
    } else if (rekat == 2) {
      if (mezhep == Mezhep.maliki) {
        return '$structure\nبراہ راست سورہ فاتحہ اور کوئی اضافی سورہ پڑھیں۔';
      }
      return '$structure\nبسم اللہ پڑھیں، سورہ فاتحہ اور کوئی اضافی سورہ پڑھیں۔';
    } else {
      if (isFarz) {
        if (mezhep == Mezhep.maliki) {
          return '$structure\nصرف سورہ فاتحہ پڑھیں۔ کوئی اضافی سورہ نہیں پڑھی جائے گی۔';
        }
        return '$structure\nبسم اللہ پڑھیں اور صرف سورہ فاتحہ پڑھیں۔ کوئی اضافی سورہ نہیں پڑھی جائے گی۔';
      } else {
        if (isIkindiYatsi && rekat == 3) {
          if (mezhep == Mezhep.hanafi || mezhep == Mezhep.hanbali) {
            return '$structure\nان سنتوں کی تیسری رکعت میں، پہلے سبحانک پڑھیں، پھر سورہ فاتحہ اور کوئی سورہ پڑھیں۔';
          } else {
            return '$structure\nتیسری رکعت میں، بسم اللہ پڑھیں، سورہ فاتحہ اور کوئی سورہ پڑھیں۔';
          }
        }
        if (mezhep == Mezhep.maliki) {
          return '$structure\nسورہ فاتحہ اور کوئی اضافی سورہ پڑھیں۔';
        }
        return '$structure\nبسم اللہ پڑھیں، سورہ فاتحہ اور کوئی اضافی سورہ پڑھیں۔';
      }
    }
  }

  static final List<DuaSurah> _zammISureler = getDuaSurahs().sublist(2, 12);

  static DuaSurah _getZammISure(PrayerTime time, String partName, int rekat) {
    int index = 0;
    if (time == PrayerTime.sabah) {
      index = (rekat == 1) ? 4 : 7;
    } else if (time == PrayerTime.ogle) {
      if (partName.contains('سنت')) {
        index = (rekat == 1) ? 0 : (rekat == 2) ? 1 : (rekat == 3) ? 2 : 3;
      } else if (partName.contains('فرض')) {
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
        arabic.writeln('[شافعی دعائے ثناء (وجہت)]');
        arabic.writeln('وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ ❁ إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ ❁ لَا شَرِيكَ لَهُ وَبِذَلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ');
        transcription.writeln('[شافعی دعائے ثناء (وجہت)]');
        transcription.writeln('وجھت وجھی للذی فطر السماوات والارض حنیفا وما انا من المشرکین۔ ان صلاتی ونسکی ومحیای ومماتی للہ رب العالمین۔ لا شریک لہ وبذلک امرت وانا من المسلمین۔');
        translation.writeln('[شافعی دعائے ثناء کا ترجمہ]');
        translation.writeln('یقیناً میں نے اپنا رخ اس ذات کی طرف کر لیا جس نے آسمانوں اور زمین کو پیدا کیا، حق کی طرف مائل ہو کر، اور میں شرک کرنے والوں میں سے نہیں ہوں۔ بے شک میری نماز، میری قربانی، میرا جینا اور میرا مرنا اللہ کے لئے ہے جو تمام جہانوں کا رب ہے۔ اس کا کوئی شریک نہیں، مجھے اسی کا حکم دیا گیا ہے اور میں فرمانبرداروں میں سے ہوں۔');
      } else {
        arabic.writeln('[دعائے ثناء (سبحانک)]');
        arabic.writeln('سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ ❁ وَتَبَارَكَ اسْمُكَ ❁ وَتَعَالَى جَدُّكَ ❁ وَلَا إِلَهَ غَيْرُكَ');
        transcription.writeln('[دعائے ثناء (سبحانک)]');
        transcription.writeln('سبحانک اللھم وبحمدک۔ وتبارک اسمک۔ وتعالٰی جدک۔ ولا الہ غیرک۔');
        translation.writeln('[دعائے ثناء کا ترجمہ]');
        translation.writeln('اے اللہ! تو پاک ہے اور سب تعریفیں تیرے ہی لئے ہیں۔ تیرا نام برکت والا ہے، اور تیری شان بہت بلند ہے۔ اور تیرے سوا کوئی عبادت کے لائق نہیں۔');
      }
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');
    }

    arabic.writeln('[سورہ الفاتحہ]');
    arabic.writeln('بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّح۪يمِ ❁ اَلْحَمْدُ لِلّٰهِ رَبِّ الْعَالَم۪ينَ ❁ اَلرَّحْمٰنِ الرَّح۪يمِ ❁ مَالِكِ يَوْmِ الدّ۪ينِ ❁ إِيَّاكَ نَعْبُدُ وَإِيَّاكَ نَسْتَع۪ينُ ❁ اِهْدِنَا الصِّرَاطَ الْمُسْتَق۪يمَ ❁ صِرَاطَ الَّذ۪ينَ أَنْعَمْتَ عَلَيْهِمْ غَيْرِ الْمَغْضُوبِ عَلَيْهِمْ وَلَا الضَّالّ۪ينَ');
    transcription.writeln('[سورہ الفاتحہ]');
    transcription.writeln('بسم اللہ الرحمٰن الرحیم۔ الحمد للہ رب العالمین۔ الرحمٰن الرحیم۔ مالک یوم الدین۔ ایاک نعبد و ایاک نستعین۔ اھدنا الصراط المستقیم۔ صراط الذین انعمت علیھم غیر المغضوب علیھم ولا الضالین۔');
    translation.writeln('[سورہ الفاتحہ کا ترجمہ]');
    translation.writeln('اللہ کے نام سے شروع جو نہایت مہربان، رحم والا ہے۔ سب تعریفیں اللہ کے لئے ہیں جو تمام جہانوں کا پالنے والا ہے۔ نہایت مہربان، رحم والا ہے۔ روزِ جزا کا مالک ہے۔ ہم صرف تیری ہی عبادت کرتے ہیں اور صرف تجھ ہی سے مدد مانگتے ہیں۔ ہمیں سیدھا راستہ دکھا۔ ان لوگوں کا راستہ جن پر تو نے انعام کیا، نہ کہ ان لوگوں کا جن پر تیرا غضب ہوا اور نہ گمراہوں کا۔');

    bool readZamm = !isFarz || rekat <= 2;
    if (readZamm) {
      DuaSurah zamm = _getZammISure(time, partName, rekat);
      arabic.writeln('\n====================\n');
      transcription.writeln('\n----------------------------------------\n');
      translation.writeln('\n----------------------------------------\n');

      arabic.writeln('[اضافی سورہ (${zamm.name})]');
      arabic.writeln(zamm.arabic);
      transcription.writeln('[سورہ ${zamm.name}]');
      transcription.writeln(zamm.transcription);
      translation.writeln('[${zamm.name} کا ترجمہ]');
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
      return 'شافعی مسلک میں، پہلی رکعت میں سبحانک کی بجائے دعائے وجہت پڑھیں۔ جہری نمازوں میں بسم اللہ آواز سے پڑھیں۔';
    }
    return 'قیام کا مطلب کھڑا ہونا ہے۔ سجدہ گاہ پر نظریں مرکوز رکھنا توجہ کے لئے انتہائی مستحب ہے۔';
  }

  static String _getItidalNote(Mezhep mezhep, bool isSabahFarzSecondRekat) {
    String note = '';
    if (mezhep == Mezhep.shafii || mezhep == Mezhep.hanbali) {
      note = 'رکوع سے اٹھتے وقت ہاتھ کندھوں تک اٹھائیں (رفع الیدین)۔';
    }
    if (isSabahFarzSecondRekat && mezhep == Mezhep.shafii) {
      note += ' شافعی مسلک میں فجر کی دوسری رکعت میں کھڑے ہو کر دعائے قنوت پڑھیں۔';
    }
    return note.isNotEmpty ? note : 'اٹھیں اور تھوڑی دیر رکیں تاکہ پوری طرح سیدھے کھڑے ہو سکیں۔';
  }

  static String _getSecdeActionText(Gender gender) {
    if (gender == Gender.male) {
      return 'سجدے میں جائیں۔ پیشانی اور ناک زمین کو چھو رہی ہو۔ پاؤں کھڑے رہیں اور انگلیاں قبلہ رخ ہوں۔ کہنیاں زمین اور پسلیوں سے الگ رکھیں، اور پیٹ کو رانوں سے الگ رکھیں۔';
    } else {
      return 'سجدے میں جائیں۔ پیشانی اور ناک زمین کو چھو رہی ہو۔ کہنیاں جسم کے قریب اور زمین سے لگی ہوئی رکھیں، پیٹ رانوں کے قریب رکھ کر سمٹ کر سجدہ کریں۔';
    }
  }

  static String _getOturusActionText(Mezhep mezhep, Gender gender, bool isLast) {
    if (gender == Gender.male) {
      if (isLast && (mezhep == Mezhep.shafii || mezhep == Mezhep.maliki || mezhep == Mezhep.hanbali)) {
        return 'آخری قعدے میں بائیں کولہے پر بیٹھیں اور بایاں پاؤں دائیں ٹانگ کے نیچے سے باہر نکال دیں (تورک)۔ ہاتھ گھٹنوں پر رکھیں۔';
      }
      return 'بائیں پاؤں پر بیٹھیں، دایاں پاؤں کھڑا رکھیں جس کی انگلیاں قبلہ رخ ہوں (افتراش)۔ ہاتھ گھٹنوں پر رکھیں۔';
    } else {
      return 'دونوں قعدوں میں بائیں کولہے پر بیٹھیں اور پاؤں دائیں طرف نکال دیں (تورک)۔ انگلیاں ملا کر ہاتھ گھٹنوں پر رکھیں۔';
    }
  }

  static String _getOturusNote(Mezhep mezhep, bool isLast) {
    if (isLast) {
      return 'آخری قعدے میں تشہد (التحیات)، درود شریف (صل اور بارک) اور ربنا کی دعائیں پڑھیں۔';
    }
    return 'پہلے قعدے میں صرف تشہد (التحیات) کی دعا پڑھیں۔';
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
          name: 'دعائے استفتاح',
          arabic: 'وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ. إِنَّ صَلَاتِي وَنُسُكِي وَمَحْيَايَ وَمَمَاتِي لِلَّهِ رَبِّ الْعَالَمِينَ. لَا شَرِيكَ لَهُ وَبِذَٰلِكَ أُمِرْتُ وَأَنَا مِنَ الْمُسْلِمِينَ.',
          transcription: 'وجھت وجھی للذی فطر السماوات والارض حنیفا وما انا من المشرکین۔ ان صلاتی ونسکی ومحیای ومماتی للہ رب العالمین۔ لا شریک لہ وبذلک امرت وانا من المسلمین۔',
          translation: 'یقیناً میں نے اپنا رخ اس ذات کی طرف کر لیا جس نے آسمانوں اور زمین کو پیدا کیا، حق کی طرف مائل ہو کر، اور میں شرک کرنے والوں میں سے نہیں ہوں۔ بے شک میری نماز، میری قربانی، میرا جینا اور میرا مرنا اللہ کے لئے ہے جو تمام جہانوں کا رب ہے۔ اس کا کوئی شریک نہیں، مجھے اسی کا حکم دیا گیا ہے اور میں فرمانبرداروں میں سے ہوں۔',
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
