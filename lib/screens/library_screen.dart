import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../data/prayer_database.dart';
import '../models/prayer_models.dart';
import '../providers/app_provider.dart';
import '../services/ad_service.dart';

class LibraryScreen extends StatefulWidget {
  final bool? filterSurahs; // true: only Surahs, false: only Duas, null: all
  const LibraryScreen({super.key, this.filterSurahs});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  List<DuaSurah> _items = [];
  String _searchQuery = '';

  // Audio playing capabilities
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String? _currentlyPlayingPath;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  double _playbackSpeed = 1.0;
  bool _isLooping = false;

  // AdMob Banner Reklam
  BannerAd? _bannerAd;
  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
    _audioPlayer.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() {
          _duration = d;
        });
      }
    });
    _audioPlayer.onPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          _position = p;
        });
      }
    });
    _audioPlayer.onPlayerComplete.listen((event) {
      if (mounted) {
        setState(() {
          _isPlaying = false;
          _currentlyPlayingPath = null;
          _position = Duration.zero;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final lang = Provider.of<AppProvider>(context, listen: false).languageCode;
    final newItems = PrayerDatabase.getDuaSurahs(lang);
    if (_items.length != newItems.length) {
      setState(() {
        _items = newItems;
      });
    }
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _loadBannerAd() {
    _bannerAd = AdService.createBannerAd(
      onAdLoaded: () {
        if (mounted) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        }
      },
      onAdFailedToLoad: (ad, error) {
        if (mounted) {
          setState(() {
            _isBannerAdLoaded = false;
          });
        }
      },
    );
  }

  Future<void> _playAudio(String path) async {
    try {
      if (_isPlaying && _currentlyPlayingPath == path) {
        await _audioPlayer.pause();
      } else if (_currentlyPlayingPath == path) {
        await _audioPlayer.resume();
        await _audioPlayer.setPlaybackRate(_playbackSpeed);
        await _audioPlayer.setReleaseMode(_isLooping ? ReleaseMode.loop : ReleaseMode.release);
      } else {
        await _audioPlayer.stop();
        _currentlyPlayingPath = path;
        setState(() {
          _position = Duration.zero;
          _duration = Duration.zero;
        });
        await _audioPlayer.play(AssetSource('audio/$path'));
        await _audioPlayer.setPlaybackRate(_playbackSpeed);
        await _audioPlayer.setReleaseMode(_isLooping ? ReleaseMode.loop : ReleaseMode.release);
      }
    } catch (e) {
      debugPrint('Error playing library audio: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ses dosyası (assets/audio/$path) bulunamadı.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _toggleLoop() async {
    setState(() {
      _isLooping = !_isLooping;
    });
    try {
      await _audioPlayer.setReleaseMode(_isLooping ? ReleaseMode.loop : ReleaseMode.release);
    } catch (e) {
      debugPrint('Error setting release mode: $e');
    }
  }

  Future<void> _togglePlaybackSpeed() async {
    double nextSpeed;
    if (_playbackSpeed == 1.0) {
      nextSpeed = 1.25;
    } else if (_playbackSpeed == 1.25) {
      nextSpeed = 1.5;
    } else if (_playbackSpeed == 1.5) {
      nextSpeed = 1.75;
    } else if (_playbackSpeed == 1.75) {
      nextSpeed = 2.0;
    } else if (_playbackSpeed == 2.0) {
      nextSpeed = 2.5;
    } else if (_playbackSpeed == 2.5) {
      nextSpeed = 3.0;
    } else if (_playbackSpeed == 3.0) {
      nextSpeed = 4.0;
    } else {
      nextSpeed = 1.0;
    }
    setState(() {
      _playbackSpeed = nextSpeed;
    });
    try {
      await _audioPlayer.setPlaybackRate(_playbackSpeed);
    } catch (e) {
      debugPrint('Error setting playback rate: $e');
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<AppProvider>(context).languageCode;

    // Reload items if language changed
    final currentItems = PrayerDatabase.getDuaSurahs(lang);
    if (_items.length != currentItems.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) setState(() => _items = currentItems);
      });
    }

    // Filter list based on search query and category filter
    final filteredItems = currentItems.asMap().entries.where((entry) {
      final index = entry.key;
      final item = entry.value;
      
      // Indices 1 to 11 are Surahs (Fatiha to Nas). 0 is Subhanaka, 12+ are other Duas.
      final isSure = index >= 1 && index <= 11;
      
      if (widget.filterSurahs == true && !isSure) return false;
      if (widget.filterSurahs == false && isSure) return false;

      return item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.translation.toLowerCase().contains(_searchQuery.toLowerCase());
    }).map((e) => e.value).toList();

    // Screen titles and placeholders
    final titleText = widget.filterSurahs == true
        ? (lang == 'tr' ? 'Namaz Sureleri' : lang == 'de' ? 'Gebetsuren' : lang == 'fr' ? 'Sourates de Prière' : lang == 'es' ? 'Suras de Oración' : lang == 'id' ? 'Surah Shalat' : lang == 'ru' ? 'Суры для намаза' : lang == 'it' ? 'Sure della Preghiera' : lang == 'ur' ? 'نماز کی سورتیں' : 'Prayer Surahs')
        : widget.filterSurahs == false
            ? (lang == 'tr' ? 'Dualar' : lang == 'de' ? 'Gebete' : lang == 'fr' ? 'Invocations' : lang == 'es' ? 'Súplicas' : lang == 'id' ? 'Doa-doa' : lang == 'ru' ? 'Молитвы' : lang == 'it' ? 'Suppliche' : lang == 'ur' ? 'دعائیں' : 'Supplications')
            : (lang == 'tr' ? 'Dualar ve Sureler' : lang == 'de' ? 'Gebete & Suren' : lang == 'fr' ? 'Invocations & Sourates' : lang == 'es' ? 'Súplicas & Suras' : lang == 'id' ? 'Doa & Surah' : lang == 'ru' ? 'Молитвы и Суры' : lang == 'it' ? 'Suppliche e Sure' : lang == 'ur' ? 'دعائیں اور سورتیں' : 'Duas & Surahs');

    final searchHint = lang == 'tr' ? 'Dua veya sure ara...' : lang == 'de' ? 'Gebet oder Sure suchen...' : lang == 'fr' ? 'Chercher une invocation ou sourate...' : lang == 'es' ? 'Buscar dua o sura...' : lang == 'id' ? 'Cari doa atau surah...' : lang == 'ru' ? 'Поиск дуа или суры...' : lang == 'it' ? 'Cerca dua o sura...' : lang == 'ur' ? 'دعا یا سورہ تلاش کریں...' : 'Search dua or surah...';

    final emptyText = lang == 'tr' ? 'Aradığınız dua veya sure bulunamadı.' : lang == 'de' ? 'Kein Gebet oder Sure gefunden.' : lang == 'fr' ? 'Aucune invocation ou sourate trouvée.' : lang == 'es' ? 'No se encontró ninguna dua o sura.' : lang == 'id' ? 'Doa atau surah tidak ditemukan.' : lang == 'ru' ? 'Дуа или сура не найдена.' : lang == 'it' ? 'Nessuna dua o sura trovata.' : lang == 'ur' ? 'کوئی دعا یا سورہ نہیں ملی۔' : 'No dua or surah found.';

    return Scaffold(
      appBar: AppBar(
        title: Text(titleText),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              decoration: InputDecoration(
                hintText: searchHint,
                prefixIcon: const Icon(Icons.search, color: AppColors.emeraldGreen),
                filled: true,
                fillColor: isDark ? AppColors.darkSurface : Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.champagneGold.withOpacity(0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: AppColors.champagneGold.withOpacity(0.2),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColors.premiumGold,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),

          // Main list
          Expanded(
            child: filteredItems.isEmpty
                ? Center(
                    child: Text(emptyText),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return _buildDuaCard(context, item, index + 1);
                    },
                  ),
          ),
          Builder(
            builder: (context) {
              final banner = _bannerAd;
              if (_isBannerAdLoaded && banner != null) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF0F172A) : const Color(0xFFFEF8E5),
                    border: Border(
                      top: BorderSide(
                        color: isDark ? Colors.white10 : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: banner.size.width.toDouble(),
                    height: banner.size.height.toDouble(),
                    child: AdWidget(ad: banner),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  // Beautiful Expandable Card for Duas/Surahs
  Widget _buildDuaCard(BuildContext context, DuaSurah item, int index) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final lang = Provider.of<AppProvider>(context, listen: false).languageCode;
    final audioFile = item.audioFileName;
    final isThisPlaying = _isPlaying && _currentlyPlayingPath == audioFile;

    // Card text translations
    final subtitleText = lang == 'tr' ? 'Arapça - Okunuş - Anlamı' : lang == 'de' ? 'Arabisch - Aussprache - Bedeutung' : lang == 'fr' ? 'Arabe - Prononciation - Signification' : lang == 'es' ? 'Árabe - Pronunciación - Significado' : lang == 'id' ? 'Arab - Fonetik - Arti' : lang == 'ru' ? 'Арабский - Фонетика - Значение' : lang == 'it' ? 'Arabo - Fonetica - Significato' : lang == 'ur' ? 'عربی - صوتیات - معنی' : 'Arabic - Phonetic - Meaning';
    final transcriptionTitle = lang == 'tr' ? 'Türkçe Okunuşu' : lang == 'de' ? 'Aussprache' : lang == 'fr' ? 'Prononciation' : lang == 'es' ? 'Pronunciación' : lang == 'id' ? 'Bacaan Fonetik' : lang == 'ru' ? 'Фонетическое чтение' : lang == 'it' ? 'Lettura Fonetica' : lang == 'ur' ? 'صوتی تلفظ' : 'Phonetic Reading';
    final translationTitle = lang == 'tr' ? 'Türkçe Anlamı (Meali)' : lang == 'de' ? 'Bedeutung (Übersetzung)' : lang == 'fr' ? 'Signification (Traduction)' : lang == 'es' ? 'Significado (Traducción)' : lang == 'id' ? 'Arti (Terjemahan)' : lang == 'ru' ? 'Значение (Перевод)' : lang == 'it' ? 'Significato (Traduzione)' : lang == 'ur' ? 'معنی (ترجمہ)' : 'Meaning (Translation)';

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isDark ? Colors.white10 : Colors.grey.shade100),
      ),
      child: ExpansionTile(
        leading: Container(
          width: 28,
          height: 28,
          decoration: const BoxDecoration(
            color: AppColors.emeraldGreen,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
        title: Text(
          item.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        subtitle: Text(
          subtitleText,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.grey,
          ),
        ),
        collapsedBackgroundColor: isDark ? AppColors.darkSurface : Colors.white,
        backgroundColor: isDark ? AppColors.darkSurface : Colors.white,
        iconColor: AppColors.premiumGold,
        collapsedIconColor: AppColors.emeraldGreen,
        trailing: IconButton(
          icon: Icon(
            isThisPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
            color: AppColors.emeraldGreen,
            size: 28,
          ),
          onPressed: () => _playAudio(audioFile),
        ),
        childrenPadding: const EdgeInsets.all(16.0),
        shape: const Border(), // Removes bottom line on expansion
        children: [
          const Divider(height: 1),
          if (_currentlyPlayingPath == audioFile) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  _formatDuration(_position),
                  style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 3,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                    ),
                    child: Slider(
                      activeColor: AppColors.emeraldGreen,
                      inactiveColor: AppColors.emeraldGreen.withOpacity(0.15),
                      value: _position.inSeconds.toDouble().clamp(0.0, _duration.inSeconds.toDouble() > 0 ? _duration.inSeconds.toDouble() : 1.0),
                      max: _duration.inSeconds.toDouble() > 0
                          ? _duration.inSeconds.toDouble()
                          : 1.0,
                      onChanged: (val) async {
                        await _audioPlayer.seek(Duration(seconds: val.toInt()));
                      },
                    ),
                  ),
                ),
                Text(
                  _formatDuration(_duration),
                  style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: _togglePlaybackSpeed,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: const BorderSide(color: AppColors.premiumGold, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    '${_playbackSpeed}x',
                    style: const TextStyle(
                      color: AppColors.premiumGold,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  onPressed: _toggleLoop,
                  icon: Icon(
                    _isLooping ? Icons.repeat_one : Icons.repeat,
                    color: _isLooping ? AppColors.premiumGold : Colors.grey,
                    size: 22,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  style: IconButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),

          // Arabic Text (Centered, large custom layout)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? Colors.white.withOpacity(0.02) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.champagneGold.withOpacity(0.15),
              ),
            ),
            child: Text(
              item.arabic,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: const TextStyle(
                fontFamily: 'Scheherazade',
                fontSize: 24,
                height: 1.6,
                fontWeight: FontWeight.w500,
                color: AppColors.emeraldGreen,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Transcription (Phonetic spelling)
          _buildDetailSection(
            context,
            title: transcriptionTitle,
            content: item.transcription,
            contentStyle: const TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),

          // Translation (Meal)
          _buildDetailSection(
            context,
            title: translationTitle,
            content: item.translation,
            contentStyle: const TextStyle(
              fontSize: 13.5,
              height: 1.4,
              fontWeight: FontWeight.w500,
            ),
            backgroundColor: isDark 
                ? AppColors.emeraldGreen.withOpacity(0.1) 
                : AppColors.emeraldGreen.withOpacity(0.04),
          ),
        ],
      ),
    );
  }

  // Reusable detail section builder
  Widget _buildDetailSection(
    BuildContext context, {
    required String title,
    required String content,
    required TextStyle contentStyle,
    Color? backgroundColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? Colors.white.withOpacity(0.01) : Colors.grey.shade50),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: AppColors.premiumGold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: contentStyle.copyWith(
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}


