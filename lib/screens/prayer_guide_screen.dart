import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../constants/theme.dart';
import '../data/prayer_database.dart';
import '../models/prayer_models.dart';
import '../providers/app_provider.dart';

class PrayerGuideScreen extends StatefulWidget {
  final PrayerTime time;
  final String partName;

  const PrayerGuideScreen({
    super.key,
    required this.time,
    required this.partName,
  });

  @override
  State<PrayerGuideScreen> createState() => _PrayerGuideScreenState();
}

class _PrayerGuideScreenState extends State<PrayerGuideScreen> {
  // Real AudioPlayer integration
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  String? _currentlyPlayingPath;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;
  double _playbackSpeed = 1.0;
  bool _isLooping = false;

  // Track the steps list and which one is expanded
  List<PrayerStep> _steps = [];
  int? _expandedIndex = 0; // Default first step expanded

  @override
  void initState() {
    super.initState();
    // Fetch steps on start
    final provider = Provider.of<AppProvider>(context, listen: false);
    final prayer = PrayerDatabase.getPrayer(
      provider.selectedMezhep,
      provider.selectedGender,
      widget.time,
      provider.languageCode,
    );

    // Find matching part
    final matchingPart = prayer.parts.firstWhere(
      (part) => part.name == widget.partName,
      orElse: () => prayer.parts.first,
    );

    _steps = matchingPart.steps;

    // Initialize AudioPlayer listeners
    _audioPlayer.onDurationChanged.listen((d) {
      if (mounted) setState(() => _duration = d);
    });
    _audioPlayer.onPositionChanged.listen((p) {
      if (mounted) setState(() => _position = p);
    });
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
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
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playAudio(String path) async {
    if (path.trim().isEmpty) return;
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
        // Play local asset audio
        await _audioPlayer.play(AssetSource('audio/$path'));
        await _audioPlayer.setPlaybackRate(_playbackSpeed);
        await _audioPlayer.setReleaseMode(_isLooping ? ReleaseMode.loop : ReleaseMode.release);
      }
    } catch (e) {
      debugPrint('Error playing audio: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ses çalınamadı: assets/audio/$path bulunamadı.'),
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

  void _stopAudio() {
    _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
      _currentlyPlayingPath = null;
      _position = Duration.zero;
      _duration = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final isDark = appProvider.isDarkMode;
    final lang = appProvider.languageCode;
    final imageBgColor = Colors.white;

    final errorText = lang == 'tr' ? 'Namaz verileri yüklenemedi.' : lang == 'de' ? 'Gebetsdaten konnten nicht geladen werden.' : lang == 'fr' ? 'Échec du chargement des données de prière.' : lang == 'es' ? 'No se pudieron cargar los datos de la oración.' : 'Prayer data could not be loaded.';
    final mezhepPrefix = lang == 'tr' ? 'Mezhep' : lang == 'de' ? 'Rechtsschule' : lang == 'fr' ? 'École' : lang == 'es' ? 'Escuela' : 'School';
    final genderPrefix = lang == 'tr' ? 'Cinsiyet' : lang == 'de' ? 'Geschlecht' : lang == 'fr' ? 'Sexe' : lang == 'es' ? 'Género' : 'Gender';

    if (_steps.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.time.getLocalizedName(lang))),
        body: Center(child: Text(errorText)),
      );
    }

    return PopScope(
      canPop: _expandedIndex == null || _expandedIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        setState(() {
          _expandedIndex = _expandedIndex! - 1;
        });
        _stopAudio();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (_expandedIndex != null && _expandedIndex! > 0) {
                setState(() {
                  _expandedIndex = _expandedIndex! - 1;
                });
                _stopAudio();
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          title: Text(
            '${widget.time.getLocalizedName(lang)} - ${widget.partName}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      body: Column(
        children: [
          // Mezhep and Gender display status
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: isDark ? AppColors.darkSurface : Colors.white,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 4,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.school_outlined, size: 14, color: AppColors.premiumGold),
                    const SizedBox(width: 4),
                    Text(
                      '$mezhepPrefix: ${appProvider.selectedMezhep.getLocalizedName(lang)}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      appProvider.selectedGender == Gender.male ? Icons.male : Icons.female,
                      size: 14,
                      color: AppColors.premiumGold,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '$genderPrefix: ${appProvider.selectedGender.getLocalizedName(lang)}',
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),

          // Vertical Steps List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              itemCount: _steps.length + 1, // Add 1 for the bottom complete button
              itemBuilder: (context, index) {
                if (index == _steps.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
                    child: ElevatedButton.icon(
                      onPressed: () => _showCompletionDialog(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.emeraldGreen,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 2,
                      ),
                      icon: const Icon(Icons.done_all),
                      label: const Text(
                        'Namazı Tamamla',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  );
                }

                final step = _steps[index];
                final isExpanded = _expandedIndex == index;

                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _expandedIndex = isExpanded ? null : index;
                        });
                        _stopAudio();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Step Number (Green circle)
                            Container(
                              width: 24,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: AppColors.emeraldGreen,
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                '${step.stepNumber}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Posture Image Thumbnail
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                color: isDark ? Colors.white10 : imageBgColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAlias,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  'assets/images/${step.imageKey}.png',
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Center(
                                      child: Icon(
                                        Icons.accessibility_new,
                                        color: AppColors.premiumGold,
                                        size: 26,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // Texts
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    step.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: isDark ? Colors.white : AppColors.darkEmerald,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    step.action,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.5,
                                      color: isDark ? Colors.white70 : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8),

                            // Expand indicator icon
                            Icon(
                              isExpanded ? Icons.expand_less : Icons.expand_more,
                              color: AppColors.premiumGold,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),

                    // If expanded, show detailed section (Inside card container for nesting)
                    if (isExpanded) ...[
                      Container(
                        margin: const EdgeInsets.only(top: 4, bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkSurface : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isDark ? Colors.white10 : Colors.grey.shade100,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: _buildExpandedStepDetail(context, step, isDark, appProvider),
                      ),
                    ],

                    if (index < _steps.length - 1 && !isExpanded)
                      Divider(
                        height: 1,
                        thickness: 0.8,
                        indent: 112, // Aligns divider with text
                        color: isDark ? Colors.white10 : Colors.grey.shade300,
                      ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
    );
  }

  // WIDGET BUILDER: Expanded detailed steps panel
  String _getHowToPrayText(String lang) {
    switch (lang) {
      case 'en': return 'How to Pray?';
      case 'de': return 'Wie wird gebetet?';
      case 'fr': return 'Comment prier?';
      case 'es': return '¿Cómo rezar?';
      case 'id': return 'Bagaimana Cara Shalat?';
      case 'ru': return 'Как молиться?';
      case 'it': return 'Come pregare?';
      case 'ur': return 'نماز کیسے پڑھیں؟';
      case 'tr':
      default: return 'Nasıl Kılınır?';
    }
  }

  Widget _buildExpandedStepDetail(
    BuildContext context,
    PrayerStep step,
    bool isDark,
    AppProvider appProvider,
  ) {
    final imageBgColor = Colors.white;
    // Generate recitations
    List<DuaSurah> recitations = [];
    int rekatNumber = 1;
    final match = RegExp(r'(\d+)').firstMatch(step.title);
    if (match != null) {
      rekatNumber = int.parse(match.group(1)!);
    }

    final titleLower = step.title.toLowerCase();
    final isKiyam = step.imageKey.contains('kiyam');
    final isOturus = step.imageKey.contains('oturus');
    final isFinalSitting = isOturus && (titleLower.contains('son') || titleLower.contains('final') || titleLower.contains('letzte') || titleLower.contains('dernière') || titleLower.contains('últim') || titleLower.contains('last'));
    final isFirstSitting = isOturus && !isFinalSitting;

    if (isKiyam) {
      recitations = PrayerDatabase.getKiyamRecitationsList(
        appProvider.selectedMezhep,
        widget.time,
        widget.partName,
        rekatNumber,
        widget.partName.contains('Farz') || widget.partName.contains('Fard') || widget.partName.contains('Obligatoire') || widget.partName.contains('Obligatorisch') || widget.partName.contains('Obligatoria'),
        (widget.partName.contains('Sünnet') || widget.partName.contains('Sunnah')) &&
            (widget.time == PrayerTime.ikindi || widget.time == PrayerTime.yatsi),
        appProvider.languageCode,
      );
    } else if (isFinalSitting) {
      recitations = PrayerDatabase.getOturusRecitationsList(appProvider.selectedMezhep, true, appProvider.languageCode);
    } else if (isFirstSitting) {
      recitations = PrayerDatabase.getOturusRecitationsList(appProvider.selectedMezhep, false, appProvider.languageCode);
    } else if (step.arabicText != null) {
      recitations = [
        DuaSurah(
          name: step.title.split('-').last.trim(),
          arabic: step.arabicText!,
          transcription: step.transcription ?? '',
          translation: step.translation ?? '',
          description: '',
          audioFileName: step.audioPath ?? '',
        )
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Large zoomable Image Card
        GestureDetector(
          onTap: () => _showZoomDialog(context, step),
          child: Center(
            child: Container(
              height: 270,
              width: 200,
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : imageBgColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isDark ? Colors.white10 : Colors.grey.shade200,
                  width: 1.5,
                ),
                boxShadow: isDark ? null : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/${step.imageKey}.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.accessibility_new_rounded,
                          size: 60,
                          color: AppColors.emeraldGreen.withOpacity(0.3),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.zoom_in, color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        const SizedBox(height: 16),

        Text(
          _getHowToPrayText(appProvider.languageCode),
          style: const TextStyle(
            color: AppColors.premiumGold,
            fontWeight: FontWeight.bold,
            fontSize: 13.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          step.action,
          style: TextStyle(
            fontSize: 13.5,
            color: isDark ? Colors.white70 : Colors.black87,
            height: 1.45,
          ),
        ),

        // Recitations Section
        if (recitations.isNotEmpty) ...[
          const SizedBox(height: 16),
          const Text(
            'Okunacak Dualar & Sureler',
            style: TextStyle(
              color: AppColors.premiumGold,
              fontWeight: FontWeight.bold,
              fontSize: 13.5,
            ),
          ),
          const SizedBox(height: 8),
          ...recitations.map((recitation) {
            String audioFile = recitation.audioFileName;
            if (step.audioPath != null) {
              audioFile = step.audioPath!;
            }
            if (audioFile == 'ettehiyyatu.mp3' && appProvider.selectedMezhep == Mezhep.shafii) {
              audioFile = 'ettehiyyatu_safii.mp3';
            }

            final isThisPlaying = _isPlaying && _currentlyPlayingPath == audioFile;

            return Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? Colors.black12 : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: isThisPlaying
                      ? AppColors.premiumGold
                      : AppColors.champagneGold.withOpacity(0.12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          recitation.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: isDark ? Colors.white : AppColors.darkEmerald,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isThisPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                          color: AppColors.emeraldGreen,
                          size: 26,
                        ),
                        onPressed: () => _playAudio(audioFile),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Center(
                    child: Text(
                      recitation.arabic,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Scheherazade',
                        fontSize: 20,
                        color: AppColors.emeraldGreen,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  if (recitation.transcription.isNotEmpty) ...[
                    Center(
                      child: Text(
                        recitation.transcription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12.5,
                          color: AppColors.premiumGold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                  ],
                  if (recitation.translation.isNotEmpty)
                    Center(
                      child: Text(
                        recitation.translation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white60 : Colors.black54,
                        ),
                      ),
                    ),

                  // Audio progress details
                  if (_currentlyPlayingPath == audioFile) ...[
                    const Divider(height: 16),
                    Row(
                      children: [
                        const Icon(Icons.volume_up, size: 14, color: AppColors.emeraldGreen),
                        const SizedBox(width: 8),
                        Expanded(
                          child: SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 1.5,
                              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4),
                              activeTrackColor: AppColors.emeraldGreen,
                              inactiveTrackColor: isDark ? Colors.white10 : Colors.black12,
                              thumbColor: AppColors.premiumGold,
                            ),
                            child: Slider(
                              min: 0,
                              max: _duration.inSeconds.toDouble() > 0
                                  ? _duration.inSeconds.toDouble()
                                  : 100.0,
                              value: _position.inSeconds.toDouble(),
                              onChanged: (val) async {
                                await _audioPlayer.seek(Duration(seconds: val.toInt()));
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${_position.inMinutes}:${(_position.inSeconds % 60).toString().padLeft(2, '0')}',
                          style: const TextStyle(fontSize: 10),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: _togglePlaybackSpeed,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                            decoration: BoxDecoration(
                              color: AppColors.premiumGold.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColors.premiumGold.withOpacity(0.3)),
                            ),
                            child: Text(
                              '${_playbackSpeed}x',
                              style: const TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                                color: AppColors.premiumGold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: _toggleLoop,
                          child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: _isLooping ? AppColors.premiumGold.withOpacity(0.12) : Colors.transparent,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: _isLooping ? AppColors.premiumGold.withOpacity(0.3) : Colors.transparent),
                            ),
                            child: Icon(
                              _isLooping ? Icons.repeat_one : Icons.repeat,
                              color: _isLooping ? AppColors.premiumGold : Colors.grey,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            );
          }),
        ],

        // Specific notes
        if (step.note != null && step.note!.isNotEmpty) ...[
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.premiumGold.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.premiumGold.withOpacity(0.2)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, color: AppColors.premiumGold, size: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    step.note!,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark ? Colors.white70 : Colors.black87,
                      height: 1.35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  // DIALOG BUILDER: Zoom overlay
  void _showZoomDialog(BuildContext context, PrayerStep step) {
    final imageBgColor = Colors.white;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.premiumGold.withOpacity(0.4)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      step.title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: Container(
                  height: 360,
                  width: 260,
                  decoration: BoxDecoration(
                    color: imageBgColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/${step.imageKey}.png',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.accessibility_new, size: 60, color: AppColors.emeraldGreen),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // DIALOG BUILDER: Completion dialog
  void _showCompletionDialog(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    final lang = appProvider.languageCode;

    final titleText = lang == 'tr' ? 'Allah Kabul Etsin!' :
                     lang == 'de' ? 'Möge Allah annehmen!' :
                     lang == 'fr' ? 'Qu\'Allah accepte !' :
                     lang == 'es' ? '¡Que Allah acepte!' :
                     'May Allah Accept!';

    final descText = lang == 'tr' ? 'Bu namaz kılınış rehberini başarıyla tamamladınız. Rabbim ibadetinizi makbul eylesin.' :
                     lang == 'de' ? 'Sie haben diese Gebetsanleitung erfolgreich abgeschlossen. Möge Allah Ihren Gottesdienst annehmen.' :
                     lang == 'fr' ? 'Vous avez terminé ce guide de prière avec succès. Qu\'Allah agrée votre adoration.' :
                     lang == 'es' ? 'Ha completado con éxito esta guía de oración. Que Allah acepte su adoración.' :
                     'You have successfully completed this prayer guide. May Allah accept your worship.';

    final buttonText = lang == 'tr' ? 'Ana Sayfaya Dön' :
                       lang == 'de' ? 'Zur Startseite' :
                       lang == 'fr' ? 'Retour à l\'accueil' :
                       lang == 'es' ? 'Volver al inicio' :
                       'Return to Home';

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: AppColors.emeraldGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.done_outline_rounded,
                  color: AppColors.premiumGold,
                  size: 50,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                titleText,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: AppColors.emeraldGreen,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                descText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, height: 1.4),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Return home
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.emeraldGreen,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


