import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../data/prayer_database.dart';
import '../providers/app_provider.dart';

class AbdestScreen extends StatelessWidget {
  const AbdestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final appProvider = Provider.of<AppProvider>(context);
    final steps = PrayerDatabase.getAbdestSteps(appProvider.selectedMezhep, appProvider.languageCode);
    final screenWidth = MediaQuery.of(context).size.width;
    final imgSize = screenWidth < 360 ? 95.0 : (screenWidth < 400 ? 115.0 : 135.0);
    final indentValue = 24.0 + 16.0 + imgSize + 16.0;

    return Scaffold(
      backgroundColor: isDark ? AppColors.darkBg : const Color(0xFFFEF8E5),
      appBar: AppBar(
        title: Text(
          appProvider.translate('abdest_guide'),
          style: TextStyle(
            color: isDark ? Colors.white : AppColors.darkEmerald,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : AppColors.darkEmerald,
        ),
        backgroundColor: isDark ? AppColors.darkSurface : const Color(0xFFFEF8E5),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        itemCount: steps.length,
        itemBuilder: (context, index) {
          final step = steps[index];
          return Column(
            children: [
              Padding(
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

                    // Illustration Posture
                    Container(
                      width: imgSize,
                      height: imgSize,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.white10 : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: isDark ? null : [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        'assets/images/${step.imageKey}.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(
                            child: Icon(
                              Icons.water_drop_outlined,
                              color: AppColors.premiumGold,
                              size: 32,
                            ),
                          );
                        },
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
                            style: TextStyle(
                              fontSize: 12.5,
                              color: isDark ? Colors.white70 : Colors.black54,
                              height: 1.35,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (index < steps.length - 1)
                Divider(
                  height: 1,
                  thickness: 0.8,
                  indent: indentValue,
                  color: isDark ? Colors.white10 : Colors.grey.shade300,
                ),
            ],
          );
        },
      ),
    );
  }
}
