import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';

class NamazMeaningScreen extends StatefulWidget {
  const NamazMeaningScreen({super.key});

  @override
  State<NamazMeaningScreen> createState() => _NamazMeaningScreenState();
}

class _NamazMeaningScreenState extends State<NamazMeaningScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<_MeaningSlide> _getSlides(String lang) {
    if (lang == 'en') {
      return const [
        _MeaningSlide(
          title: 'Importance of Prayer',
          body: 'Prayer is one of the most important acts of worship. Performed five times a day, it keeps us away from evil and gives spiritual peace.',
          quote: '"Indeed, prayer has been decreed upon the believers a decree of specified times." (Surah An-Nisa, 4:103)',
        ),
        _MeaningSlide(
          title: 'Pillar of Religion',
          body: 'After the declaration of faith, prayer is the most sacred pillar of Islam. It is the most special bond we establish with our Creator and the main pillar that keeps our religion standing.',
          quote: '"Prayer is the pillar of religion. Whoever establishes it has established his religion." (Hadith)',
        ),
        _MeaningSlide(
          title: 'Protects from Evil',
          body: 'A sincere prayer performed regularly cleanses our hearts, beautifies our souls, and protects us from all kinds of haram, bad habits, and ugly deeds.',
          quote: '"Indeed, prayer prohibits immorality and wrongdoing." (Surah Al-Ankabut, 29:45)',
        ),
      ];
    } else if (lang == 'de') {
      return const [
        _MeaningSlide(
          title: 'Bedeutung des Gebets',
          body: 'Das Gebet ist eine der wichtigsten Gottesdiensthandlungen. Es wird fünfmal am Tag verrichtet, hält uns von Bösem fern und schenkt spirituellen Frieden.',
          quote: '"Wahrlich, das Gebet ist den Gläubigen zu bestimmten Zeiten vorgeschrieben." (Sure An-Nisa, 4:103)',
        ),
        _MeaningSlide(
          title: 'Säule der Religion',
          body: 'Nach dem Glaubensbekenntnis ist das Gebet die heiligste Säule des Islam. Es ist die wichtigste Verbindung zu unserem Schöpfer und die Säule, die unsere Religion stützt.',
          quote: '"Das Gebet ist die Säule der Religion. Wer es verrichtet, erhält seine Religion aufrecht." (Hadith)',
        ),
        _MeaningSlide(
          title: 'Schützt vor Bösem',
          body: 'Ein aufrichtiges, regelmäßig verrichtetes Gebet reinigt unsere Herzen, verschönert unsere Seelen und schützt uns vor allen schlechten Gewohnheiten und Sünden.',
          quote: '"Gewiss, das Gebet hält von schändlichen und abscheulichen Taten ab." (Sure Al-Ankabut, 29:45)',
        ),
      ];
    } else if (lang == 'fr') {
      return const [
        _MeaningSlide(
          title: 'L\'importance de la Prière',
          body: 'La prière est l\'un des actes d\'adoration les plus importants. Accomplie cinq fois par jour, elle nous éloigne du mal et procure la paix spirituelle.',
          quote: '"La prière est une obligation pour les croyants à des heures déterminées." (Sourate An-Nisa, 4:103)',
        ),
        _MeaningSlide(
          title: 'Pilier de la Religion',
          body: 'Après l\'attestation de foi, la prière est le pilier le plus sacré de l\'Islam. C\'est le lien le plus privilégié que nous établissons avec notre Créateur.',
          quote: '"La prière est le pilier de la religion. Quiconque l\'accomplit maintient sa religion." (Hadith)',
        ),
        _MeaningSlide(
          title: 'Protège du Mal',
          body: 'Une prière sincère et régulière purifie nos cœurs, embellit nos âmes et nous protège des mauvaises habitudes et des péchés.',
          quote: '"En vérité, la prière préserve de la turpitude et du blâmable." (Sourate Al-Ankabut, 29:45)',
        ),
      ];
    } else if (lang == 'es') {
      return const [
        _MeaningSlide(
          title: 'Importancia de la Oración',
          body: 'La oración es uno de los actos de adoración más importantes. Realizada cinco veces al día, nos aleja del mal y nos da paz espiritual.',
          quote: '"Ciertamente, la oración ha sido prescrita a los creyentes en tiempos establecidos." (Sura An-Nisa, 4:103)',
        ),
        _MeaningSlide(
          title: 'Pilar de la Religión',
          body: 'Después de la declaración de fe, la oración es el pilar más sagrado del Islam. Es el vínculo más especial que establecemos con nuestro Creador.',
          quote: '"La oración es el pilar de la religión. Quien la establece, establece su religión." (Hadith)',
        ),
        _MeaningSlide(
          title: 'Protege del Mal',
          body: 'Una oración sincera y regular purifica nuestros corazones, embellece nuestras almas y nos protege de los malos hábitos y los pecados.',
          quote: '"Ciertamente, la oración preserva de la inmoralidad y del mal." (Sura Al-Ankabut, 29:45)',
        ),
      ];
    } else if (lang == 'id') {
      return const [
        _MeaningSlide(
          title: 'Pentingnya Shalat',
          body: 'Shalat adalah salah satu ibadah yang paling penting. Dilakukan lima waktu sehari, shalat menjauhkan kita dari kejahatan dan memberikan kedamaian spiritual.',
          quote: '"Sesungguhnya shalat itu adalah fardhu yang ditentukan waktunya atas orang-orang yang beriman." (Surah An-Nisa, 4:103)',
        ),
        _MeaningSlide(
          title: 'Tiang Agama',
          body: 'Setelah syahadat, shalat adalah tiang paling suci dalam Islam. Ini adalah ikatan paling istimewa yang kita jalin dengan Pencipta kita dan tiang utama yang membuat agama kita tetap tegak.',
          quote: '"Shalat adalah tiang agama. Barangsiapa mendirikannya, maka ia telah mendirikan agamanya." (Hadis)',
        ),
        _MeaningSlide(
          title: 'Melindungi dari Kejahatan',
          body: 'Shalat yang ikhlas dan dilakukan secara rutin membersihkan hati kita, memperindah jiwa kita, dan melindungi kita dari segala macam kebiasaan buruk dan perbuatan keji.',
          quote: '"Sesungguhnya shalat itu mencegah dari (perbuatan-perbuatan) keji dan mungkar." (Surah Al-Ankabut, 29:45)',
        ),
      ];
    } else if (lang == 'ru') {
      return const [
        _MeaningSlide(
          title: 'Важность молитвы',
          body: 'Молитва является одним из самых важных актов поклонения. Совершаемая пять раз в день, она отдаляет нас от зла и дает духовный покой.',
          quote: '"Воистину, молитва предписана верующим в определенное время." (Сура Ан-Ниса, 4:103)',
        ),
        _MeaningSlide(
          title: 'Опора религии',
          body: 'После свидетельства веры, молитва является самым священным столпом ислама. Это самая особенная связь, которую мы устанавливаем с нашим Творцом.',
          quote: '"Молитва — опора религии. Кто совершает ее, тот поддерживает свою религию." (Хадис)',
        ),
        _MeaningSlide(
          title: 'Защищает от зла',
          body: 'Искренняя молитва, совершаемая регулярно, очищает наши сердца, украшает наши души и защищает нас от вредных привычек и грехов.',
          quote: '"Воистину, молитва оберегает от мерзости и предосудительного." (Сура Аль-Анкабут, 29:45)',
        ),
      ];
    } else if (lang == 'it') {
      return const [
        _MeaningSlide(
          title: 'Importanza della Preghiera',
          body: 'La preghiera è uno degli atti di culto più importanti. Eseguita cinque volte al giorno, ci tiene lontani dal male e dona pace spirituale.',
          quote: '"In verità, la preghiera è stata prescritta ai credenti in tempi determinati." (Sura An-Nisa, 4:103)',
        ),
        _MeaningSlide(
          title: 'Pilastro della Religione',
          body: 'Dopo la dichiarazione di fede, la preghiera è il pilastro più sacro dell\'Islam. È il legame più speciale che stabiliamo con il nostro Creatore.',
          quote: '"La preghiera è il pilastro della religione. Chiunque la stabilisce ha stabilito la sua religione." (Hadith)',
        ),
        _MeaningSlide(
          title: 'Protegge dal Male',
          body: 'Una preghiera sincera eseguita regolarmente purifica i nostri cuori, abbellisce le nostre anime e ci protegge dalle cattive abitudini e dai peccati.',
          quote: '"In verità, la preghiera allontana dall\'immoralità e dal male." (Sura Al-Ankabut, 29:45)',
        ),
      ];
    } else if (lang == 'ur') {
      return const [
        _MeaningSlide(
          title: 'نماز کی اہمیت',
          body: 'نماز سب سے اہم عبادات میں سے ایک ہے۔ دن میں پانچ بار ادا کی جانے والی یہ عبادت ہمیں برائیوں سے دور رکھتی ہے اور روحانی سکون دیتی ہے۔',
          quote: '"بے شک نماز مومنوں پر مقررہ وقتوں میں فرض کی گئی ہے۔" (سورۃ النساء، 4:103)',
        ),
        _MeaningSlide(
          title: 'دین کا ستون',
          body: 'کلمہ شہادت کے بعد نماز اسلام کا سب سے مقدس ستون ہے۔ یہ وہ سب سے خاص رشتہ ہے جو ہم اپنے خالق کے ساتھ قائم کرتے ہیں۔',
          quote: '"نماز دین کا ستون ہے۔ جس نے اسے قائم کیا اس نے اپنے دین کو قائم کیا۔" (حدیث)',
        ),
        _MeaningSlide(
          title: 'برائیوں سے بچاتی ہے',
          body: 'باقاعدگی سے پڑھی جانے والی سچی نماز ہمارے دلوں کو پاک کرتی ہے، ہماری روحوں کو خوبصورت بناتی ہے اور ہمیں تمام بری عادات اور گناہوں سے بچاتی ہے۔',
          quote: '"بے شک نماز بے حیائی اور برے کاموں سے روکتی ہے۔" (سورۃ العنکبوت، 29:45)',
        ),
      ];
    }
    // End of ru, ur, id, it translations
    // Turkish
    return const [
      _MeaningSlide(
        title: 'Namazın Önemi',
        body: 'Namaz, Allah\'a kulluğumuzun en önemli ibadetlerinden biridir. Günde beş vakit kılınan namaz, bizi kötülüklerden uzak tutar ve manevi huzur verir.',
        quote: '"Şüphesiz ki namaz, müminler üzerine vakitleri belli olmak şartıyla farz kılınmıştır." (Nisâ Suresi, 103. Ayet)',
      ),
      _MeaningSlide(
        title: 'Dinin Direğidir',
        body: 'Namaz, kelime-i şehadetten sonra İslam\'ın en mukaddes rüknüdür. Yaratıcımız ile kurduğumuz en özel bağdır ve dinimizi ayakta tutan temel sütundur.',
        quote: '"Namaz dinin direğidir. Kim onu ikame ederse dinini ayakta tutmuş olur." (Hadis-i Şerif)',
      ),
      _MeaningSlide(
        title: 'Kötülüklerden Korur',
        body: 'Düzenli kılınan samimi bir namaz, kalbimizi temizler, ruhumuzu güzelleştirir ve bizi her türlü haramdan, kötü alışkanlıktan ve çirkin işlerden muhafaza eder.',
        quote: '"Şüphesiz namaz, insanı hayasızlıktan ve kötülükten alıkoyar." (Ankebût Suresi, 45. Ayet)',
      ),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<AppProvider>(context).languageCode;
    final slides = _getSlides(lang);
    final String appBarTitle = lang == 'tr' ? 'Namazın Anlamı' : lang == 'en' ? 'Meaning of Prayer' : lang == 'de' ? 'Bedeutung des Gebets' : lang == 'fr' ? 'Sens de la prière' : lang == 'es' ? 'Significado de la Oración' : lang == 'id' ? 'Makna Shalat' : lang == 'ru' ? 'Значение молитвы' : lang == 'it' ? 'Significato della Preghiera' : lang == 'ur' ? 'نماز کی اہمیت' : 'Namazın Anlamı';

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: slides.length,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  final slide = slides[index];
                  return SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Illustration card
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isDark ? AppColors.darkSurface : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.champagneGold.withOpacity(0.15),
                            ),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            'assets/images/namaz_meaning.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Title
                        Text(
                          slide.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Body text
                        Text(
                          slide.body,
                          style: TextStyle(
                            fontSize: 14.5,
                            color: isDark ? Colors.white70 : Colors.black87,
                            height: 1.45,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Quote Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.black26 : const Color(0xFFF2ECE0),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppColors.premiumGold.withOpacity(0.2),
                            ),
                          ),
                          child: Text(
                            slide.quote,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13.5,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                              color: isDark ? Colors.white70 : AppColors.darkEmerald,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Pagination Controls at the bottom
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow button
                  IconButton(
                    onPressed: _currentPage > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    style: IconButton.styleFrom(
                      backgroundColor: _currentPage > 0
                          ? AppColors.emeraldGreen
                          : AppColors.emeraldGreen.withOpacity(0.1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                    ),
                    icon: const Icon(Icons.arrow_back, size: 20),
                  ),

                  // Dots indicator
                  Row(
                    children: List.generate(
                      slides.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        width: _currentPage == index ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? AppColors.premiumGold
                              : (isDark ? Colors.white24 : Colors.black12),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),

                  // Forward arrow button
                  IconButton(
                    onPressed: _currentPage < slides.length - 1
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    style: IconButton.styleFrom(
                      backgroundColor: _currentPage < slides.length - 1
                          ? AppColors.emeraldGreen
                          : AppColors.emeraldGreen.withOpacity(0.1),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                    ),
                    icon: const Icon(Icons.arrow_forward, size: 20),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeaningSlide {
  final String title;
  final String body;
  final String quote;

  const _MeaningSlide({
    required this.title,
    required this.body,
    required this.quote,
  });
}
