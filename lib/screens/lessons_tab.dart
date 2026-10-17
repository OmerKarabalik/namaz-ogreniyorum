import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';

class LessonsTab extends StatelessWidget {
  const LessonsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<AppProvider>(context).languageCode;

    final lessons = _getLessons(lang);

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            color: isDark ? AppColors.darkSurface : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: AppColors.champagneGold.withOpacity(0.15)),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.premiumGold.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(lesson.icon, color: AppColors.premiumGold, size: 24),
              ),
              title: Text(
                lesson.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  lesson.description,
                  style: TextStyle(
                    fontSize: 12.5,
                    color: isDark ? Colors.white70 : Colors.black54,
                    height: 1.3,
                  ),
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.premiumGold),
              onTap: () => _showLessonDetail(context, lesson, isDark, lang),
            ),
          );
        },
      ),
    );
  }

  List<_LessonItem> _getLessons(String lang) {
    if (lang == 'en') {
      return [
        _LessonItem(
          title: 'Praying in Congregation',
          description: 'The importance, virtue, and rules of following the imam in congregational prayer.',
          content: 'Praying in congregation is twenty-seven times more virtuous than praying alone. While praying in congregation, the followers (muqtadi) must follow the imam. When the imam says takbir, you say takbir; when he bows, you bow; when he prostrates, you prostrate. No rukn (pillar) is performed before the imam. While standing in qiyam, the congregation listens while the imam recites aloud.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'How to Make Up Missed Prayers (Qada)?',
          description: 'Rules for making up prayers that were not performed on time.',
          content: 'A prayer performed after its prescribed time has passed is called qada. Making up missed obligatory prayers due to forgetfulness, sleep, or neglect is obligatory (fard). Only fard and witr prayers need to be made up — voluntary prayers do not have qada (except Fajr sunnah, which can be made up before noon on the same day). When making the intention, say: "I intend to pray the qada of my first outstanding Fajr/Dhuhr fard prayer for the sake of Allah."',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'What is the Prostration of Forgetfulness (Sujud al-Sahw)?',
          description: 'Two prostrations performed at the end of prayer to compensate for mistakes.',
          content: 'Sujud al-Sahw refers to the two prostrations performed at the end of the prayer when a fard (obligatory act) has been delayed or a wajib (necessary act) has been omitted or delayed. How to perform it: After reciting Tashahhud in the final sitting and giving salaam to the right side, say "Allahu Akbar" and prostrate twice. Then sit, recite Tashahhud, Salli-Barik, and Rabbana supplications, and give salaam to both sides to complete the prayer.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Things That Invalidate Prayer',
          description: 'Movements and actions that nullify the prayer and require it to be repeated.',
          content: 'The following invalidate the prayer: speaking, laughing out loud (loud laughter also breaks wudu), eating or drinking, turning the chest away from the qibla, excessive movement (so much that an observer would think you are not praying), blowing or making sounds of distress during the prayer.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'de') {
      return [
        _LessonItem(
          title: 'Gemeinschaftsgebet',
          description: 'Bedeutung, Tugend und Regeln des Folgens des Imams beim Gemeinschaftsgebet.',
          content: 'Das Gemeinschaftsgebet ist siebenundzwanzig Mal verdienstvoller als das Alleinbeten. Beim Gemeinschaftsgebet müssen die Gläubigen (Muqtadi) dem Imam folgen. Wenn der Imam Takbir sagt, sagst du Takbir; wenn er sich verneigt, verneigest du dich; wenn er niederwirft, wirfst du nieder. Kein Rukn wird vor dem Imam ausgeführt. Im Stehen hört die Gemeinde zu, während der Imam laut rezitiert.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'Versäumte Gebete Nachholen (Kaza)',
          description: 'Regeln für das Nachholen von nicht rechtzeitig verrichteten Gebeten.',
          content: 'Ein Gebet, das nach Ablauf seiner vorgeschriebenen Zeit verrichtet wird, heißt Kaza. Das Nachholen von versäumten Pflichtgebeten aufgrund von Vergessen, Schlaf oder Vernachlässigung ist Pflicht (Fard). Nur Fard- und Witr-Gebete müssen nachgeholt werden – freiwillige Gebete haben kein Kaza (außer dem Fajr-Sunnat, das am selben Tag bis Mittag nachgeholt werden kann).',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'Was ist die Vergessenheitsprostration (Sujud al-Sahw)?',
          description: 'Zwei Niederwerfungen am Ende des Gebets zum Ausgleich von Fehlern.',
          content: 'Sujud al-Sahw bezeichnet die zwei Niederwerfungen am Ende des Gebets, wenn eine Fard-Handlung verzögert oder eine Wajib-Handlung ausgelassen wurde. Ausführung: Nach dem Tashahhud im letzten Sitzen und dem Salam nach rechts, „Allahu Akbar" sagen und zweimal niederwerfen. Dann sitzen, Tashahhud, Salli-Barik und Rabbana lesen und beidseitig Salam geben.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Gebetsungültigmacher',
          description: 'Handlungen, die das Gebet ungültig machen und eine Wiederholung erfordern.',
          content: 'Folgendes macht das Gebet ungültig: Sprechen, lautes Lachen (lautes Lachen macht auch das Wudu ungültig), Essen oder Trinken, die Brust von der Qibla abwenden, übermäßige Bewegungen (so viel, dass ein Beobachter denken würde, du betest nicht), Pusten oder Schmerzlaute während des Gebets.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'fr') {
      return [
        _LessonItem(
          title: 'La Prière en Communauté',
          description: 'L\'importance, la vertu et les règles de suivre l\'imam dans la prière collective.',
          content: 'La prière en communauté est vingt-sept fois plus méritoire que prier seul. Dans la prière collective, les fidèles (muqtadi) doivent suivre l\'imam. Quand l\'imam dit takbir, vous dites takbir ; quand il s\'incline, vous vous inclinez ; quand il se prosterne, vous vous prosternez. Aucun rukn n\'est accompli avant l\'imam. Debout en qiyam, la communauté écoute pendant que l\'imam récite à voix haute.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'Comment Rattraper les Prières Manquées (Qada) ?',
          description: 'Règles pour rattraper les prières non accomplies à temps.',
          content: 'Une prière accomplie après l\'expiration de son temps prescrit s\'appelle qada. Rattraper les prières obligatoires manquées par oubli, sommeil ou négligence est obligatoire (fard). Seules les prières fard et witr doivent être rattrapées — les prières surérogatoires n\'ont pas de qada (sauf la sunna du Fajr, qui peut être rattrapée avant midi le même jour).',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'Qu\'est-ce que la Prosternation de l\'Oubli (Sujud al-Sahw) ?',
          description: 'Deux prosternations à la fin de la prière pour compenser les erreurs.',
          content: 'Le Sujud al-Sahw désigne les deux prosternations effectuées à la fin de la prière lorsqu\'un fard (acte obligatoire) a été retardé ou un wajib (acte nécessaire) omis. Comment l\'effectuer : Après la récitation du Tashahhud dans la dernière position assise et le salam à droite, dire « Allahu Akbar » et se prosterner deux fois. Puis s\'asseoir, réciter le Tashahhud, Salli-Barik et les invocations Rabbana, puis donner le salam des deux côtés.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Ce qui Invalide la Prière',
          description: 'Actions qui annulent la prière et nécessitent de la recommencer.',
          content: 'Ce qui invalide la prière : parler, rire aux éclats (le rire fort annule aussi les ablutions), manger ou boire, tourner la poitrine loin de la qibla, effectuer des mouvements excessifs (au point qu\'un observateur penserait que vous ne priez pas), souffler ou pousser des gémissements pendant la prière.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'es') {
      return [
        _LessonItem(
          title: 'Oración en Congregación',
          description: 'La importancia, virtud y reglas de seguir al imam en la oración congregacional.',
          content: 'La oración en congregación es veintisiete veces más virtuosa que rezar solo. En la oración congregacional, los seguidores (muqtadi) deben seguir al imam. Cuando el imam dice takbir, tú dices takbir; cuando hace ruku, tú haces ruku; cuando se postra, tú te postras. Ningún rukn se realiza antes que el imam. De pie en qiyam, la congregación escucha mientras el imam recita en voz alta.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: '¿Cómo Recuperar las Oraciones Perdidas (Qada)?',
          description: 'Reglas para recuperar las oraciones no realizadas a tiempo.',
          content: 'Una oración realizada después de que su tiempo prescrito ha pasado se llama qada. Recuperar las oraciones obligatorias perdidas por olvido, sueño o negligencia es obligatorio (fard). Solo las oraciones fard y witr deben recuperarse — las oraciones voluntarias no tienen qada (excepto la sunna del Fajr, que puede recuperarse antes del mediodía del mismo día).',
          icon: Icons.history,
        ),
        _LessonItem(
          title: '¿Qué es la Postración del Olvido (Sujud al-Sahw)?',
          description: 'Dos postraciones al final de la oración para compensar los errores.',
          content: 'El Sujud al-Sahw se refiere a las dos postraciones realizadas al final de la oración cuando un fard (acto obligatorio) ha sido retrasado o un wajib (acto necesario) omitido. Cómo realizarlo: Después de recitar el Tashahhud en la última posición sentada y dar salam a la derecha, decir "Allahu Akbar" y postrarse dos veces. Luego sentarse, recitar el Tashahhud, Salli-Barik y las súplicas Rabbana, y dar salam a ambos lados.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Lo que Invalida la Oración',
          description: 'Movimientos y acciones que anulan la oración y requieren repetirla.',
          content: 'Lo siguiente invalida la oración: hablar, reírse a carcajadas (la risa fuerte también rompe el wudu), comer o beber, girar el pecho lejos de la qibla, movimientos excesivos (tanto que un observador pensaría que no estás rezando), soplar o hacer sonidos de angustia durante la oración.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'id') {
      return [
        _LessonItem(
          title: 'Salat Berjamaah',
          description: 'Pentingnya, keutamaan, dan aturan mengikuti imam dalam salat berjamaah.',
          content: 'Salat berjamaah dua puluh tujuh kali lebih utama daripada salat sendirian. Saat salat berjamaah, makmum harus mengikuti imam. Ketika imam bertakbir, Anda bertakbir; ketika imam rukuk, Anda rukuk; ketika imam sujud, Anda sujud. Tidak ada rukun yang mendahului imam. Saat berdiri (qiyam), jamaah mendengarkan saat imam membaca dengan suara keras.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'Cara Mengqada Salat yang Terlewat',
          description: 'Aturan untuk mengganti salat yang tidak dikerjakan tepat waktu.',
          content: 'Salat yang dikerjakan setelah waktunya habis disebut qada. Mengqada salat fardu yang terlewat karena lupa, tertidur, atau kelalaian hukumnya wajib (fardu). Hanya salat fardu dan witir yang perlu diqada — salat sunah tidak diqada (kecuali sunah Subuh, yang dapat diqada sebelum tengah hari pada hari yang sama). Saat niat, ucapkan: "Saya berniat mengqada salat fardu Subuh/Zuhur pertama yang belum saya kerjakan karena Allah Ta\'ala."',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'Apa itu Sujud Sahwi?',
          description: 'Dua sujud yang dilakukan di akhir salat untuk menutupi kesalahan.',
          content: 'Sujud Sahwi adalah dua sujud yang dilakukan di akhir salat ketika rukun (fardu) tertunda atau perbuatan yang wajib ditinggalkan atau tertunda. Cara melakukannya: Setelah membaca Tasyahud pada duduk terakhir dan salam ke kanan, ucapkan "Allahu Akbar" lalu sujud dua kali. Kemudian duduk, baca Tasyahud, selawat (Salli-Barik), dan doa Rabbana, lalu salam ke kedua sisi untuk menyelesaikan salat.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Hal-hal yang Membatalkan Salat',
          description: 'Gerakan dan perbuatan yang membatalkan salat dan mengharuskan untuk diulang.',
          content: 'Berikut ini membatalkan salat: berbicara, tertawa terbahak-bahak (tertawa keras juga membatalkan wudu), makan atau minum, memalingkan dada dari kiblat, banyak bergerak (sehingga orang yang melihat mengira Anda tidak sedang salat), meniup atau mengerang kesakitan saat salat.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'ru') {
      return [
        _LessonItem(
          title: 'Молитва в джамаате (коллективная)',
          description: 'Важность, достоинство и правила следования за имамом в коллективной молитве.',
          content: 'Коллективная молитва в двадцать семь раз превосходит индивидуальную. Во время коллективной молитвы следующие за имамом (муктади) должны повторять его действия. Когда имам произносит такбир, вы произносите такбир; когда он совершает поясной поклон (руку), вы совершаете руку; когда он совершает земной поклон (суджуд), вы совершаете суджуд. Ни один рукн (столп) не совершается раньше имама. Во время стояния (кыям) джамаат слушает, когда имам читает вслух.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'Как восполнять пропущенные молитвы (Каза)?',
          description: 'Правила восполнения молитв, которые не были совершены вовремя.',
          content: 'Молитва, совершенная после истечения предписанного времени, называется каза. Восполнение пропущенных обязательных молитв из-за забывчивости, сна или пренебрежения является обязательным (фард). Восполнять нужно только молитвы фард и витр — добровольные молитвы не имеют каза (за исключением сунны фаджра, которую можно восполнить до полудня того же дня). При намерении скажите: "Я намереваюсь совершить каза моей первой пропущенной обязательной молитвы фаджр/зухр ради Аллаха".',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'Что такое саджда сахв (поклон невнимательности)?',
          description: 'Два земных поклона, совершаемых в конце молитвы для исправления ошибок.',
          content: 'Саджда сахв — это два земных поклона, совершаемые в конце молитвы, когда фард (обязательное действие) был отложен или ваджиб (необходимое действие) был пропущен или отложен. Как это сделать: После чтения ташаххуда в последнем сидении и приветствия (салям) в правую сторону скажите «Аллаху Акбар» и совершите два земных поклона. Затем сядьте, прочитайте ташаххуд, салли-барик и дуа Раббана, и дайте салям в обе стороны, чтобы завершить молитву.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Что нарушает молитву',
          description: 'Движения и действия, которые аннулируют молитву и требуют её повторения.',
          content: 'Молитву нарушают: разговоры, громкий смех (громкий смех также нарушает омовение), еда или питье, отворачивание груди от киблы, чрезмерные движения (настолько, что наблюдатель подумал бы, что вы не молитесь), дуновение или стоны во время молитвы.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'it') {
      return [
        _LessonItem(
          title: 'La Preghiera in Congregazione',
          description: 'L\'importanza, la virtù e le regole per seguire l\'imam nella preghiera congregazionale.',
          content: 'La preghiera in congregazione è ventisette volte più virtuosa della preghiera individuale. Durante la preghiera in congregazione, i fedeli (muqtadi) devono seguire l\'imam. Quando l\'imam dice takbir, tu dici takbir; quando si inchina, tu ti inchini; quando si prostra, tu ti prostri. Nessun rukn (pilastro) viene eseguito prima dell\'imam. Mentre si è in piedi nel qiyam, la congregazione ascolta mentre l\'imam recita ad alta voce.',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'Come Recuperare le Preghiere Perse (Qada)?',
          description: 'Regole per recuperare le preghiere che non sono state eseguite in tempo.',
          content: 'Una preghiera eseguita dopo che il suo tempo stabilito è trascorso è chiamata qada. Recuperare le preghiere obbligatorie perse per dimenticanza, sonno o negligenza è obbligatorio (fard). Solo le preghiere fard e witr devono essere recuperate — le preghiere volontarie non hanno qada (eccetto la sunnah del Fajr, che può essere recuperata prima di mezzogiorno dello stesso giorno). Quando formuli l\'intenzione, di\': "Ho l\'intenzione di pregare il qada della mia prima preghiera fard di Fajr/Dhuhr in sospeso per amore di Allah".',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'Cos\'è la Prostrazione della Dimenticanza (Sujud al-Sahw)?',
          description: 'Due prostrazioni eseguite alla fine della preghiera per compensare gli errori.',
          content: 'Sujud al-Sahw si riferisce alle due prostrazioni eseguite alla fine della preghiera quando un fard (atto obbligatorio) è stato ritardato o un wajib (atto necessario) è stato omesso o ritardato. Come eseguirlo: Dopo aver recitato il Tashahhud nell\'ultima seduta e aver dato il salaam al lato destro, di\' "Allahu Akbar" e prostrati due volte. Quindi siediti, recita il Tashahhud, Salli-Barik e le suppliche Rabbana, e dai il salaam ad entrambi i lati per completare la preghiera.',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'Cose che Invalidano la Preghiera',
          description: 'Movimenti e azioni che annullano la preghiera e richiedono di ripeterla.',
          content: 'Le seguenti cose invalidano la preghiera: parlare, ridere ad alta voce (una risata forte rompe anche il wudu), mangiare o bere, allontanare il petto dalla qibla, movimento eccessivo (così tanto che un osservatore penserebbe che non stai pregando), soffiare o emettere suoni di sofferenza durante la preghiera.',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    } else if (lang == 'ur') {
      return [
        _LessonItem(
          title: 'باجماعت نماز',
          description: 'باجماعت نماز میں امام کی پیروی کی اہمیت، فضیلت اور احکام۔',
          content: 'باجماعت نماز اکیلے نماز پڑھنے سے ستائیس گنا زیادہ فضیلت رکھتی ہے۔ باجماعت نماز کے دوران مقتدیوں کو امام کی پیروی کرنی چاہیے۔ جب امام تکبیر کہے تو آپ تکبیر کہیں؛ جب وہ رکوع کرے تو آپ رکوع کریں؛ جب وہ سجدہ کرے تو آپ سجدہ کریں۔ کوئی بھی رکن امام سے پہلے ادا نہیں کیا جاتا۔ قیام کی حالت میں، جب امام بلند آواز سے تلاوت کرے تو جماعت سنتی ہے۔',
          icon: Icons.groups_outlined,
        ),
        _LessonItem(
          title: 'قضا نمازیں کیسے ادا کریں؟',
          description: 'وقت پر ادا نہ کی گئی نمازوں کی قضا کے احکام۔',
          content: 'مقررہ وقت گزرنے کے بعد پڑھی جانے والی نماز کو قضا کہتے ہیں۔ بھولنے، نیند یا غفلت کی وجہ سے چھوٹی ہوئی فرض نمازوں کی قضا پڑھنا فرض ہے۔ صرف فرض اور وتر نمازوں کی قضا ہوتی ہے — نفل نمازوں کی قضا نہیں ہوتی (سوائے فجر کی سنت کے، جو اسی دن دوپہر سے پہلے قضا کی جا سکتی ہے)۔ نیت کرتے وقت کہیں: "میں اللہ کی رضا کے لیے اپنی پہلی چھوٹی ہوئی فجر/ظہر کی فرض نماز کی قضا کی نیت کرتا ہوں۔"',
          icon: Icons.history,
        ),
        _LessonItem(
          title: 'سجدہ سہو کیا ہے؟',
          description: 'غلطیوں کی تلافی کے لیے نماز کے آخر میں دو سجدے۔',
          content: 'سجدہ سہو سے مراد وہ دو سجدے ہیں جو نماز کے آخر میں اس وقت کیے جاتے ہیں جب کوئی فرض تاخیر کا شکار ہو جائے یا کوئی واجب چھوٹ جائے یا تاخیر سے ادا ہو۔ اس کا طریقہ: آخری قعدہ میں تشہد پڑھنے اور دائیں طرف سلام پھیرنے کے بعد "اللہ اکبر" کہیں اور دو سجدے کریں۔ پھر بیٹھیں، تشہد، درود شریف اور ربنا کی دعائیں پڑھیں، اور نماز مکمل کرنے کے لیے دونوں طرف سلام پھیریں۔',
          icon: Icons.cached,
        ),
        _LessonItem(
          title: 'نماز کو باطل کرنے والی چیزیں',
          description: 'ایسی حرکات و سکنات جو نماز کو باطل کر دیتی ہیں اور اسے دوبارہ پڑھنا ضروری ہوتا ہے۔',
          content: 'درج ذیل چیزیں نماز کو باطل کر دیتی ہیں: بات کرنا، زور سے ہنسنا (زور کی ہنسی وضو بھی توڑ دیتی ہے)، کھانا یا پینا، سینے کو قبلہ سے پھیرنا، حد سے زیادہ حرکت کرنا (اس قدر کہ دیکھنے والا سمجھے کہ آپ نماز نہیں پڑھ رہے)، نماز کے دوران پھونک مارنا یا درد و تکلیف کی آوازیں نکالنا۔',
          icon: Icons.warning_amber_rounded,
        ),
      ];
    }
    // Turkish (default)
    return [
      _LessonItem(
        title: 'Cemaatle Namaz Kılmak',
        description: 'Cemaatle namaz kılmanın önemi, fazileti ve imama uyma kuralları.',
        content: 'Cemaatle namaz kılmak, tek başına kılmaktan yirmi yedi derece daha faziletlidir. Cemaatle namaz kılarken cemaatin imama uyması (iktida) gerekir. İmam tekbir aldığında tekbir alınır, rükûya gittiğinde gidilir, secdeye gittiğinde secdeye gidilir. İmamdan önce herhangi bir rükün yapılmaz. Kıyamda ayaktayken imam sesli okurken cemaat dinler.',
        icon: Icons.groups_outlined,
      ),
      _LessonItem(
        title: 'Kaza Namazları Nasıl Kılınır?',
        description: 'Vaktinde kılınamayan namazların kaza edilmesi kuralları.',
        content: 'Farz olan bir namazın vakti çıktıktan sonra kılınmasına kaza denir. Unutma, uyku gibi mazeretlerle veya ihmal sebebiyle kılınamayan namazların kaza edilmesi farzdır. Sadece farz namazlar ve vitir namazı kaza edilir, sünnet namazların kazası olmaz (sabah namazının sünneti hariç, o gün öğleye kadar kaza edilirse sünneti de kılınabilir). Niyet ederken \"Niyet ettim Allah rızası için ilk kazaya kalan Sabah/Öğle namazının farzını kılmaya\" şeklinde niyet edilir.',
        icon: Icons.history,
      ),
      _LessonItem(
        title: 'Sehiv Secdesi Nedir?',
        description: 'Namaz içinde yapılan yanılgıları telafi etmek için yapılan secde.',
        content: 'Sehiv secdesi, namazda yanılarak bir farzın geciktirilmesi veya bir vacibin terk edilmesi ya da geciktirilmesi durumunda, namazın sonunda yapılan iki secdeye denir. Yapılışı: Son oturuşta Ettehiyyâtü okunup sağ tarafa selam verildikten sonra \"Allâhu Ekber\" diyerek iki defa secdeye gidilir. Oturup Ettehiyyâtü, Salli-Barik ve Rabbena duaları okunarak normal şekilde her iki tarafa selam verilip namaz bitirilir.',
        icon: Icons.cached,
      ),
      _LessonItem(
        title: 'Namazı Bozan Durumlar',
        description: 'Namaz ibadetini geçersiz kılan ve yeniden kılmayı gerektiren hareketler.',
        content: 'Namazda konuşmak, gülmek (yanındakinin duyacağı kadar gülmek abdesti de bozar), bir şey yemek veya içmek, kıbleden göğsünü çevirmek, amel-i kesir yapmak (dışarıdan bakan birinin namaz kılmıyor olduğunu düşünecek kadar namaz dışı hareket etmek), namazda üflemek veya ah vah demek namazı bozar.',
        icon: Icons.warning_amber_rounded,
      ),
    ];
  }

  void _showLessonDetail(BuildContext context, _LessonItem lesson, bool isDark, String lang) {
    final closeLabel = lang == 'tr' ? 'Kapat' : lang == 'de' ? 'Schließen' : lang == 'fr' ? 'Fermer' : lang == 'es' ? 'Cerrar' : lang == 'id' ? 'Tutup' : lang == 'ru' ? 'Закрыть' : lang == 'it' ? 'Chiudi' : lang == 'ur' ? 'بند کریں' : 'Close';
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.9,
          minChildSize: 0.5,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Icon(lesson.icon, color: AppColors.premiumGold, size: 28),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          lesson.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  Text(
                    lesson.content,
                    style: TextStyle(
                      fontSize: 15,
                      color: isDark ? Colors.white70 : Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.emeraldGreen,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(closeLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _LessonItem {
  final String title;
  final String description;
  final String content;
  final IconData icon;

  const _LessonItem({
    required this.title,
    required this.description,
    required this.content,
    required this.icon,
  });
}
