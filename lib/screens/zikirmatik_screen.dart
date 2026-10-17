import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';

class ZikirmatikScreen extends StatefulWidget {
  const ZikirmatikScreen({super.key});

  @override
  State<ZikirmatikScreen> createState() => _ZikirmatikScreenState();
}

class _ZikirmatikScreenState extends State<ZikirmatikScreen> {
  int _counter = 0;
  int _target = 33;
  bool _vibrationEnabled = true;
  bool _soundEnabled = true;
  double _scale = 1.0;

  @override
  void dispose() {
    super.dispose();
  }


  int _selectedZikirIndex = 0;

  List<Map<String, dynamic>> _getZikirList(String lang) {
    final meanings = {
      'tr': [
        'Allah\'ı tüm noksanlıklardan tenzih ederim.',
        'Hamd Allah\'adır (Şükürler olsun).',
        'Allah en büyüktür.',
        'Allah\'tan başka ilah yoktur.',
        'Allah\'tan bağışlanma dilerim.',
        'Allah\'ım, Efendimiz Muhammed\'e salat ve selam eyle.',
        'Güç ve kuvvet ancak Allah\'ın yardımıyladır.',
        'Allah bize yeter, O ne güzel vekildir.',
        'Allah\'ı hamdiyle noksanlıklardan tenzih ederim.',
        'Herhangi bir hedef sınırlaması olmadan çekebilirsiniz.',
      ],
      'en': [
        'Glory be to Allah.',
        'All praise is due to Allah.',
        'Allah is the Greatest.',
        'There is no deity but Allah.',
        'I seek forgiveness from Allah.',
        'O Allah, send blessings upon Muhammad.',
        'There is no power or strength except with Allah.',
        'Allah is sufficient for us, and He is the best Disposer of affairs.',
        'Glory and praise be to Allah.',
        'You can count without any target limit.',
      ],
      'de': [
        'Ich preise Allah von aller Unvollkommenheit.',
        'Alles Lob gebührt Allah.',
        'Allah ist der Größte.',
        'Es gibt keine Gottheit außer Allah.',
        'Ich bitte Allah um Vergebung.',
        'O Allah, segne Muhammad.',
        'Es gibt keine Macht und Stärke außer durch Allah.',
        'Allah genügt uns, und Er ist der beste Beschützer.',
        'Gepriesen und gelobt sei Allah.',
        'Du kannst ohne Zielbegrenzung zählen.',
      ],
      'fr': [
        'Gloire à Allah, exempt de toute imperfection.',
        'Toute louange appartient à Allah.',
        'Allah est le plus Grand.',
        'Il n\'y a de divinité qu\'Allah.',
        'Je demande le pardon d\'Allah.',
        'Ô Allah, bénis Muhammad.',
        'Il n\'y a de puissance et de force qu\'en Allah.',
        'Allah nous suffit, et quel excellent Protecteur!',
        'Gloire et louange à Allah.',
        'Vous pouvez compter sans aucune limite de cible.',
      ],
      'es': [
        'Gloria a Allah, libre de toda imperfección.',
        'Toda alabanza pertenece a Allah.',
        'Allah es el más Grande.',
        'No hay divinidad excepto Allah.',
        'Busco el perdón de Allah.',
        'Oh Allah, bendice a Muhammad.',
        'No hay poder ni fuerza sino con Allah.',
        'Allah nos es suficiente, y es el mejor Guardián.',
        'Gloria y alabanza sean a Allah.',
        'Puedes contar sin ningún límite de objetivo.',
      ],
      'id': [
        'Maha Suci Allah.',
        'Segala puji bagi Allah.',
        'Allah Maha Besar.',
        'Tiada tuhan selain Allah.',
        'Aku memohon ampun kepada Allah.',
        'Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad.',
        'Tiada daya dan upaya kecuali dengan pertolongan Allah.',
        'Cukuplah Allah menjadi Penolong kami dan Allah adalah sebaik-baik Pelindung.',
        'Maha Suci Allah dan segala puji bagi-Nya.',
        'Anda dapat menghitung tanpa batas target.',
      ],
      'ru': [
        'Пречист Аллах.',
        'Вся хвала Аллаху.',
        'Аллах Велик.',
        'Нет божества, кроме Аллаха.',
        'Я прошу прощения у Аллаха.',
        'О Аллах, благослови Мухаммада.',
        'Нет силы и мощи ни у кого, кроме Аллаха.',
        'Достаточно нам Аллаха, Он – Прекрасный Покровитель.',
        'Пречист Аллах и хвала Ему.',
        'Вы можете считать без ограничения цели.',
      ],
      'it': [
        'Gloria ad Allah.',
        'Lode ad Allah.',
        'Allah è il più grande.',
        'Non c\'è altra divinità all\'infuori di Allah.',
        'Chiedo perdono ad Allah.',
        'O Allah, benedici Muhammad.',
        'Non c\'è forza né potenza se non in Allah.',
        'Allah ci è sufficiente ed è il miglior protettore.',
        'Gloria e lode ad Allah.',
        'Puoi contare senza alcun limite.',
      ],
      'ur': [
        'اللہ پاک ہے۔',
        'سب تعریفیں اللہ کے لیے ہیں۔',
        'اللہ سب سے بڑا ہے۔',
        'اللہ کے سوا کوئی معبود نہیں۔',
        'میں اللہ سے بخشش مانگتا ہوں۔',
        'اے اللہ، محمد پر رحمت نازل فرما۔',
        'اللہ کے سوا نہ کوئی طاقت ہے اور نہ کوئی قوت۔',
        'ہمیں اللہ کافی ہے اور وہ بہترین کارساز ہے۔',
        'اللہ پاک ہے اور اسی کے لیے سب تعریف ہے۔',
        'آپ بغیر کسی ہدف کے ذکر کر سکتے ہیں۔',
      ],
    };

    final names = {
      'en': ['Subhanallah', 'Alhamdulillah', 'Allahu Akbar', 'La ilaha illallah', 'Astaghfirullah', 'Salawat', 'La hawla wa la quwwata illa billah', 'Hasbunallahu wa ni\'mal wakeel', 'Subhanallahi wa bihamdihi', 'Free Dhikr'],
      'de': ['Subhanallah', 'Elhamdülillah', 'Allahu Ekber', 'La ilahe illallah', 'Estağfirullah', 'Salawat', 'La hawla wa la quwwata illa billah', 'Hasbunallahu wa ni\'mal wakeel', 'Subhanallahi wa bihamdihi', 'Freies Zikir'],
      'fr': ['Subhanallah', 'Alhamdoulillah', 'Allahu Akbar', 'La ilaha illallah', 'Astaghfirullah', 'Salawat', 'La hawla wa la quwwata illa billah', 'Hasbunallahu wa ni\'mal wakeel', 'Subhanallahi wa bihamdihi', 'Dhikr libre'],
      'es': ['Subhanallah', 'Alhamdulillah', 'Allahu Akbar', 'La ilaha illallah', 'Astaghfirullah', 'Salawat', 'La hawla wa la quwwata illa billah', 'Hasbunallahu wa ni\'mal wakeel', 'Subhanallahi wa bihamdihi', 'Dhikr libre'],
      'id': ['Subhanallah', 'Alhamdulillah', 'Allahu Akbar', 'La ilaha illallah', 'Astaghfirullah', 'Salawat', 'La hawla wa la quwwata illa billah', 'Hasbunallahu wa ni\'mal wakeel', 'Subhanallahi wa bihamdihi', 'Zikir Bebas'],
      'ru': ['Субханаллах', 'Альхамдулиллях', 'Аллаху Акбар', 'Ля иляха илляллах', 'Астагфируллах', 'Салават', 'Ля хавля ва ля куввата илля биллях', 'Хасбуналлаху ва нималь вакиль', 'Субханаллахи ва бихамдихи', 'Свободный зикр'],
      'it': ['Subhanallah', 'Alhamdulillah', 'Allahu Akbar', 'La ilaha illallah', 'Astaghfirullah', 'Salawat', 'La hawla wa la quwwata illa billah', 'Hasbunallahu wa ni\'mal wakeel', 'Subhanallahi wa bihamdihi', 'Dhikr Libero'],
      'ur': ['سبحان اللہ', 'الحمد للہ', 'اللہ اکبر', 'لا الہ الا اللہ', 'استغفر اللہ', 'صلوات', 'لا حول ولا قوۃ الا باللہ', 'حسبنا اللہ ونعم الوکیل', 'سبحان اللہ وبحمدہ', 'مفت ذکر'],
    };

    final arabics = [
      'سُبْحَانَ اللَّهِ', 'الْحَمْدُ لِلَّهِ', 'اللَّهُ أَكْبَرُ', 'لَا إِلَهَ إِلَّا اللَّهُ',
      'أَسْتَغْفِرُ اللَّهَ', 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ', 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ', 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ', '',
    ];

    final defaultTargets = [33, 33, 33, 99, 99, 99, 99, 99, 99, 0];

    final turkishNames = ['Sübhanallah', 'Elhamdülillah', 'Allahu Ekber', 'Lâ ilâhe illallah', 'Estağfirullah', 'Salavat-ı Şerife', 'Lâ Havle Velâ Kuvvete İllâ Billâh', 'Hasbünallâhu ve Ni\'mel Vekîl', 'Sübhânallâhi ve Bi-Hamdihî', 'Serbest Zikir'];

    final selectedMeanings = meanings[lang] ?? meanings['tr']!;
    final selectedNames = names[lang] ?? turkishNames;

    return List.generate(10, (i) => {
      'name': (lang == 'tr') ? turkishNames[i] : selectedNames[i],
      'arabic': arabics[i],
      'meaning': selectedMeanings[i],
      'defaultTarget': defaultTargets[i],
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _scale = 0.92; // Shrink animation
      
      // Haptic feedback
      if (_vibrationEnabled) {
        HapticFeedback.lightImpact();
      }
      
      // Sound feedback
      if (_soundEnabled) {
        SystemSound.play(SystemSoundType.click);
      }
      
      // Restore scale after a short delay
      Future.delayed(const Duration(milliseconds: 60), () {
        if (mounted) {
          setState(() {
            _scale = 1.0;
          });
        }
      });

      // Target reached feedback
      if (_target > 0 && _counter > 0 && _counter % _target == 0) {
        if (_vibrationEnabled) {
          HapticFeedback.vibrate();
        }
        _showTargetReachedSnackbar();
      }
    });
  }

  void _resetCounter() {
    final lang = Provider.of<AppProvider>(context, listen: false).languageCode;
    final title = lang == 'tr' ? 'Sıfırla' : lang == 'de' ? 'Zurücksetzen' : lang == 'fr' ? 'Réinitialiser' : lang == 'es' ? 'Reiniciar' : lang == 'id' ? 'Atur Ulang' : lang == 'ru' ? 'Сброс' : lang == 'it' ? 'Ripristina' : lang == 'ur' ? 'دوبارہ ترتیب دیں' : 'Reset';
    final body = lang == 'tr' ? 'Sayacı sıfırlamak istediğinizden emin misiniz? Güncel zikir kaydınız silinecektir.' : lang == 'de' ? 'Möchten Sie den Zähler wirklich zurücksetzen? Ihr aktueller Zikir-Datensatz wird gelöscht.' : lang == 'fr' ? 'Êtes-vous sûr de vouloir réinitialiser le compteur? Votre enregistrement de dhikr actuel sera supprimé.' : lang == 'es' ? '¿Está seguro de que desea reiniciar el contador? Se eliminará su registro de dhikr actual.' : lang == 'id' ? 'Apakah Anda yakin ingin mengatur ulang penghitung? Catatan zikir Anda saat ini akan dihapus.' : lang == 'ru' ? 'Вы уверены, что хотите сбросить счетчик? Ваша текущая запись зикра будет удалена.' : lang == 'it' ? 'Sei sicuro di voler azzerare il contatore? Il tuo record di dhikr attuale verrà eliminato.' : lang == 'ur' ? 'کیا آپ واقعی کاؤنٹر کو ری سیٹ کرنا چاہتے ہیں؟ آپ کا موجودہ ذکر کا ریکارڈ حذف ہو جائے گا۔' : 'Are you sure you want to reset the counter? Your current dhikr record will be deleted.';
    final cancel = lang == 'tr' ? 'Vazgeç' : lang == 'de' ? 'Abbrechen' : lang == 'fr' ? 'Annuler' : lang == 'es' ? 'Cancelar' : lang == 'id' ? 'Batal' : lang == 'ru' ? 'Отмена' : lang == 'it' ? 'Annulla' : lang == 'ur' ? 'منسوخ کریں' : 'Cancel';
    final confirm = lang == 'tr' ? 'Sıfırla' : lang == 'de' ? 'Zurücksetzen' : lang == 'fr' ? 'Réinitialiser' : lang == 'es' ? 'Reiniciar' : lang == 'id' ? 'Atur Ulang' : lang == 'ru' ? 'Сброс' : lang == 'it' ? 'Ripristina' : lang == 'ur' ? 'دوبارہ ترتیب دیں' : 'Reset';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.refresh, color: Colors.red),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        content: Text(body),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(cancel, style: const TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              setState(() => _counter = 0);
              Navigator.pop(context);
            },
            child: Text(confirm, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showCustomTargetDialog() {
    final lang = Provider.of<AppProvider>(context, listen: false).languageCode;
    final title = lang == 'tr' ? 'Özel Hedef Belirle' : lang == 'de' ? 'Benutzerdefiniertes Ziel' : lang == 'fr' ? 'Définir un objectif personnalisé' : lang == 'es' ? 'Establecer objetivo personalizado' : lang == 'id' ? 'Tetapkan Target' : lang == 'ru' ? 'Установить цель' : lang == 'it' ? 'Imposta obiettivo' : lang == 'ur' ? 'ہدف مقرر کریں' : 'Set Custom Target';
    final hint = lang == 'tr' ? 'Hedef zikir sayısını girin' : lang == 'de' ? 'Zielanzahl eingeben' : lang == 'fr' ? 'Entrez le nombre cible' : lang == 'es' ? 'Ingrese el número objetivo' : lang == 'id' ? 'Masukkan jumlah target' : lang == 'ru' ? 'Введите количество' : lang == 'it' ? 'Inserisci il numero' : lang == 'ur' ? 'ہدف کی تعداد درج کریں' : 'Enter target count';
    final suffix = lang == 'tr' ? 'Zikir' : lang == 'de' ? 'mal' : lang == 'fr' ? 'fois' : lang == 'es' ? 'veces' : lang == 'id' ? 'kali' : lang == 'ru' ? 'раз' : lang == 'it' ? 'volte' : lang == 'ur' ? 'مرتبہ' : 'times';
    final cancel = lang == 'tr' ? 'Vazgeç' : lang == 'de' ? 'Abbrechen' : lang == 'fr' ? 'Annuler' : lang == 'es' ? 'Cancelar' : lang == 'id' ? 'Batal' : lang == 'ru' ? 'Отмена' : lang == 'it' ? 'Annulla' : lang == 'ur' ? 'منسوخ کریں' : 'Cancel';
    final save = lang == 'tr' ? 'Kaydet' : lang == 'de' ? 'Speichern' : lang == 'fr' ? 'Enregistrer' : lang == 'es' ? 'Guardar' : lang == 'id' ? 'Simpan' : lang == 'ru' ? 'Сохранить' : lang == 'it' ? 'Salva' : lang == 'ur' ? 'محفوظ کریں' : 'Save';

    final textController = TextEditingController(text: _target > 0 ? _target.toString() : '');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.track_changes, color: AppColors.premiumGold),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
        content: TextField(
          controller: textController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            hintText: hint,
            suffixText: suffix,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.premiumGold),
            ),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(cancel, style: const TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              final val = int.tryParse(textController.text) ?? 33;
              if (val > 0) {
                setState(() {
                  _target = val;
                });
              }
              Navigator.pop(context);
            },
            child: Text(save, style: const TextStyle(color: AppColors.premiumGold, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showTargetReachedSnackbar() {
    final lang = Provider.of<AppProvider>(context, listen: false).languageCode;
    final zikirList = _getZikirList(lang);
    final zikirName = zikirList[_selectedZikirIndex]['name'];
    final msg = lang == 'tr'
        ? 'Maşallah! $zikirName zikri için $_target hedefinize ulaştınız!'
        : lang == 'de'
            ? 'Maschallah! Sie haben Ihr Ziel von $_target für $zikirName erreicht!'
            : lang == 'fr'
                ? 'Macha\'Allah! Vous avez atteint votre objectif de $_target pour $zikirName!'
                : lang == 'es'
                    ? '¡Mashallah! ¡Has alcanzado tu objetivo de $_target para $zikirName!'
                    : lang == 'id'
                        ? 'Masya Allah! Anda mencapai target $_target untuk $zikirName!'
                        : lang == 'ru'
                            ? 'МашаАллах! Вы достигли своей цели $_target для $zikirName!'
                            : lang == 'it'
                                ? 'Masha\'Allah! Hai raggiunto il tuo obiettivo di $_target per $zikirName!'
                                : lang == 'ur'
                                    ? 'ماشاءاللہ! آپ نے $zikirName کے لیے $_target کا اپنا ہدف حاصل کر لیا!'
                                    : 'Masha\'Allah! You reached your target of $_target for $zikirName!';
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.star, color: AppColors.premiumGold),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                msg,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.emeraldGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<AppProvider>(context).languageCode;
    final zikirList = _getZikirList(lang);
    final currentZikir = zikirList[_selectedZikirIndex];
    final bool hasArabic = currentZikir['arabic'].toString().isNotEmpty;

    final appBarTitle = lang == 'tr' ? 'Zikirmatik & Tesbihat' : lang == 'de' ? 'Tasbih-Zähler' : lang == 'fr' ? 'Tasbih & Dhikr' : lang == 'es' ? 'Contador de Tasbih' : lang == 'id' ? 'Tasbih & Zikir' : lang == 'ru' ? 'Тасбих и Зикр' : lang == 'it' ? 'Tasbih e Dhikr' : lang == 'ur' ? 'تسبیح اور ذکر' : 'Tasbih & Dhikr';
    final soundTooltip = lang == 'tr' ? 'Ses Geribildirimi' : lang == 'de' ? 'Ton-Feedback' : lang == 'fr' ? 'Retour sonore' : lang == 'es' ? 'Respuesta de sonido' : lang == 'id' ? 'Umpan Balik Suara' : lang == 'ru' ? 'Звук' : lang == 'it' ? 'Feedback sonoro' : lang == 'ur' ? 'آواز' : 'Sound Feedback';
    final vibTooltip = lang == 'tr' ? 'Titreşim Geribildirimi' : lang == 'de' ? 'Vibrations-Feedback' : lang == 'fr' ? 'Retour vibratoire' : lang == 'es' ? 'Respuesta de vibración' : lang == 'id' ? 'Umpan Balik Getaran' : lang == 'ru' ? 'Вибрация' : lang == 'it' ? 'Feedback vibrazione' : lang == 'ur' ? 'وائبریشن' : 'Vibration Feedback';
    final targetLabel = lang == 'tr' ? 'Hedef Zikir Limiti' : lang == 'de' ? 'Ziel-Zähllimit' : lang == 'fr' ? 'Limite d\'objectif' : lang == 'es' ? 'Límite de objetivo' : lang == 'id' ? 'Batas Target' : lang == 'ru' ? 'Лимит цели' : lang == 'it' ? 'Limite obiettivo' : lang == 'ur' ? 'ہدف کی حد' : 'Target Count Limit';
    final freeLabel = lang == 'tr' ? 'Serbest' : lang == 'de' ? 'Frei' : lang == 'fr' ? 'Libre' : lang == 'es' ? 'Libre' : lang == 'id' ? 'Bebas' : lang == 'ru' ? 'Свободно' : lang == 'it' ? 'Libero' : lang == 'ur' ? 'مفت' : 'Free';
    final customLabel = lang == 'tr' ? 'Özel' : lang == 'de' ? 'Angepasst' : lang == 'fr' ? 'Personnalisé' : lang == 'es' ? 'Personalizado' : lang == 'id' ? 'Kustom' : lang == 'ru' ? 'Свой' : lang == 'it' ? 'Pers.' : lang == 'ur' ? 'اپنی مرضی کے' : 'Custom';
    final tapHint = lang == 'tr' ? 'Tıklamak için halkaya basın' : lang == 'de' ? 'Ring antippen zum Zählen' : lang == 'fr' ? 'Appuyez sur le cercle pour compter' : lang == 'es' ? 'Toca el círculo para contar' : lang == 'id' ? 'Ketuk cincin untuk menghitung' : lang == 'ru' ? 'Нажмите на кольцо, чтобы считать' : lang == 'it' ? 'Tocca l\'anello per contare' : lang == 'ur' ? 'گننے کے لیے انگوٹھی پر ٹیپ کریں' : 'Tap the ring to count';
    final resetLabel = lang == 'tr' ? 'Sıfırla' : lang == 'de' ? 'Zurücksetzen' : lang == 'fr' ? 'Réinitialiser' : lang == 'es' ? 'Reiniciar' : lang == 'id' ? 'Atur Ulang' : lang == 'ru' ? 'Сброс' : lang == 'it' ? 'Ripristina' : lang == 'ur' ? 'دوبارہ ترتیب دیں' : 'Reset';
    final freeMode = lang == 'tr' ? 'Serbest' : lang == 'de' ? 'Frei' : lang == 'fr' ? 'Libre' : lang == 'es' ? 'Libre' : lang == 'id' ? 'Bebas' : lang == 'ru' ? 'Свободно' : lang == 'it' ? 'Libero' : lang == 'ur' ? 'مفت' : 'Free';

    // Calculate progress ratio
    double progress = _target > 0 ? (_counter % _target) / _target : 0.0;
    if (_target > 0 && _counter > 0 && _counter % _target == 0) {
      progress = 1.0;
    }

    final screenHeight = MediaQuery.of(context).size.height;
    final outerRingSize = screenHeight < 680 ? 200.0 : 254.0;
    final progressRingSize = screenHeight < 680 ? 188.0 : 240.0;
    final innerCardSize = screenHeight < 680 ? 165.0 : 212.0;
    final counterFontSize = screenHeight < 680 ? 42.0 : 54.0;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0F172A) : const Color(0xFFFAF6F0),
      appBar: AppBar(
        title: Text(appBarTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : AppColors.darkEmerald,
        actions: [
          // Sound toggle button
          IconButton(
            icon: Icon(
              _soundEnabled ? Icons.volume_up_rounded : Icons.volume_off_rounded,
              color: _soundEnabled ? AppColors.premiumGold : Colors.grey,
            ),
            tooltip: soundTooltip,
            onPressed: () {
              setState(() {
                _soundEnabled = !_soundEnabled;
              });
            },
          ),
          // Vibration toggle button
          IconButton(
            icon: Icon(
              _vibrationEnabled ? Icons.vibration_rounded : Icons.portable_wifi_off_rounded,
              color: _vibrationEnabled ? AppColors.premiumGold : Colors.grey,
            ),
            tooltip: vibTooltip,
            onPressed: () {
              setState(() {
                _vibrationEnabled = !_vibrationEnabled;
              });
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Zikir Selector Card
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isDark ? AppColors.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark ? Colors.white10 : Colors.grey.shade200,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(isDark ? 0.2 : 0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: _selectedZikirIndex,
                dropdownColor: isDark ? const Color(0xFF1E293B) : Colors.white,
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.premiumGold, size: 28),
                onChanged: (int? newIndex) {
                  if (newIndex != null) {
                    setState(() {
                      _selectedZikirIndex = newIndex;
                      _counter = 0;
                      // Auto-set target based on selected zikir default target
                      _target = zikirList[newIndex]['defaultTarget'];
                    });
                  }
                },
                items: List.generate(zikirList.length, (index) {
                  return DropdownMenuItem<int>(
                    value: index,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: AppColors.premiumGold.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.bookmark_added_rounded, size: 16, color: AppColors.premiumGold),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            zikirList[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: isDark ? Colors.white : AppColors.darkEmerald,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),

          // Display selected zikir contents
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E293B).withOpacity(0.5) : const Color(0xFFFFFBEA).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: isDark ? Colors.white.withOpacity(0.05) : AppColors.premiumGold.withOpacity(0.15),
                  ),
                ),
                alignment: Alignment.center,
                child: Scrollbar(
                  radius: const Radius.circular(8),
                  thickness: 4,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (hasArabic) ...[
                          Text(
                            currentZikir['arabic'],
                            style: const TextStyle(
                              fontFamily: 'Regular',
                              fontSize: 28, // Slightly reduced to fit better
                              fontWeight: FontWeight.bold,
                              color: AppColors.premiumGold,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                        ],
                        Text(
                          currentZikir['meaning'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white70 : Colors.grey.shade800,
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Custom Target Selector Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, bottom: 6.0),
                  child: Text(
                    targetLabel,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Predefined Targets (33, 99, Free, Custom)
                    _buildTargetChip(33, '33', isDark),
                    _buildTargetChip(99, '99', isDark),
                    _buildTargetChip(0, freeLabel, isDark),
                    
                    // Custom Target Input Button
                    GestureDetector(
                      onTap: _showCustomTargetDialog,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: (_target != 33 && _target != 99 && _target != 0)
                              ? AppColors.premiumGold.withOpacity(0.15)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: (_target != 33 && _target != 99 && _target != 0)
                                ? AppColors.premiumGold
                                : (isDark ? Colors.white10 : Colors.black12),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit_rounded,
                              size: 14,
                              color: (_target != 33 && _target != 99 && _target != 0)
                                  ? AppColors.premiumGold
                                  : (isDark ? Colors.white60 : Colors.black54),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              (_target != 33 && _target != 99 && _target != 0) ? '$_target' : customLabel,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: (_target != 33 && _target != 99 && _target != 0)
                                    ? AppColors.premiumGold
                                    : (isDark ? Colors.white70 : Colors.black87),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight < 680 ? 8 : 16),

          // Central Counter button & Circle Progress
          GestureDetector(
            onTap: _incrementCounter,
            child: AnimatedScale(
              scale: _scale,
              duration: const Duration(milliseconds: 60),
              curve: Curves.easeOut,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Outer glowing rings & shadow
                  Container(
                    width: outerRingSize,
                    height: outerRingSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.premiumGold.withOpacity(isDark ? 0.08 : 0.04),
                          blurRadius: 24,
                          spreadRadius: 4,
                        ),
                      ],
                    ),
                  ),
                  // Outer progress ring
                  SizedBox(
                    width: progressRingSize,
                    height: progressRingSize,
                    child: CircularProgressIndicator(
                      value: _target > 0 ? progress : 0.0,
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                      backgroundColor: isDark ? Colors.white.withOpacity(0.04) : Colors.black.withOpacity(0.03),
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.premiumGold),
                    ),
                  ),
                  // Inner physical button card
                  Container(
                    width: innerCardSize,
                    height: innerCardSize,
                    decoration: BoxDecoration(
                      color: isDark ? const Color(0xFF1E293B) : Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isDark ? 0.5 : 0.08),
                          blurRadius: 18,
                          offset: const Offset(0, 10),
                        ),
                        // Inner inset lighting emulation
                        BoxShadow(
                          color: Colors.white.withOpacity(isDark ? 0.05 : 0.6),
                          blurRadius: 2,
                          offset: const Offset(0, -2),
                        ),
                      ],
                      border: Border.all(
                        color: isDark ? Colors.white.withOpacity(0.05) : Colors.grey.shade100,
                        width: 1.5,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_counter',
                          style: TextStyle(
                            fontSize: counterFontSize,
                            fontWeight: FontWeight.w800,
                            color: isDark ? Colors.white : AppColors.darkEmerald,
                            letterSpacing: 1.1,
                          ),
                        ),
                        if (_target > 0) ...[
                          const SizedBox(height: 2),
                          Text(
                            '/ $_target',
                            style: TextStyle(
                              fontSize: 14,
                              color: isDark ? Colors.white54 : Colors.grey.shade600,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ] else ...[
                          const SizedBox(height: 2),
                          Text(
                            freeMode,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.premiumGold,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: screenHeight < 680 ? 12 : 20),

          // Bottom control row
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: screenHeight < 680 ? 12 : 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Reset Button
                OutlinedButton.icon(
                  onPressed: _resetCounter,
                  icon: const Icon(Icons.refresh_rounded, size: 18),
                  label: Text(resetLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: BorderSide(color: Colors.redAccent.withOpacity(0.4), width: 1.5),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: screenHeight < 680 ? 8 : 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                SizedBox(height: screenHeight < 680 ? 10 : 16),
                // Tap Anywhere Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.touch_app_rounded, size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        tapHint,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: isDark ? Colors.white38 : Colors.black38,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // HEDEF SEÇİM BUTONU YARDIMCI METODU
  Widget _buildTargetChip(int targetValue, String label, bool isDark) {
    final isSelected = _target == targetValue;
    return GestureDetector(
      onTap: () {
        setState(() {
          _target = targetValue;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.premiumGold.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.premiumGold : (isDark ? Colors.white10 : Colors.black12),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppColors.premiumGold : (isDark ? Colors.white70 : Colors.black87),
          ),
        ),
      ),
    );
  }
}
