import 'package:flutter/material.dart';
import '../constants/theme.dart';

class NamazConditionsScreen extends StatelessWidget {
  const NamazConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('NamazÄ±n FarzlarÄ± (ÅartlarÄ±)'),
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
                      'NamazÄ±n farzlarÄ± toplam 12 tanedir. Bunlardan 6\'sÄ± namaza baÅŸlamadan Ã¶nce hazÄ±rlÄ±k aÅŸamasÄ±nda (DÄ±ÅŸÄ±ndaki Farzlar), 6\'sÄ± ise namazÄ±n iÃ§inde (Ä°Ã§indeki Farzlar/RÃ¼kÃ¼nler) yerine getirilir.',
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

            // Category 1: DÄ±ÅŸÄ±ndaki Farzlar
            _buildCategoryHeader('Namaza HazÄ±rlÄ±k ÅartlarÄ± (DÄ±ÅŸÄ±ndaki Farzlar)', isDark),
            _buildConditionTile(
              '1. Hadesten Taharet',
              'GÃ¶rÃ¼nmeyen kirlilikten temizlenmektir. Yani namaz kÄ±lmak iÃ§in abdest almak, gerekiyorsa gusÃ¼l abdesti almak veya su bulunmadÄ±ÄŸÄ±nda teyemmÃ¼m yapmaktÄ±r.',
              isDark,
            ),
            _buildConditionTile(
              '2. Necasetten Taharet',
              'GÃ¶rÃ¼nen kirlilikten temizlenmektir. Namaz kÄ±lacak kiÅŸinin bedeninde, elbisesinde ve namaz kÄ±lacaÄŸÄ± yerde necaset (namaza engel olan pislik) bulunmamasÄ±, varsa temizlenmesidir.',
              isDark,
            ),
            _buildConditionTile(
              '3. Setr-i Avret',
              'Namaz kÄ±larken vÃ¼cudun Ã¶rtÃ¼lmesi gereken yerlerini Ã¶rtmektir. Erkekler iÃ§in en az gÃ¶bek ile diz kapaÄŸÄ± arasÄ±; kadÄ±nlar iÃ§in ise el, yÃ¼z ve ayaklar dÄ±ÅŸÄ±ndaki tÃ¼m bedendir.',
              isDark,
            ),
            _buildConditionTile(
              '4. Ä°stikbal-i KÄ±ble',
              'Namaz kÄ±larken kÄ±bleye yani Kabe istikametine yÃ¶nelmektir. Namaza baÅŸlarken gÃ¶vdemiz kÄ±bleye doÄŸru dÃ¶nÃ¼k olmalÄ±dÄ±r.',
              isDark,
            ),
            _buildConditionTile(
              '5. Vakit',
              'NamazlarÄ± kendi vakitleri iÃ§inde kÄ±lmaktÄ±r. Vakti girmemiÅŸ bir namaz kÄ±lÄ±namaz. Her namazÄ±n kendine has bir kÄ±lÄ±nÄ±ÅŸ vakti vardÄ±r.',
              isDark,
            ),
            _buildConditionTile(
              '6. Niyet',
              'Namaz kÄ±larken hangi vakit namazÄ±nÄ± kÄ±lacaÄŸÄ±nÄ± kalben bilmek ve niyet etmektir. Dil ile de niyet etmek sÃ¼nnettir.',
              isDark,
            ),

            const SizedBox(height: 20),

            // Category 2: Ä°Ã§indeki Farzlar
            _buildCategoryHeader('NamazÄ±n RÃ¼kÃ¼nleri (Ä°Ã§indeki Farzlar)', isDark),
            _buildConditionTile(
              '1. Ä°ftitah Tekbiri',
              'Namaza baÅŸlarken "AllÃ¢hu Ekber" diyerek tekbir almak ve namaza giriÅŸ yapmaktÄ±r.',
              isDark,
            ),
            _buildConditionTile(
              '2. KÄ±yam',
              'Namazda ayakta durmaktÄ±r. GÃ¼cÃ¼ yetenlerin farz namazlarÄ± ayakta kÄ±lmasÄ± farzdÄ±r.',
              isDark,
            ),
            _buildConditionTile(
              '3. KÄ±raat',
              'Namazda ayakta dururken Kuran-Ä± Kerim okumaktÄ±r. En az bir kÄ±sa sure veya Ã¼Ã§ kÄ±sa ayet miktarÄ± okumak gerekir.',
              isDark,
            ),
            _buildConditionTile(
              '4. RÃ¼kÃ»',
              'KÄ±raattan sonra elleri diz kapaklarÄ±na koyup eÄŸilmektir. SÄ±rtÄ±n dÃ¼z olmasÄ± sÃ¼nnettir.',
              isDark,
            ),
            _buildConditionTile(
              '5. Secde',
              'RÃ¼kÃ»dan doÄŸrulduktan sonra alnÄ±, burnu, elleri, dizleri ve ayak parmaklarÄ±nÄ± yere koyarak secde yapmaktÄ±r. Her rekatta peÅŸ peÅŸe iki secde yapÄ±lÄ±r.',
              isDark,
            ),
            _buildConditionTile(
              '6. Kade-i Ahire (Son OturuÅŸ)',
              'NamazÄ±n sonunda "EttehiyyÃ¢tÃ¼" duasÄ±nÄ± okuyacak kadar oturup beklemektir. NamazÄ±n son rÃ¼knÃ¼dÃ¼r.',
              isDark,
            ),

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

