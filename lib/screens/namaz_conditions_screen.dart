import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';

class _ConditionItem {
  final String title;
  final String description;
  const _ConditionItem(this.title, this.description);
}

class NamazConditionsScreen extends StatelessWidget {
  const NamazConditionsScreen({super.key});

  List<_ConditionItem> _getOuterConditions(String lang) {
    if (lang == 'en') {
      return const [
        _ConditionItem('1. Purification from Hadath', 'Purification from unseen impurities. It means performing wudu, ghusl if necessary, or tayammum when water is unavailable.'),
        _ConditionItem('2. Purification from Najasah', 'Purification from visible impurities. Ensuring the body, clothes, and the place of prayer are free from impurities that invalidate prayer.'),
        _ConditionItem('3. Covering the Awrah (Setr-i Avret)', 'Covering the parts of the body that must be concealed during prayer. For men, it is from the navel to the knee; for women, the whole body except the face, hands, and feet.'),
        _ConditionItem('4. Facing the Qiblah', 'Facing the direction of the Kaaba while praying. The chest must be directed towards the Qiblah when starting the prayer.'),
        _ConditionItem('5. Time', 'Performing prayers within their prescribed times. A prayer cannot be performed before its time has begun.'),
        _ConditionItem('6. Intention (Niyyah)', 'Knowing in the heart which prayer is being performed and intending to perform it. Pronouncing it with the tongue is sunnah.'),
      ];
    } else if (lang == 'de') {
      return const [
        _ConditionItem('1. Reinigung von Hadath', 'Reinigung von unsichtbaren Unreinheiten. Es bedeutet, Wudu oder falls nötig Ghusl durchzuführen, oder Tayammum, wenn kein Wasser verfügbar ist.'),
        _ConditionItem('2. Reinigung von Najasah', 'Reinigung von sichtbaren Unreinheiten. Sicherstellen, dass Körper, Kleidung und der Gebetsort frei von Unreinheiten sind.'),
        _ConditionItem('3. Bedeckung der Awrah (Setr-i Avret)', 'Bedeckung der Körperteile, die im Gebet verhüllt sein müssen. Für Männer vom Bauchnabel bis zum Knie; für Frauen der ganze Körper außer Gesicht, Händen und Füßen.'),
        _ConditionItem('4. Ausrichtung zur Qibla', 'Sich beim Beten in Richtung der Kaaba wenden. Beim Beginn des Gebets muss die Brust zur Qibla gerichtet sein.'),
        _ConditionItem('5. Zeit', 'Verrichtung der Gebete innerhalb der vorgeschriebenen Zeiten. Ein Gebet kann nicht verrichtet werden, bevor seine Zeit begonnen hat.'),
        _ConditionItem('6. Absicht (Niyyah)', 'Im Herzen wissen, welches Gebet verrichtet wird, und die Absicht dazu fassen. Es mit der Zunge auszusprechen, ist Sunna.'),
      ];
    } else if (lang == 'fr') {
      return const [
        _ConditionItem('1. Purification de Hadath', 'Purification des impuretés invisibles. C\'est accomplir les ablutions (Wudu), le bain rituel (Ghusl) si nécessaire, ou le Tayammum.'),
        _ConditionItem('2. Purification de Najasah', 'Purification des impuretés visibles. S\'assurer que le corps, les vêtements et le lieu de prière sont exempts d\'impuretés.'),
        _ConditionItem('3. Couvrir la \'Awrah', 'Couvrir les parties du corps qui doivent l\'être pendant la prière. Pour les hommes, du nombril au genou; pour les femmes, tout le corps sauf le visage, les mains et les pieds.'),
        _ConditionItem('4. S\'orienter vers la Qibla', 'Se tourner vers la Kaaba pour prier. La poitrine doit être dirigée vers la Qibla au début de la prière.'),
        _ConditionItem('5. Temps', 'Accomplir les prières dans les temps prescrits. Une prière ne peut être accomplie avant son heure.'),
        _ConditionItem('6. Intention (Niyyah)', 'Savoir dans son cœur quelle prière on va accomplir et en avoir l\'intention. La prononcer verbalement est sounnah.'),
      ];
    } else if (lang == 'es') {
      return const [
        _ConditionItem('1. Purificación de Hadath', 'Purificación de impurezas invisibles. Significa realizar el Wudu, el Ghusl si es necesario, o Tayammum cuando no hay agua.'),
        _ConditionItem('2. Purificación de Najasah', 'Purificación de impurezas visibles. Asegurar que el cuerpo, la ropa y el lugar de oración estén libres de impurezas.'),
        _ConditionItem('3. Cubrir el Awrah', 'Cubrir las partes del cuerpo que deben ocultarse durante la oración. Para los hombres, del ombligo a la rodilla; para las mujeres, todo el cuerpo excepto la cara, manos y pies.'),
        _ConditionItem('4. Orientarse a la Qibla', 'Orientarse hacia la Kaaba al rezar. El pecho debe estar dirigido hacia la Qibla al comenzar la oración.'),
        _ConditionItem('5. Tiempo', 'Realizar las oraciones en sus tiempos prescritos. No se puede rezar una oración antes de su tiempo.'),
        _ConditionItem('6. Intención (Niyyah)', 'Saber en el corazón qué oración se va a realizar y tener la intención. Pronunciarlo con la lengua es sunnah.'),
      ];
    } else if (lang == 'id') {
      return const [
        _ConditionItem('1. Suci dari Hadas', 'Menyucikan diri dari hadas. Artinya berwudhu, mandi wajib jika perlu, atau bertayamum jika tidak ada air.'),
        _ConditionItem('2. Suci dari Najis', 'Menyucikan diri dari najis. Memastikan tubuh, pakaian, dan tempat shalat bebas dari najis.'),
        _ConditionItem('3. Menutup Aurat', 'Menutupi bagian tubuh yang wajib ditutupi saat shalat. Bagi laki-laki dari pusar hingga lutut; bagi wanita seluruh tubuh kecuali wajah, telapak tangan, dan kaki.'),
        _ConditionItem('4. Menghadap Kiblat', 'Menghadap ke arah Ka\'bah saat shalat. Dada harus menghadap Kiblat saat memulai shalat.'),
        _ConditionItem('5. Masuk Waktu', 'Mengerjakan shalat pada waktunya. Shalat tidak sah jika dikerjakan sebelum waktunya masuk.'),
        _ConditionItem('6. Niat', 'Mengetahui di dalam hati shalat apa yang dikerjakan dan berniat. Mengucapkannya dengan lisan adalah sunnah.'),
      ];
    } else if (lang == 'ru') {
      return const [
        _ConditionItem('1. Очищение от Хадаса', 'Очищение от невидимых нечистот. Означает совершение малого (вуду) или большого (гусль) омовения, или таяммума при отсутствии воды.'),
        _ConditionItem('2. Очищение от Наджасы', 'Очищение от видимых нечистот. Убедиться, что тело, одежда и место молитвы очищены от нечистот.'),
        _ConditionItem('3. Укрытие Аврата', 'Укрытие частей тела, которые должны быть скрыты. Для мужчин: от пупка до колен; для женщин: все тело, кроме лица, кистей рук и стоп.'),
        _ConditionItem('4. Обращение к Кибле', 'Обращение лицом к Каабе во время молитвы. Грудь должна быть направлена к Кибле в начале молитвы.'),
        _ConditionItem('5. Время', 'Совершение молитв в предписанное время. Молитва не может быть совершена до наступления ее времени.'),
        _ConditionItem('6. Намерение (Ният)', 'Знание в сердце, какая молитва совершается. Произнесение намерения языком является сунной.'),
      ];
    } else if (lang == 'it') {
      return const [
        _ConditionItem('1. Purificazione da Hadath', 'Purificazione dalle impurità invisibili. Significa eseguire il wudu, il ghusl se necessario, o il tayammum quando l\'acqua non è disponibile.'),
        _ConditionItem('2. Purificazione da Najasah', 'Purificazione dalle impurità visibili. Assicurarsi che il corpo, i vestiti e il luogo della preghiera siano privi di impurità.'),
        _ConditionItem('3. Copertura dell\'Awrah', 'Coprire le parti del corpo che devono essere nascoste. Per gli uomini, dall\'ombelico al ginocchio; per le donne, tutto il corpo tranne viso, mani e piedi.'),
        _ConditionItem('4. Direzione verso la Qibla', 'Rivolgersi verso la Kaaba. Il petto deve essere diretto verso la Qibla all\'inizio della preghiera.'),
        _ConditionItem('5. Tempo', 'Eseguire le preghiere nei tempi prescritti. Una preghiera non può essere eseguita prima del suo tempo.'),
        _ConditionItem('6. Intenzione (Niyyah)', 'Sapere nel cuore quale preghiera si sta eseguendo. Pronunciarla con la lingua è sunnah.'),
      ];
    } else if (lang == 'ur') {
      return const [
        _ConditionItem('1. حدث سے طہارت', 'پوشیدہ نجاست سے پاکی۔ اس کا مطلب وضو کرنا، ضرورت پڑنے پر غسل کرنا، یا پانی نہ ہونے پر تیمم کرنا ہے۔'),
        _ConditionItem('2. نجاست سے طہارت', 'ظاہری نجاست سے پاکی۔ اس بات کو یقینی بنانا کہ جسم، کپڑے اور نماز کی جگہ نجاست سے پاک ہو۔'),
        _ConditionItem('3. ستر عورت', 'جسم کے ان حصوں کو چھپانا جو نماز میں چھپانا فرض ہیں۔ مردوں کے لیے ناف سے گھٹنوں تک؛ عورتوں کے لیے چہرہ، ہاتھ اور پاؤں کے علاوہ پورا جسم۔'),
        _ConditionItem('4. استقبال قبلہ', 'نماز پڑھتے وقت کعبہ کی طرف رخ کرنا۔ نماز شروع کرتے وقت سینہ قبلہ رخ ہونا چاہیے۔'),
        _ConditionItem('5. وقت', 'نمازوں کو ان کے مقررہ اوقات میں ادا کرنا۔ کوئی بھی نماز وقت شروع ہونے سے پہلے ادا نہیں کی جا سکتی۔'),
        _ConditionItem('6. نیت', 'دل میں یہ جاننا کہ کون سی نماز پڑھی جا رہی ہے اور اس کی نیت کرنا۔ زبان سے نیت کرنا سنت ہے۔'),
      ];
    }
    // Turkish
    return const [
      _ConditionItem('1. Hadesten Taharet', 'Görünmeyen kirlilikten temizlenmektir. Yani namaz kılmak için abdest almak, gerekiyorsa gusül abdesti almak veya su bulunmadığında teyemmüm yapmaktır.'),
      _ConditionItem('2. Necasetten Taharet', 'Görünen kirlilikten temizlenmektir. Namaz kılacak kişinin bedeninde, elbisesinde ve namaz kılacağı yerde necaset (namaza engel olan pislik) bulunmaması, varsa temizlenmesidir.'),
      _ConditionItem('3. Setr-i Avret', 'Namaz kılarken vücudun örtülmesi gereken yerlerini örtmektir. Erkekler için en az göbek ile diz kapağı arası; kadınlar için ise el, yüz ve ayaklar dışındaki tüm bedendir.'),
      _ConditionItem('4. İstikbal-i Kıble', 'Namaz kılarken kıbleye yani Kabe istikametine yönelmektir. Namaza başlarken gövdemiz kıbleye doğru dönük olmalıdır.'),
      _ConditionItem('5. Vakit', 'Namazları kendi vakitleri içinde kılmaktır. Vakti girmemiş bir namaz kılınamaz. Her namazın kendine has bir kılınış vakti vardır.'),
      _ConditionItem('6. Niyet', 'Namaz kılarken hangi vakit namazını kılacağını kalben bilmek ve niyet etmektir. Dil ile de niyet etmek sünnettir.'),
    ];
  }

  List<_ConditionItem> _getInnerConditions(String lang) {
    if (lang == 'en') {
      return const [
        _ConditionItem('1. Opening Takbir (Iftitah)', 'Starting the prayer by saying "Allahu Akbar".'),
        _ConditionItem('2. Standing (Qiyam)', 'Standing during the prayer. It is obligatory for those who are able to stand during fard prayers.'),
        _ConditionItem('3. Recitation (Qira\'at)', 'Reciting the Holy Quran while standing in prayer. At least one short surah or three short verses must be recited.'),
        _ConditionItem('4. Bowing (Ruku\')', 'Bowing down with hands on the knees after recitation. Keeping the back straight is sunnah.'),
        _ConditionItem('5. Prostration (Sujud)', 'Prostrating by placing the forehead, nose, hands, knees, and toes on the ground after rising from Ruku. Done twice in each rakat.'),
        _ConditionItem('6. Final Sitting (Qa\'dah Akhirah)', 'Sitting at the end of the prayer long enough to recite the "At-Tahiyyat" supplication. This is the final pillar of the prayer.'),
      ];
    } else if (lang == 'de') {
      return const [
        _ConditionItem('1. Eröffnungs-Takbir (Iftitah)', 'Das Gebet mit den Worten "Allahu Akbar" beginnen.'),
        _ConditionItem('2. Stehen (Qiyam)', 'Während des Gebets stehen. Es ist Pflicht für diejenigen, die bei Fard-Gebeten stehen können.'),
        _ConditionItem('3. Rezitation (Qira\'at)', 'Das Lesen aus dem Heiligen Koran im Stehen. Mindestens eine kurze Sure oder drei kurze Verse müssen gelesen werden.'),
        _ConditionItem('4. Verbeugung (Ruku\')', 'Nach der Rezitation mit den Händen auf den Knien verbeugen. Einen geraden Rücken zu bewahren ist Sunna.'),
        _ConditionItem('5. Niederwerfung (Sujud)', 'Sich nach dem Aufrichten aus dem Ruku niederwerfen, indem Stirn, Nase, Hände, Knie und Zehen den Boden berühren. Zweimal pro Raka.'),
        _ConditionItem('6. Letztes Sitzen (Qa\'dah Akhirah)', 'Am Ende des Gebets so lange sitzen, wie es dauert, "At-Tahiyyat" zu rezitieren. Dies ist die letzte Säule des Gebets.'),
      ];
    } else if (lang == 'fr') {
      return const [
        _ConditionItem('1. Takbir d\'ouverture (Iftitah)', 'Commencer la prière en disant "Allahu Akbar".'),
        _ConditionItem('2. Station debout (Qiyam)', 'Se tenir debout pendant la prière. C\'est obligatoire pour ceux qui le peuvent lors des prières fard.'),
        _ConditionItem('3. Récitation (Qira\'at)', 'Réciter le Saint Coran en position debout. Au moins une courte sourate ou trois courts versets doivent être récités.'),
        _ConditionItem('4. Inclinaison (Ruku\')', 'S\'incliner en posant les mains sur les genoux après la récitation. Garder le dos droit est sounnah.'),
        _ConditionItem('5. Prosternation (Sujud)', 'Se prosterner en posant le front, le nez, les mains, les genoux et les orteils au sol. Fait deux fois dans chaque rakat.'),
        _ConditionItem('6. Assise finale (Qa\'dah Akhirah)', 'S\'asseoir à la fin de la prière le temps de réciter "At-Tahiyyat". C\'est le dernier pilier de la prière.'),
      ];
    } else if (lang == 'es') {
      return const [
        _ConditionItem('1. Takbir de apertura (Iftitah)', 'Comenzar la oración diciendo "Allahu Akbar".'),
        _ConditionItem('2. Estar de pie (Qiyam)', 'Estar de pie durante la oración. Es obligatorio para quienes pueden hacerlo durante las oraciones fard.'),
        _ConditionItem('3. Recitación (Qira\'at)', 'Recitar el Sagrado Corán de pie en la oración. Debe recitarse al menos una sura corta o tres versículos cortos.'),
        _ConditionItem('4. Inclinación (Ruku\')', 'Inclinarse con las manos en las rodillas después de la recitación. Mantener la espalda recta es sunnah.'),
        _ConditionItem('5. Postración (Sujud)', 'Postrarse apoyando la frente, nariz, manos, rodillas y dedos de los pies en el suelo. Se hace dos veces en cada rakat.'),
        _ConditionItem('6. Sentada final (Qa\'dah Akhirah)', 'Sentarse al final de la oración el tiempo suficiente para recitar "At-Tahiyyat". Este es el último pilar de la oración.'),
      ];
    } else if (lang == 'id') {
      return const [
        _ConditionItem('1. Takbiratul Ihram', 'Memulai shalat dengan mengucapkan "Allahu Akbar".'),
        _ConditionItem('2. Berdiri (Qiyam)', 'Berdiri selama shalat. Diwajibkan bagi mereka yang mampu berdiri saat shalat fardhu.'),
        _ConditionItem('3. Membaca Al-Qur\'an (Qira\'at)', 'Membaca Al-Qur\'an saat berdiri dalam shalat. Setidaknya satu surah pendek atau tiga ayat pendek.'),
        _ConditionItem('4. Ruku\'', 'Membungkuk dengan tangan di lutut setelah membaca Al-Qur\'an. Menjaga punggung tetap lurus adalah sunnah.'),
        _ConditionItem('5. Sujud', 'Bersujud dengan meletakkan dahi, hidung, tangan, lutut, dan jari kaki di tanah setelah bangkit dari Ruku. Dilakukan dua kali setiap rakaat.'),
        _ConditionItem('6. Duduk Akhir (Tahiyat Akhir)', 'Duduk di akhir shalat cukup lama untuk membaca doa "At-Tahiyyat". Ini adalah rukun terakhir shalat.'),
      ];
    } else if (lang == 'ru') {
      return const [
        _ConditionItem('1. Вступительный такбир (Ифтитах)', 'Начало молитвы с произнесения "Аллаху Акбар".'),
        _ConditionItem('2. Стояние (Кыям)', 'Стояние во время молитвы. Обязательно для тех, кто может стоять во время фард-молитв.'),
        _ConditionItem('3. Чтение (Кыраат)', 'Чтение Священного Корана стоя. Нужно прочесть хотя бы одну короткую суру или три коротких аята.'),
        _ConditionItem('4. Поясной поклон (Руку)', 'Поясной поклон с руками на коленях после чтения. Держать спину прямо является сунной.'),
        _ConditionItem('5. Земной поклон (Суджуд)', 'Земной поклон с касанием земли лбом, носом, руками, коленями и пальцами ног после возвращения из руку. Делается дважды в каждом ракаате.'),
        _ConditionItem('6. Последнее сидение (Када Ахира)', 'Сидение в конце молитвы достаточно долго, чтобы прочесть "Ат-Тахият". Это последний столп молитвы.'),
      ];
    } else if (lang == 'it') {
      return const [
        _ConditionItem('1. Takbir di apertura (Iftitah)', 'Iniziare la preghiera dicendo "Allahu Akbar".'),
        _ConditionItem('2. Stare in piedi (Qiyam)', 'Stare in piedi durante la preghiera. È obbligatorio per chi è in grado di farlo durante le preghiere fard.'),
        _ConditionItem('3. Recitazione (Qira\'at)', 'Recitare il Sacro Corano mentre si è in piedi. Deve essere recitata almeno una breve sura o tre brevi versetti.'),
        _ConditionItem('4. Inchinarsi (Ruku\')', 'Inchinarsi con le mani sulle ginocchia dopo la recitazione. Mantenere la schiena dritta è sunnah.'),
        _ConditionItem('5. Prostrazione (Sujud)', 'Prostrarsi appoggiando fronte, naso, mani, ginocchia e dita dei piedi a terra dopo essersi alzati dal Ruku. Fatto due volte in ogni rakat.'),
        _ConditionItem('6. Seduta finale (Qa\'dah Akhirah)', 'Sedersi alla fine della preghiera abbastanza a lungo per recitare l\'invocazione "At-Tahiyyat". Questo è l\'ultimo pilastro della preghiera.'),
      ];
    } else if (lang == 'ur') {
      return const [
        _ConditionItem('1. تکبیر تحریمہ (افتتاح)', 'نماز کا آغاز "اللہ اکبر" کہہ کر کرنا۔'),
        _ConditionItem('2. قیام', 'نماز کے دوران کھڑا ہونا۔ فرض نمازوں میں ان لوگوں کے لیے جو کھڑے ہو سکتے ہیں، کھڑا ہونا فرض ہے۔'),
        _ConditionItem('3. قراءت', 'قیام کی حالت میں قرآن مجید کی تلاوت کرنا۔ کم از کم ایک چھوٹی سورت یا تین چھوٹی آیات پڑھنا ضروری ہے۔'),
        _ConditionItem('4. رکوع', 'قراءت کے بعد گھٹنوں پر ہاتھ رکھ کر جھکنا۔ پیٹھ کو سیدھا رکھنا سنت ہے۔'),
        _ConditionItem('5. سجدہ', 'رکوع سے اٹھنے کے بعد پیشانی، ناک، ہاتھ، گھٹنے اور پاؤں کی انگلیوں کو زمین پر رکھ کر سجدہ کرنا۔ ہر رکعت میں دو بار کیا جاتا ہے۔'),
        _ConditionItem('6. قعدہ اخیرہ (آخری تشہد)', 'نماز کے آخر میں اتنی دیر تک بیٹھنا کہ "التحیات" پڑھی جا سکے۔ یہ نماز کا آخری رکن ہے۔'),
      ];
    }
    // Turkish
    return const [
      _ConditionItem('1. İftitah Tekbiri', 'Namaza başlarken "Allâhu Ekber" diyerek tekbir almak ve namaza giriş yapmaktır.'),
      _ConditionItem('2. Kıyam', 'Namazda ayakta durmaktır. Gücü yetenlerin farz namazları ayakta kılması farzdır.'),
      _ConditionItem('3. Kıraat', 'Namazda ayakta dururken Kuran-ı Kerim okumaktır. En az bir kısa sure veya üç kısa ayet miktarı okumak gerekir.'),
      _ConditionItem('4. Rükû', 'Kıraattan sonra elleri diz kapaklarına koyup eğilmektir. Sırtın düz olması sünnettir.'),
      _ConditionItem('5. Secde', 'Rükûdan doğrulduktan sonra alnı, burnu, elleri, dizleri ve ayak parmaklarını yere koyarak secde yapmaktır. Her rekatta peş peşe iki secde yapılır.'),
      _ConditionItem('6. Kade-i Ahire (Son Oturuş)', 'Namazın sonunda "Ettehiyyâtü" duasını okuyacak kadar oturup beklemektir. Namazın son rüknüdür.'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<AppProvider>(context).languageCode;
    
    final appBarTitle = lang == 'tr' ? 'Namazın Farzları (Şartları)' : lang == 'en' ? 'Conditions of Prayer' : lang == 'de' ? 'Bedingungen des Gebets' : lang == 'fr' ? 'Conditions de la Prière' : lang == 'es' ? 'Condiciones de la Oración' : lang == 'id' ? 'Syarat Shalat' : lang == 'ru' ? 'Условия Намаза' : lang == 'it' ? 'Condizioni della Preghiera' : lang == 'ur' ? 'نماز کی شرائط' : 'Conditions of Prayer';
    
    final summaryText = lang == 'tr' ? 'Namazın farzları toplam 12 tanedir. Bunlardan 6\'sı namaza başlamadan önce hazırlık aşamasında (Dışındaki Farzlar), 6\'sı ise namazın içinde (İçindeki Farzlar/Rükünler) yerine getirilir.' :
                        lang == 'en' ? 'There are 12 obligatory conditions of prayer. 6 are prerequisites before starting (Outer Conditions), and 6 are performed during the prayer (Inner Pillars).' :
                        lang == 'de' ? 'Es gibt 12 obligatorische Bedingungen des Gebets. 6 sind Voraussetzungen vor Beginn (Äußere Bedingungen) und 6 werden während des Gebets ausgeführt (Innere Säulen).' :
                        lang == 'fr' ? 'Il y a 12 conditions obligatoires de la prière. 6 sont des prérequis avant de commencer (Conditions extérieures), et 6 sont accomplies pendant la prière (Piliers intérieurs).' :
                        lang == 'es' ? 'Hay 12 condiciones obligatorias de la oración. 6 son prerrequisitos antes de comenzar (Condiciones externas), y 6 se realizan durante la oración (Pilares internos).' :
                        lang == 'id' ? 'Terdapat 12 syarat wajib shalat. 6 adalah prasyarat sebelum memulai (Syarat Eksternal), dan 6 dilaksanakan saat shalat (Rukun Internal).' :
                        lang == 'ru' ? 'Существует 12 обязательных условий намаза. 6 из них — это предварительные условия до начала намаза (Внешние условия), а 6 выполняются во время намаза (Внутренние столпы).' :
                        lang == 'it' ? 'Ci sono 12 condizioni obbligatorie per la preghiera. 6 sono prerequisiti prima di iniziare (Condizioni Esterne), e 6 si eseguono durante la preghiera (Pilastri Interni).' :
                        lang == 'ur' ? 'نماز کی 12 فرض شرائط ہیں۔ 6 نماز شروع کرنے سے پہلے ضروری ہیں (بیرونی شرائط)، اور 6 نماز کے دوران ادا کی جاتی ہیں (اندرونی ارکان)۔' :
                        'There are 12 obligatory conditions of prayer. 6 are prerequisites before starting (Outer Conditions), and 6 are performed during the prayer (Inner Pillars).';
    
    final header1 = lang == 'tr' ? 'Namaza Hazırlık Şartları (Dışındaki Farzlar)' : lang == 'en' ? 'Prerequisites (Outer Conditions)' : lang == 'de' ? 'Voraussetzungen (Äußere Bedingungen)' : lang == 'fr' ? 'Prérequis (Conditions extérieures)' : lang == 'es' ? 'Prerrequisitos (Condiciones externas)' : lang == 'id' ? 'Prasyarat (Syarat Eksternal)' : lang == 'ru' ? 'Предварительные условия (Внешние условия)' : lang == 'it' ? 'Prerequisiti (Condizioni Esterne)' : lang == 'ur' ? 'ابتدائی شرائط (بیرونی شرائط)' : 'Prerequisites (Outer Conditions)';
    final header2 = lang == 'tr' ? 'Namazın Rükünleri (İçindeki Farzlar)' : lang == 'en' ? 'Pillars of Prayer (Inner Conditions)' : lang == 'de' ? 'Säulen des Gebets (Innere Bedingungen)' : lang == 'fr' ? 'Piliers de la Prière (Conditions intérieures)' : lang == 'es' ? 'Pilares de la Oración (Condiciones internas)' : lang == 'id' ? 'Rukun Shalat (Syarat Internal)' : lang == 'ru' ? 'Столпы намаза (Внутренние условия)' : lang == 'it' ? 'Pilastri della Preghiera (Condizioni Interne)' : lang == 'ur' ? 'نماز کے ارکان (اندرونی شرائط)' : 'Pillars of Prayer (Inner Conditions)';

    final outerConditions = _getOuterConditions(lang);
    final innerConditions = _getInnerConditions(lang);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Intro Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.premiumGold.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: AppColors.premiumGold, size: 28),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      summaryText,
                      style: TextStyle(
                        fontSize: 13.5,
                        color: isDark ? Colors.white70 : Colors.black87,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // Category 1: Dışındaki Farzlar
            _buildCategoryHeader(header1, isDark),
            ...outerConditions.map((c) => _buildConditionTile(c.title, c.description, isDark)),

            const SizedBox(height: 20),

            // Category 2: İçindeki Farzlar
            _buildCategoryHeader(header2, isDark),
            ...innerConditions.map((c) => _buildConditionTile(c.title, c.description, isDark)),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0, top: 12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
        ),
      ),
    );
  }

  Widget _buildConditionTile(String title, String description, bool isDark) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: isDark ? AppColors.darkSurface : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: AppColors.champagneGold.withOpacity(0.15)),
      ),
      child: ExpansionTile(
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.5,
            color: isDark ? Colors.white : AppColors.darkEmerald,
          ),
        ),
        iconColor: AppColors.premiumGold,
        collapsedIconColor: isDark ? Colors.white60 : Colors.black45,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Text(
              description,
              style: TextStyle(
                fontSize: 13,
                color: isDark ? Colors.white70 : Colors.black87,
                height: 1.35,
              ),
            ),
          )
        ],
      ),
    );
  }
}
