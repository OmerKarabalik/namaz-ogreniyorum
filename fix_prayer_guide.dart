import 'dart:io';

void main() {
  final file = File('lib/screens/prayer_guide_screen.dart');
  var content = file.readAsStringSync();
  
  content = content.replaceAll('''
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
''', '');

  content = content.replaceAll('  Widget _buildExpandedStepDetail(', '''
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

  Widget _buildExpandedStepDetail(''');
  
  file.writeAsStringSync(content);
}
