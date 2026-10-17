import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';

class ProgressTab extends StatefulWidget {
  const ProgressTab({super.key});

  @override
  State<ProgressTab> createState() => _ProgressTabState();
}

class _ProgressTabState extends State<ProgressTab> {
    Map<String, List<String>> _getCategories(String lang) {
    if (lang == 'en') {
      return {
        'How to Pray?': ['Fajr Prayer', 'Dhuhr Prayer', 'Asr Prayer', 'Maghrib Prayer', 'Isha Prayer'],
        'How to Perform Wudu?': ['Intention & Washing Hands', 'Rinsing Mouth & Nose', 'Washing Face', 'Washing Arms', 'Wiping Head & Neck', 'Washing Feet'],
        'Prayer Surahs': ['Al-Fatiha', 'Al-Fil', 'Quraysh', 'Al-Ma\'un', 'Al-Kawthar', 'Al-Kafirun', 'An-Nasr', 'Al-Masad', 'Al-Ikhlas', 'Al-Falaq', 'An-Nas'],
        'Supplications': ['Subhaneke', 'Ettehiyyatu', 'Allahumma Salli', 'Allahumma Barik', 'Rabbana', 'Qunut'],
        'Meaning of Prayer': ['What is Prayer?', 'Its Place in Islam', 'Spiritual Benefits'],
      };
    }
    if (lang == 'de') {
      return {
        'Wie betet man?': ['Fadschr-Gebet', 'Zuhr-Gebet', 'Asr-Gebet', 'Maghrib-Gebet', 'Ischa-Gebet'],
        'Wie macht man Wudu?': ['Absicht & Händewaschen', 'Mund & Nase spülen', 'Gesicht waschen', 'Arme waschen', 'Kopf & Hals streichen', 'Füße waschen'],
        'Gebetssuren': ['Al-Fatiha', 'Al-Fil', 'Quraisch', 'Al-Ma\'un', 'Al-Kauthar', 'Al-Kafirun', 'An-Nasr', 'Al-Masad', 'Al-Ichlas', 'Al-Falaq', 'An-Nas'],
        'Bittgebete': ['Subhaneke', 'Ettehiyyatu', 'Allahumma Salli', 'Allahumma Barik', 'Rabbana', 'Qunut'],
        'Bedeutung des Gebets': ['Was ist das Gebet?', 'Sein Platz im Islam', 'Spirituelle Vorteile'],
      };
    }
    if (lang == 'fr') {
      return {
        'Comment faire la prière?': ['Prière de l\'Aube', 'Prière du Midi', 'Prière de l\'Après-midi', 'Prière du Soir', 'Prière de la Nuit'],
        'Comment faire les ablutions?': ['Intention & Laver les mains', 'Rincer la bouche & le nez', 'Laver le visage', 'Laver les bras', 'Essuyer la tête & le cou', 'Laver les pieds'],
        'Sourates de la Prière': ['Al-Fatiha', 'Al-Fil', 'Quraysh', 'Al-Ma\'un', 'Al-Kawthar', 'Al-Kafirun', 'An-Nasr', 'Al-Masad', 'Al-Ikhlas', 'Al-Falaq', 'An-Nas'],
        'Invocations': ['Subhaneke', 'Ettehiyyatu', 'Allahumma Salli', 'Allahumma Barik', 'Rabbana', 'Qunut'],
        'Sens de la Prière': ['Qu\'est-ce que la Prière?', 'Sa place dans l\'Islam', 'Avantages Spirituels'],
      };
    }
    if (lang == 'es') {
      return {
        '¿Cómo realizar la oración?': ['Oración del Alba', 'Oración del Mediodía', 'Oración de la Tarde', 'Oración del Ocaso', 'Oración de la Noche'],
        '¿Cómo hacer la ablución?': ['Intención & Lavar manos', 'Enjuagar boca & nariz', 'Lavar la cara', 'Lavar los brazos', 'Limpiar cabeza & cuello', 'Lavar los pies'],
        'Suras de Oración': ['Al-Fatiha', 'Al-Fil', 'Quraysh', 'Al-Ma\'un', 'Al-Kawthar', 'Al-Kafirun', 'An-Nasr', 'Al-Masad', 'Al-Ikhlas', 'Al-Falaq', 'An-Nas'],
        'Súplicas': ['Subhaneke', 'Ettehiyyatu', 'Allahumma Salli', 'Allahumma Barik', 'Rabbana', 'Qunut'],
        'Significado de la Oración': ['¿Qué es la oración?', 'Su lugar en el Islam', 'Beneficios espirituales'],
      };
    }
    if (lang == 'id') {
      return {
        'Bagaimana Cara Sholat?': ['Sholat Subuh', 'Sholat Dzuhur', 'Sholat Ashar', 'Sholat Maghrib', 'Sholat Isya'],
        'Bagaimana Cara Wudhu?': ['Niat & Mencuci Tangan', 'Kumur & Mencuci Hidung', 'Mencuci Wajah', 'Mencuci Lengan', 'Mengusap Kepala & Leher', 'Mencuci Kaki'],
        'Surat-surat Sholat': ['Al-Fatihah', 'Al-Fil', 'Quraisy', 'Al-Ma\'un', 'Al-Kautsar', 'Al-Kafirun', 'An-Nashr', 'Al-Lahab', 'Al-Ikhlas', 'Al-Falaq', 'An-Nas'],
        'Doa-doa': ['Subhanaka', 'Tahiyat', 'Allahumma Shalli', 'Allahumma Barik', 'Rabbana', 'Qunut'],
        'Makna Sholat': ['Apa itu Sholat?', 'Kedudukannya dalam Islam', 'Manfaat Spiritual'],
      };
    }
    if (lang == 'it') {
      return {
        'Come fare la preghiera?': ['Preghiera dell\'Alba', 'Preghiera di Mezzogiorno', 'Preghiera del Pomeriggio', 'Preghiera del Tramonto', 'Preghiera della Notte'],
        'Come fare l\'abluzione?': ['Intenzione & Lavare le mani', 'Sciacquare bocca & naso', 'Lavare il viso', 'Lavare le braccia', 'Passare acqua su testa & collo', 'Lavare i piedi'],
        'Sure della Preghiera': ['Al-Fatiha', 'Al-Fil', 'Quraysh', 'Al-Ma\'un', 'Al-Kawthar', 'Al-Kafirun', 'An-Nasr', 'Al-Masad', 'Al-Ikhlas', 'Al-Falaq', 'An-Nas'],
        'Suppliche': ['Subhaneke', 'Ettehiyyatu', 'Allahumma Salli', 'Allahumma Barik', 'Rabbana', 'Qunut'],
        'Significato della Preghiera': ['Cos\'è la Preghiera?', 'Il suo posto nell\'Islam', 'Benefici Spirituali'],
      };
    }
    if (lang == 'ru') {
      return {
        'Как совершать намаз?': ['Утренний намаз', 'Полуденный намаз', 'Послеполуденный намаз', 'Вечерний намаз', 'Ночной намаз'],
        'Как совершать омовение?': ['Намерение и мытье рук', 'Полоскание рта и носа', 'Мытье лица', 'Мытье рук', 'Протирание головы и шеи', 'Мытье ног'],
        'Суры': ['Аль-Фатиха', 'Аль-Филь', 'Курайш', 'Аль-Маун', 'Аль-Каусар', 'Аль-Кафирун', 'Ан-Наср', 'Аль-Масад', 'Аль-Ихляс', 'Аль-Фаляк', 'Ан-Нас'],
        'Дуа': ['Субханака', 'Ат-Тахият', 'Аллахумма салли', 'Аллахумма барик', 'Раббана', 'Кунут'],
        'Значение намаза': ['Что такое намаз?', 'Его место в исламе', 'Духовная польза'],
      };
    }
    if (lang == 'ur') {
      return {
        'نماز کیسے پڑھیں؟': ['نماز فجر', 'نماز ظہر', 'نماز عصر', 'نماز مغرب', 'نماز عشاء'],
        'وضو کیسے کریں؟': ['نیت اور ہاتھ دھونا', 'کلی اور ناک میں پانی', 'چہرہ دھونا', 'بازو دھونا', 'سر اور گردن کا مسح', 'پاؤں دھونا'],
        'نماز کی سورتیں': ['سورۃ الفاتحہ', 'سورۃ الفیل', 'سورۃ قریش', 'سورۃ الماعون', 'سورۃ الکوثر', 'سورۃ الکافرون', 'سورۃ النصر', 'سورۃ المسد', 'سورۃ الاخلاص', 'سورۃ الفلق', 'سورۃ الناس'],
        'دعائیں': ['سبحانک', 'التحیات', 'درود ابراہیمی 1', 'درود ابراہیمی 2', 'ربنا آتنا', 'دعائے قنوت'],
        'نماز کی اہمیت': ['نماز کیا ہے؟', 'اسلام میں مقام', 'روحانی فوائد'],
      };
    }
    // Fallback to Turkish ('tr')
    return {
      'Namaz Nasıl Kılınır?': [
        'Sabah Namazı',
        'Öğle Namazı',
        'İkindi Namazı',
        'Akşam Namazı',
        'Yatsı Namazı',
      ],
      'Abdest Nasıl Alınır?': [
        'Niyet & Elleri Yıkama',
        'Ağıza & Burna Su Verme',
        'Yüzü Yıkama',
        'Kolları Yıkama',
        'Başı & Boynu Mesh Etme',
        'Ayakları Yıkama',
      ],
      'Namaz Sureleri': [
        'Fatiha Suresi',
        'Fil Suresi',
        'Kureyş Suresi',
        'Maun Suresi',
        'Kevser Suresi',
        'Kafirun Suresi',
        'Nasr Suresi',
        'Tebbet Suresi',
        'İhlas Suresi',
        'Felak Suresi',
        'Nas Suresi',
      ],
      'Dualar': [
        'Sübhaneke Duası',
        'Ettehiyyâtü Duası',
        'Allahümme Salli Duası',
        'Allahümme Barik Duası',
        'Rabbena Duaları',
        'Kunut Duaları',
      ],
      'Namazın Anlamı': [
        'Namaz Nedir?',
        'İslam\'daki Yeri',
        'Manevi Faydaları',
      ],
    };
  }

  final Map<String, bool> _completedItems = {};
  bool _isLoading = true;
  String? _expandedCategory;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final allLanguages = ['tr', 'en', 'de', 'fr', 'es', 'id', 'ru', 'it', 'ur'];
      for (final lang in allLanguages) {
        _getCategories(lang).forEach((category, items) {
          for (final item in items) {
            _completedItems[item] = prefs.getBool('progress_item_$item') ?? false;
          }
        });
      }
      setState(() => _isLoading = false);
    } catch (e) {
      debugPrint('Error loading progress: $e');
      setState(() => _isLoading = false);
    }
  }

  Future<void> _toggleItem(String name) async {
    final current = _completedItems[name] ?? false;
    final next = !current;
    setState(() {
      _completedItems[name] = next;
    });
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('progress_item_$name', next);
    } catch (e) {
      debugPrint('Error saving progress: $e');
    }
  }

  int _getCategoryCompletedCount(String category, Map<String, List<String>> categories) {
    final items = categories[category] ?? [];
    return items.where((item) => _completedItems[item] == true).length;
  }

  double _getCategoryProgress(String category, Map<String, List<String>> categories) {
    final items = categories[category] ?? [];
    if (items.isEmpty) return 0.0;
    return _getCategoryCompletedCount(category, categories) / items.length;
  }

  double _getTotalProgress(Map<String, List<String>> categories) {
    int totalItems = 0;
    int completedItems = 0;
    categories.forEach((category, items) {
      totalItems += items.length;
      completedItems += items.where((item) => _completedItems[item] == true).length;
    });
    if (totalItems == 0) return 0.0;
    return completedItems / totalItems;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final lang = provider.languageCode;
    final _categories = _getCategories(lang);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_isLoading) {
      return const Center(child: CircularProgressIndicator(color: AppColors.premiumGold));
    }

    final double totalProgress = _getTotalProgress(_categories);
    final int percent = (totalProgress * 100).toInt();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Total Progress Card with Trophy
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? Colors.white10 : Colors.grey.shade100,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lang == 'tr' ? 'Toplam İlerleme' : lang == 'en' ? 'Total Progress' : lang == 'de' ? 'Gesamtfortschritt' : lang == 'fr' ? 'Progrès total' : lang == 'es' ? 'Progreso total' : lang == 'id' ? 'Total Kemajuan' : lang == 'ru' ? 'Общий прогресс' : lang == 'it' ? 'Progresso totale' : lang == 'ur' ? 'کل پیش رفت' : 'Total Progress',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '%$percent',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: totalProgress,
                            minHeight: 8,
                            backgroundColor: isDark ? Colors.white10 : Colors.grey.shade200,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.premiumGold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.premiumGold.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.emoji_events,
                      color: AppColors.premiumGold,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Header
            Text(
              lang == 'tr' ? 'Kategoriler' : lang == 'en' ? 'Categories' : lang == 'de' ? 'Kategorien' : lang == 'fr' ? 'Catégories' : lang == 'es' ? 'Categorías' : lang == 'id' ? 'Kategori' : lang == 'ru' ? 'Категории' : lang == 'it' ? 'Categorie' : lang == 'ur' ? 'زمرہ جات' : 'Categories',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
              ),
            ),
            const SizedBox(height: 12),

            // Categories list matching mockup exactly
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _categories.keys.length,
              itemBuilder: (context, idx) {
                final category = _categories.keys.elementAt(idx);
                final items = _categories[category]!;
                final completedCount = _getCategoryCompletedCount(category, _categories);
                final categoryProgress = _getCategoryProgress(category, _categories);
                final categoryPercent = (categoryProgress * 100).toInt();
                final isExpanded = _expandedCategory == category;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: isDark ? AppColors.darkSurface : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: isExpanded ? AppColors.premiumGold : (isDark ? Colors.white10 : Colors.grey.shade100),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                category,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
                              ),
                            ),
                            Text(
                              '$completedCount/${items.length}',
                              style: const TextStyle(fontSize: 12.5, color: Colors.grey),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '%$categoryPercent',
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppColors.premiumGold),
                            ),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3),
                            child: LinearProgressIndicator(
                              value: categoryProgress,
                              minHeight: 5,
                              backgroundColor: isDark ? Colors.white10 : Colors.grey.shade100,
                              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.emeraldGreen),
                            ),
                          ),
                        ),
                        trailing: Icon(
                          isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          color: Colors.grey,
                        ),
                        onTap: () {
                          setState(() {
                            _expandedCategory = isExpanded ? null : category;
                          });
                        },
                      ),
                      if (isExpanded) ...[
                        const Divider(height: 1),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: items.map((item) {
                              final itemCompleted = _completedItems[item] ?? false;
                              return CheckboxListTile(
                                title: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 13.5,
                                    color: itemCompleted ? AppColors.premiumGold : null,
                                    fontWeight: itemCompleted ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                                activeColor: AppColors.emeraldGreen,
                                value: itemCompleted,
                                onChanged: (val) => _toggleItem(item),
                                controlAffinity: ListTileControlAffinity.leading,
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
