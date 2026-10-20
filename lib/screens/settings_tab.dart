import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../models/prayer_models.dart';
import '../providers/app_provider.dart';
import '../widgets/notification_settings_sheet.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.isDarkMode;
    final lang = provider.languageCode;

    // ──── Localized labels ────
    final profileHeader = lang == 'tr' ? 'Eğitim Profili' : lang == 'de' ? 'Lernprofil' : lang == 'fr' ? 'Profil d\'apprentissage' : lang == 'es' ? 'Perfil de aprendizaje' : lang == 'id' ? 'Profil Belajar' : lang == 'ru' ? 'Профиль обучения' : lang == 'it' ? 'Profilo di apprendimento' : lang == 'ur' ? 'سیکھنے کا پروفائل' : 'Learning Profile';
    final systemHeader = lang == 'tr' ? 'Sistem Ayarları' : lang == 'de' ? 'Systemeinstellungen' : lang == 'fr' ? 'Paramètres système' : lang == 'es' ? 'Configuración del sistema' : lang == 'id' ? 'Pengaturan Sistem' : lang == 'ru' ? 'Системные настройки' : lang == 'it' ? 'Impostazioni di sistema' : lang == 'ur' ? 'سسٹم کی ترتیبات' : 'System Settings';
    final languageHeader = lang == 'tr' ? 'Dil / Language' : lang == 'id' ? 'Bahasa / Language' : lang == 'ru' ? 'Язык / Language' : lang == 'it' ? 'Lingua / Language' : lang == 'ur' ? 'زبان / Language' : 'Language / Dil';

    final mezTitle = lang == 'tr' ? 'Fıkıh Mezhebi' : lang == 'de' ? 'Rechtsschule (Mezhep)' : lang == 'fr' ? 'École juridique (Mezhep)' : lang == 'es' ? 'Escuela jurídica (Mezhep)' : lang == 'id' ? 'Mazhab Fiqh' : lang == 'ru' ? 'Школа юриспруденции (Мазхаб)' : lang == 'it' ? 'Scuola di Giurisprudenza (Madhhab)' : lang == 'ur' ? 'فقہی مکتب فکر' : 'School of Jurisprudence';
    final mezDesc = lang == 'tr' ? 'Namaz rekatları ve duaları seçtiğiniz mezhebe göre uyarlanır.' : lang == 'de' ? 'Gebetsrakats und Bittgebete passen sich der ausgewählten Rechtsschule an.' : lang == 'fr' ? 'Les rakats de prière et les invocations s\'adaptent à l\'école choisie.' : lang == 'es' ? 'Los rakats de oración y súplicas se adaptan a la escuela seleccionada.' : lang == 'id' ? 'Rakaat shalat dan doa disesuaikan dengan mazhab yang dipilih.' : lang == 'ru' ? 'Ракааты молитвы и молитвы адаптируются в зависимости от выбранной школы.' : lang == 'it' ? 'I rakat della preghiera e le suppliche sono adattati in base alla scuola selezionata.' : lang == 'ur' ? 'نماز کی رکعات اور دعائیں منتخب کردہ مکتب فکر کے مطابق تیار کی گئی ہیں۔' : 'Prayer rakats and supplications are adapted according to the selected school.';

    final genderTitle = lang == 'tr' ? 'Kılınış Şekli (Cinsiyet)' : lang == 'de' ? 'Gebetsweise (Geschlecht)' : lang == 'fr' ? 'Mode de prière (Sexe)' : lang == 'es' ? 'Estilo de oración (Género)' : lang == 'id' ? 'Gaya Shalat (Gender)' : lang == 'ru' ? 'Стиль молитвы (Пол)' : lang == 'it' ? 'Stile di preghiera (Genere)' : lang == 'ur' ? 'نماز کا طریقہ (صنف)' : 'Prayer Style (Gender)';
    final genderDesc = lang == 'tr' ? 'Duruşlar ve el bağlama kuralları seçtiğiniz kılınışa göre değişir.' : lang == 'de' ? 'Körperhaltungen und Handregeln ändern sich je nach gewählter Gebetsweise.' : lang == 'fr' ? 'Les postures et les règles de position des mains changent selon le mode choisi.' : lang == 'es' ? 'Las posturas y reglas de posición de manos cambian según el estilo elegido.' : lang == 'id' ? 'Postur dan aturan posisi tangan berubah sesuai dengan gaya shalat yang dipilih.' : lang == 'ru' ? 'Позы и правила положения рук меняются в зависимости от выбранного стиля молитвы.' : lang == 'it' ? 'Le posture e le regole di posizionamento delle mani cambiano in base allo stile di preghiera selezionato.' : lang == 'ur' ? 'منتخب کردہ نماز کے طریقے کی بنیاد پر کرنسیوں اور ہاتھ کی پوزیشن کے اصول تبدیل ہوتے ہیں۔' : 'Postures and hand positioning rules change based on the selected prayer style.';

    final maleLabel = lang == 'tr' ? 'Erkek' : lang == 'de' ? 'Mann' : lang == 'fr' ? 'Homme' : lang == 'es' ? 'Hombre' : lang == 'id' ? 'Laki-laki' : lang == 'ru' ? 'Мужчина' : lang == 'it' ? 'Uomo' : lang == 'ur' ? 'مرد' : 'Male';
    final femaleLabel = lang == 'tr' ? 'Kadın' : lang == 'de' ? 'Frau' : lang == 'fr' ? 'Femme' : lang == 'es' ? 'Mujer' : lang == 'id' ? 'Perempuan' : lang == 'ru' ? 'Женщина' : lang == 'it' ? 'Donna' : lang == 'ur' ? 'عورت' : 'Female';

    final remindersLabel = lang == 'tr' ? 'Hatırlatıcılar' : lang == 'de' ? 'Erinnerungen' : lang == 'fr' ? 'Rappels' : lang == 'es' ? 'Recordatorios' : lang == 'id' ? 'Pengingat' : lang == 'ru' ? 'Напоминания' : lang == 'it' ? 'Promemoria' : lang == 'ur' ? 'یاد دہانیاں' : 'Reminders';
    final remindersSub = lang == 'tr' ? 'Namaz vakitleri hatırlatıcıları' : lang == 'de' ? 'Gebetszeiterinnerungen' : lang == 'fr' ? 'Rappels des horaires de prière' : lang == 'es' ? 'Recordatorios de horarios de oración' : lang == 'id' ? 'Pengingat waktu shalat' : lang == 'ru' ? 'Напоминания о времени молитвы' : lang == 'it' ? 'Promemoria per gli orari di preghiera' : lang == 'ur' ? 'نماز کے اوقات کی یاد دہانیاں' : 'Prayer time reminders';

    final notifLabel = lang == 'tr' ? 'Bildirimler' : lang == 'de' ? 'Benachrichtigungen' : lang == 'fr' ? 'Notifications' : lang == 'es' ? 'Notificaciones' : lang == 'id' ? 'Notifikasi' : lang == 'ru' ? 'Уведомления' : lang == 'it' ? 'Notifiche' : lang == 'ur' ? 'اطلاعات' : 'Notifications';
    final notifSub = lang == 'tr' ? 'Bildirim tercihlerinizi yönetin' : lang == 'de' ? 'Ihre Benachrichtigungseinstellungen verwalten' : lang == 'fr' ? 'Gérer vos préférences de notification' : lang == 'es' ? 'Administrar sus preferencias de notification' : lang == 'id' ? 'Kelola preferensi notifikasi Anda' : lang == 'ru' ? 'Управление настройками уведомлений' : lang == 'it' ? 'Gestisci le tue preferenze di notifica' : lang == 'ur' ? 'اپنی اطلاع کی ترجیحات کا نظم کریں' : 'Manage your notification preferences';

    final themeLabel = lang == 'tr' ? 'Tema' : lang == 'de' ? 'Design' : lang == 'fr' ? 'Thème' : lang == 'es' ? 'Tema' : lang == 'id' ? 'Tema' : lang == 'ru' ? 'Тема' : lang == 'it' ? 'Tema' : lang == 'ur' ? 'تھیم' : 'Theme';
    final themeSub = isDark
        ? (lang == 'tr' ? 'Karanlık tema aktif' : lang == 'de' ? 'Dunkles Design aktiv' : lang == 'fr' ? 'Thème sombre actif' : lang == 'es' ? 'Tema oscuro activo' : lang == 'id' ? 'Tema gelap aktif' : lang == 'ru' ? 'Темная тема активна' : lang == 'it' ? 'Tema scuro attivo' : lang == 'ur' ? 'ڈارک تھیم فعال ہے' : 'Dark theme active')
        : (lang == 'tr' ? 'Açık tema aktif' : lang == 'de' ? 'Helles Design aktiv' : lang == 'fr' ? 'Thème clair actif' : lang == 'es' ? 'Tema claro activo' : lang == 'id' ? 'Tema terang aktif' : lang == 'ru' ? 'Светлая тема активна' : lang == 'it' ? 'Tema chiaro attivo' : lang == 'ur' ? 'لائٹ تھیم فعال ہے' : 'Light theme active');

    final backupLabel = lang == 'tr' ? 'Yedekle ve Geri Yükle' : lang == 'de' ? 'Sichern & Wiederherstellen' : lang == 'fr' ? 'Sauvegarder & Restaurer' : lang == 'es' ? 'Copia de seguridad y restaurar' : lang == 'id' ? 'Cadangkan & Pulihkan' : lang == 'ru' ? 'Резервное копирование и восстановление' : lang == 'it' ? 'Backup e ripristino' : lang == 'ur' ? 'بیک اپ اور بحال' : 'Backup & Restore';
    final backupSub = lang == 'tr' ? 'Verilerinizi yedekleyin' : lang == 'de' ? 'Ihre Daten sichern' : lang == 'fr' ? 'Sauvegarder vos données' : lang == 'es' ? 'Hacer una copia de seguridad de sus datos' : lang == 'id' ? 'Cadangkan data Anda' : lang == 'ru' ? 'Резервное копирование данных' : lang == 'it' ? 'Fai il backup dei tuoi dati' : lang == 'ur' ? 'اپنے ڈیٹا کا بیک اپ لیں' : 'Back up your data';

    final aboutLabel = lang == 'tr' ? 'Hakkımızda' : lang == 'de' ? 'Über uns' : lang == 'fr' ? 'À propos' : lang == 'es' ? 'Acerca de' : lang == 'id' ? 'Tentang Kami' : lang == 'ru' ? 'О нас' : lang == 'it' ? 'Informazioni' : lang == 'ur' ? 'ہمارے بارے میں' : 'About';
    final aboutSub = lang == 'tr' ? 'Uygulama hakkında bilgi' : lang == 'de' ? 'Informationen zur App' : lang == 'fr' ? 'Informations sur l\'application' : lang == 'es' ? 'Información sobre la aplicación' : lang == 'id' ? 'Informasi tentang aplikasi' : lang == 'ru' ? 'Информация о приложении' : lang == 'it' ? 'Informazioni sull\'app' : lang == 'ur' ? 'ایپ کے بارے میں معلومات' : 'Information about the app';
    final aboutContent = lang == 'tr'
        ? 'Namaz kılmayı, abdest almayı, namaz dualarını ve surelerini sesli okunuşları ve anlamlarıyla beraber en sade ve doğru biçimde öğreten mobil kılavuz uygulamanız.'
        : lang == 'de'
            ? 'Ihre mobile Leitfaden-App, die Ihnen auf einfachste und korrekteste Weise beibringt, wie man betet, Wudu macht und Gebete und Suren mit Aussprache und Bedeutung lernt.'
            : lang == 'fr'
                ? 'Votre application guide mobile qui vous enseigne de la manière la plus simple et correcte comment prier, faire les ablutions, et apprendre les invocations et sourates avec prononciation et signification.'
                : lang == 'es'
                    ? 'Su aplicación guía móvil que le enseña de la manera más sencilla y correcta cómo rezar, hacer el wudu y aprender las súplicas y suras con pronunciación y significado.'
                    : lang == 'id'
                        ? 'Aplikasi panduan seluler Anda yang mengajarkan Anda dengan cara paling sederhana dan paling benar bagaimana cara shalat, melakukan wudu, dan belajar doa dan surah dengan pengucapan dan makna.'
                        : lang == 'ru'
                            ? 'Ваше мобильное приложение-руководство, которое учит вас самым простым и правильным способом, как молиться, совершать омовение, а также изучать молитвы и суры с произношением и значением.'
                            : lang == 'it'
                                ? 'La tua app guida mobile che ti insegna nel modo più semplice e corretto come pregare, fare il wudu e imparare le preghiere e le sure con pronuncia e significato.'
                                : lang == 'ur'
                                    ? 'آپ کی موبائل گائیڈ ایپ جو آپ کو سب سے آسان اور صحیح طریقے سے سکھاتی ہے کہ نماز کیسے پڑھیں، وضو کیسے کریں، اور تلفظ اور معنی کے ساتھ دعائیں اور سورتیں سیکھیں۔'
                                    : 'Your mobile guide app that teaches you in the simplest and most correct way how to pray, perform wudu, and learn prayers and surahs with pronunciation and meaning.';

    final rateLabel = lang == 'tr' ? 'Puan Ver' : lang == 'de' ? 'Bewerten' : lang == 'fr' ? 'Évaluer' : lang == 'es' ? 'Calificar' : lang == 'id' ? 'Nilai Kami' : lang == 'ru' ? 'Оцените нас' : lang == 'it' ? 'Valutaci' : lang == 'ur' ? 'ہمیں درجہ دیں' : 'Rate Us';
    final rateSub = lang == 'tr' ? 'Uygulamamızı değerlendirin' : lang == 'de' ? 'Unsere App bewerten' : lang == 'fr' ? 'Évaluer notre application' : lang == 'es' ? 'Evaluar nuestra aplicación' : lang == 'id' ? 'Evaluasi aplikasi kami' : lang == 'ru' ? 'Оцените наше приложение' : lang == 'it' ? 'Valuta la nostra applicazione' : lang == 'ur' ? 'ہماری ایپ کا جائزہ لیں' : 'Rate our application';

    final wizardLabel = lang == 'tr' ? 'Sihirbazı Sıfırla' : lang == 'de' ? 'Einrichtungsassistent zurücksetzen' : lang == 'fr' ? 'Réinitialiser l\'assistant' : lang == 'es' ? 'Restablecer el asistente' : lang == 'id' ? 'Setel Ulang Asisten' : lang == 'ru' ? 'Сбросить мастера' : lang == 'it' ? 'Ripristina procedura guidata' : lang == 'ur' ? 'وزرڈ کو دوبارہ ترتیب دیں' : 'Reset Wizard';
    final wizardSub = lang == 'tr' ? 'İlk adım seçim kılavuzunu yeniden açar' : lang == 'de' ? 'Öffnet den Einrichtungsassistenten erneut' : lang == 'fr' ? 'Rouvre le guide de configuration initial' : lang == 'es' ? 'Vuelve a abrir la guía de configuración inicial' : lang == 'id' ? 'Buka kembali panduan pengaturan awal' : lang == 'ru' ? 'Вновь открывает начальное руководство по настройке' : lang == 'it' ? 'Riapre la guida alla configurazione iniziale' : lang == 'ur' ? 'ابتدائی سیٹ اپ گائیڈ کو دوبارہ کھولتا ہے' : 'Reopens the initial setup guide';
    final wizardConfirmTitle = lang == 'tr' ? 'Sihirbazı Sıfırla' : lang == 'de' ? 'Assistent zurücksetzen' : lang == 'fr' ? 'Réinitialiser l\'assistant' : lang == 'es' ? 'Restablecer el asistente' : lang == 'id' ? 'Setel Ulang Asisten' : lang == 'ru' ? 'Сбросить мастера' : lang == 'it' ? 'Ripristina procedura guidata' : lang == 'ur' ? 'وزرڈ کو دوبارہ ترتیب دیں' : 'Reset Wizard';
    final wizardConfirmBody = lang == 'tr'
        ? 'Kurulum sihirbazını sıfırlamak istediğinizden emin misiniz? Dil, mezhep ve kılınış şekli seçim adımlarını baştan yapmanız gerekecektir.'
        : lang == 'de'
            ? 'Möchten Sie den Einrichtungsassistenten wirklich zurücksetzen? Sie müssen die Sprach-, Rechtsschule- und Gebetsweiseauswahl erneut durchführen.'
            : lang == 'fr'
                ? 'Êtes-vous sûr de vouloir réinitialiser l\'assistant de configuration? Vous devrez refaire les étapes de sélection de la langue, de l\'école et du mode de prière.'
                : lang == 'es'
                    ? '¿Está seguro de que desea restablecer el asistente de configuración? Deberá volver a realizar los pasos de selección de idioma, escuela y estilo de oración.'
                    : lang == 'id'
                        ? 'Apakah Anda yakin ingin mengatur ulang asisten pengaturan? Anda harus mengulangi langkah pemilihan bahasa, mazhab, dan gaya shalat.'
                        : lang == 'ru'
                            ? 'Вы уверены, что хотите сбросить мастер настройки? Вам нужно будет повторить шаги выбора языка, мазхаба и стиля молитвы.'
                            : lang == 'it'
                                ? 'Sei sicuro di voler ripristinare la procedura guidata di configurazione? Dovrai ripetere i passaggi per la selezione di lingua, scuola e stile di preghiera.'
                                : lang == 'ur'
                                    ? 'کیا آپ واقعی سیٹ اپ وزرڈ کو دوبارہ ترتیب دینا چاہتے ہیں؟ آپ کو زبان، مکتب فکر اور نماز کے طریقے کے انتخاب کے مراحل دوبارہ کرنے ہوں گے۔'
                                    : 'Are you sure you want to reset the setup wizard? You will need to redo the language, school, and prayer style selection steps.';
    final cancelLabel = lang == 'tr' ? 'Vazgeç' : lang == 'de' ? 'Abbrechen' : lang == 'fr' ? 'Annuler' : lang == 'es' ? 'Cancelar' : lang == 'id' ? 'Batal' : lang == 'ru' ? 'Отмена' : lang == 'it' ? 'Annulla' : lang == 'ur' ? 'منسوخ کریں' : 'Cancel';
    final confirmLabel = lang == 'tr' ? 'Evet, Sıfırla' : lang == 'de' ? 'Ja, zurücksetzen' : lang == 'fr' ? 'Oui, réinitialiser' : lang == 'es' ? 'Sí, restablecer' : lang == 'id' ? 'Ya, Setel Ulang' : lang == 'ru' ? 'Да, сбросить' : lang == 'it' ? 'Sì, ripristina' : lang == 'ur' ? 'ہاں، دوبارہ ترتیب دیں' : 'Yes, Reset';
    final wizardResetSnack = lang == 'tr'
        ? 'Sihirbaz sıfırlandı. Ana sekmeden adımları tekrar geçebilirsiniz.'
        : lang == 'de'
            ? 'Assistent zurückgesetzt. Sie können die Schritte von der Hauptregisterkarte aus erneut durchführen.'
            : lang == 'fr'
                ? 'Assistant réinitialisé. Vous pouvez refaire les étapes depuis l\'onglet principal.'
                : lang == 'es'
                    ? 'Asistente restablecido. Puede volver a realizar los pasos desde la pestaña principal.'
                    : lang == 'id'
                        ? 'Asisten diatur ulang. Anda dapat melalui langkah-langkah lagi dari tab utama.'
                        : lang == 'ru'
                            ? 'Мастер сброшен. Вы можете снова пройти шаги на главной вкладке.'
                            : lang == 'it'
                                ? 'Procedura guidata ripristinata. Puoi ripetere i passaggi dalla scheda principale.'
                                : lang == 'ur'
                                    ? 'وزرڈ دوبارہ ترتیب دیا گیا۔ آپ مرکزی ٹیب سے دوبارہ مراحل سے گزر سکتے ہیں۔'
                                    : 'Wizard reset. You can go through the steps again from the main tab.';
    final okLabel = lang == 'tr' ? 'Tamam' : lang == 'de' ? 'OK' : lang == 'fr' ? 'D\'accord' : lang == 'es' ? 'Aceptar' : lang == 'id' ? 'OKE' : lang == 'ru' ? 'ОК' : lang == 'it' ? 'OK' : lang == 'ur' ? 'ٹھیک ہے' : 'OK';

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ── Section 0: Language ──
          _buildSectionHeader(languageHeader, isDark),
          _buildSettingsCard(
            context,
            title: lang == 'tr' ? 'Uygulama Dili' : lang == 'de' ? 'App-Sprache' : lang == 'fr' ? 'Langue de l\'application' : lang == 'es' ? 'Idioma de la aplicación' : lang == 'id' ? 'Bahasa Aplikasi' : lang == 'ru' ? 'Язык приложения' : lang == 'it' ? 'Lingua dell\'app' : lang == 'ur' ? 'ایپ کی زبان' : 'App Language',
            description: lang == 'tr' ? 'Arayüz dili ve namaz kılavuzları seçtiğiniz dilde gösterilir.' : lang == 'de' ? 'Die Benutzeroberfläche und Gebetsanleitungen werden in der ausgewählten Sprache angezeigt.' : lang == 'fr' ? 'L\'interface et les guides de prière s\'affichent dans la langue choisie.' : lang == 'es' ? 'La interfaz y las guías de oración se muestran en el idioma seleccionado.' : lang == 'id' ? 'Antarmuka dan panduan shalat ditampilkan dalam bahasa yang dipilih.' : lang == 'ru' ? 'Интерфейс и руководства по молитве отображаются на выбранном языке.' : lang == 'it' ? 'L\'interfaccia e le guide di preghiera sono mostrate nella lingua selezionata.' : lang == 'ur' ? 'انٹرفیس اور نماز کی گائیڈز منتخب زبان میں دکھائی گئی ہیں۔' : 'The interface and prayer guides are shown in the selected language.',
            icon: Icons.language_outlined,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildLangChip('tr', 'Türkçe 🇹🇷', lang, provider),
                _buildLangChip('en', 'English 🇬🇧', lang, provider),
                _buildLangChip('de', 'Deutsch 🇩🇪', lang, provider),
                _buildLangChip('fr', 'Français 🇫🇷', lang, provider),
                _buildLangChip('es', 'Español 🇪🇸', lang, provider),
                _buildLangChip('id', 'Indonesia 🇮🇩', lang, provider),
                _buildLangChip('ru', 'Русский 🇷🇺', lang, provider),
                _buildLangChip('it', 'Italiano 🇮🇹', lang, provider),
                _buildLangChip('ur', 'اردو 🇵🇰', lang, provider),
              ],
            ),
            isDark: isDark,
          ),
          const SizedBox(height: 24),

          // ── Section 1: Learning Profile ──
          _buildSectionHeader(profileHeader, isDark),

          // Mezhep Card Selection
          _buildSettingsCard(
            context,
            title: mezTitle,
            description: mezDesc,
            icon: Icons.mosque_outlined,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildChoiceButton(
                        label: Mezhep.hanafi.getLocalizedName(lang),
                        isSelected: provider.selectedMezhep == Mezhep.hanafi,
                        onTap: () => provider.setSelectedMezhep(Mezhep.hanafi),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildChoiceButton(
                        label: Mezhep.shafii.getLocalizedName(lang),
                        isSelected: provider.selectedMezhep == Mezhep.shafii,
                        onTap: () => provider.setSelectedMezhep(Mezhep.shafii),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildChoiceButton(
                        label: Mezhep.maliki.getLocalizedName(lang),
                        isSelected: provider.selectedMezhep == Mezhep.maliki,
                        onTap: () => provider.setSelectedMezhep(Mezhep.maliki),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildChoiceButton(
                        label: Mezhep.hanbali.getLocalizedName(lang),
                        isSelected: provider.selectedMezhep == Mezhep.hanbali,
                        onTap: () => provider.setSelectedMezhep(Mezhep.hanbali),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            isDark: isDark,
          ),
          const SizedBox(height: 16),

          // Gender Card Selection
          _buildSettingsCard(
            context,
            title: genderTitle,
            description: genderDesc,
            icon: Icons.people_outline,
            child: Row(
              children: [
                Expanded(
                  child: _buildChoiceButton(
                    label: maleLabel,
                    isSelected: provider.selectedGender == Gender.male,
                    onTap: () => provider.setSelectedGender(Gender.male),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildChoiceButton(
                    label: femaleLabel,
                    isSelected: provider.selectedGender == Gender.female,
                    onTap: () => provider.setSelectedGender(Gender.female),
                  ),
                ),
              ],
            ),
            isDark: isDark,
          ),
          const SizedBox(height: 24),

          // ── Section 2: System Settings ──
          _buildSectionHeader(systemHeader, isDark),

          // 1. Reminders
          _buildMockupTile(
            context,
            title: remindersLabel,
            subtitle: remindersSub,
            icon: Icons.alarm_on_outlined,
            onTap: () => _showComingSoonDialog(context, remindersLabel, okLabel),
            isDark: isDark,
          ),

          // 2. Notifications & Ezan
          _buildMockupTile(
            context,
            title: notifLabel,
            subtitle: notifSub,
            icon: Icons.notifications_active_outlined,
            onTap: () => NotificationSettingsSheet.show(context),
            isDark: isDark,
          ),

          // 3. Theme (Active toggle!)
          _buildMockupTile(
            context,
            title: themeLabel,
            subtitle: themeSub,
            icon: Icons.brightness_medium_outlined,
            onTap: () => provider.toggleTheme(),
            isDark: isDark,
          ),

          // 4. Backup
          _buildMockupTile(
            context,
            title: backupLabel,
            subtitle: backupSub,
            icon: Icons.backup_outlined,
            onTap: () => _showComingSoonDialog(context, backupLabel, okLabel),
            isDark: isDark,
          ),

          // 5. About
          _buildMockupTile(
            context,
            title: aboutLabel,
            subtitle: aboutSub,
            icon: Icons.info_outline,
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: lang == 'tr' ? 'Namazı Öğreniyorum' : lang == 'id' ? 'Belajar Shalat' : lang == 'ru' ? 'Учусь молиться' : lang == 'it' ? 'Impara a pregare' : lang == 'ur' ? 'نماز سیکھیں' : 'Learn to Pray',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.mosque, color: AppColors.premiumGold, size: 40),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(aboutContent),
                  )
                ],
              );
            },
            isDark: isDark,
          ),

          // 6. Rate
          _buildMockupTile(
            context,
            title: rateLabel,
            subtitle: rateSub,
            icon: Icons.star_border_outlined,
            onTap: () => _showComingSoonDialog(context, rateLabel, okLabel),
            isDark: isDark,
          ),

          // 7. Reset Wizard
          _buildMockupTile(
            context,
            title: wizardLabel,
            subtitle: wizardSub,
            icon: Icons.refresh_outlined,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    title: Text(wizardConfirmTitle),
                    content: Text(wizardConfirmBody),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(ctx).pop(),
                        child: Text(cancelLabel, style: const TextStyle(color: Colors.grey)),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          provider.setSetupCompleted(false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(wizardResetSnack),
                              backgroundColor: AppColors.emeraldGreen,
                            ),
                          );
                        },
                        child: Text(confirmLabel, style: const TextStyle(color: Colors.red)),
                      ),
                    ],
                  );
                },
              );
            },
            isDark: isDark,
          ),
          _buildRateAppButton(context, lang, isDark),
          _buildPrivacyPolicyButton(context, lang, isDark),
          const SizedBox(height: 30),

        ],
      ),
    );
  }

  Widget _buildLangChip(String code, String label, String currentLang, AppProvider provider) {
    final isSelected = currentLang == code;
    return GestureDetector(
      onTap: () => provider.setLanguageCode(code),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.emeraldGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.emeraldGreen : Colors.grey.withOpacity(0.3),
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 4),
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

  Widget _buildSettingsCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Widget child,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.champagneGold.withOpacity(0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.premiumGold, size: 22),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14.5),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: TextStyle(
              fontSize: 11.5,
              color: isDark ? Colors.white60 : Colors.black54,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildChoiceButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.premiumGold : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.premiumGold : Colors.grey.withOpacity(0.3),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: isSelected ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildMockupTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      color: isDark ? AppColors.darkSurface : Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: isDark ? Colors.white10 : Colors.grey.shade100),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.premiumGold.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.premiumGold, size: 20),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            subtitle,
            style: const TextStyle(fontSize: 11.5, color: Colors.grey),
          ),
        ),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey, size: 20),
        onTap: onTap,
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context, String title, String okLabel) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        content: Text('"$title" özelliği bir sonraki güncellemede aktif olacaktır.'),
        actions: [
          TextButton(
            child: Text(okLabel, style: const TextStyle(color: AppColors.emeraldGreen, fontWeight: FontWeight.bold)),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
  Widget _buildRateAppButton(BuildContext context, String lang, bool isDark) {
    final isIos = Platform.isIOS;
    final storeName = isIos ? 'App Store' : 'Play Store';
    final rateTitle = lang == 'tr'
        ? (isIos ? 'Uygulamayı Puanla (App Store)' : 'Uygulamayı Puanla (5 Yıldız Ver)')
        : lang == 'en'
            ? (isIos ? 'Rate the App (App Store)' : 'Rate the App (Give 5 Stars)')
            : lang == 'de'
                ? 'App bewerten ($storeName)'
                : lang == 'fr'
                    ? 'Noter l\'application ($storeName)'
                    : lang == 'es'
                        ? 'Calificar la aplicación ($storeName)'
                        : lang == 'id'
                            ? 'Beri Nilai Aplikasi ($storeName)'
                            : lang == 'ru'
                                ? 'Оценить приложение ($storeName)'
                                : lang == 'it'
                                    ? 'Valuta l\'app ($storeName)'
                                    : lang == 'ur'
                                        ? 'ایپ کی درجہ بندی کریں ($storeName)'
                                        : 'Rate the App ($storeName)';

    final rateSub = lang == 'tr'
        ? 'Bize destek olmak için $storeName\'da puan verin.'
        : lang == 'en'
            ? 'Support us by rating on the $storeName.'
            : lang == 'de'
                ? 'Unterstützen Sie uns durch eine Bewertung im $storeName.'
                : lang == 'fr'
                    ? 'Soutenez-nous en notant sur $storeName.'
                    : lang == 'es'
                        ? 'Apóyanos calificando en $storeName.'
                        : lang == 'id'
                            ? 'Dukung kami dengan memberi peringkat di $storeName.'
                            : lang == 'ru'
                                ? 'Поддержите нас, оценив приложение в $storeName.'
                                : lang == 'it'
                                    ? 'Supportaci valutando su $storeName.'
                                    : lang == 'ur'
                                        ? '$storeName پر درجہ بندی کرکے ہماری مدد کریں۔'
                                        : 'Support us by rating on the $storeName.';
    
    return _buildMockupTile(
      context,
      title: rateTitle,
      subtitle: rateSub,
      icon: Icons.star_rate_rounded,
      onTap: () async {
        final url = isIos
            ? Uri.parse('https://apps.apple.com/app/namaz%C4%B1-%C3%B6%C4%9Freniyorum/id6737516890')
            : Uri.parse('https://play.google.com/store/apps/details?id=com.omerkr.namaz_ogreniyorum');
        try {
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        } catch (e) {
          debugPrint('Could not launch $url');
        }
      },
      isDark: isDark,
    );
  }

  Widget _buildPrivacyPolicyButton(BuildContext context, String lang, bool isDark) {
    final title = lang == 'tr'
        ? 'Gizlilik Politikası'
        : lang == 'en'
            ? 'Privacy Policy'
            : lang == 'de'
                ? 'Datenschutzerklärung'
                : lang == 'fr'
                    ? 'Politique de confidentialité'
                    : lang == 'es'
                        ? 'Política de privacidad'
                        : lang == 'id'
                            ? 'Kebijakan Privasi'
                            : lang == 'ru'
                                ? 'Политика конфиденциальности'
                                : lang == 'it'
                                    ? 'Informativa sulla privacy'
                                    : lang == 'ur'
                                        ? 'رازداری کی پالیسی'
                                        : 'Privacy Policy';

    final sub = lang == 'tr'
        ? 'Veri güvenliği ve gizlilik şartlarımızı inceleyin.'
        : lang == 'en'
            ? 'Review our data security and privacy terms.'
            : lang == 'de'
                ? 'Erfahren Sie mehr über Datensicherheit.'
                : lang == 'fr'
                    ? 'Consultez nos conditions de confidentialité.'
                    : lang == 'es'
                        ? 'Consulte nuestras condiciones de privacidad.'
                        : lang == 'id'
                            ? 'Tinjau ketentuan privasi kami.'
                            : lang == 'ru'
                                ? 'Ознакомьтесь с политикой конфиденциальности.'
                                : lang == 'it'
                                    ? 'Leggi i nostri termini sulla privacy.'
                                    : lang == 'ur'
                                        ? 'ڈیٹا سیکیورٹی شرائط دیکھیں۔'
                                        : 'Review our privacy terms.';

    return _buildMockupTile(
      context,
      title: title,
      subtitle: sub,
      icon: Icons.privacy_tip_outlined,
      onTap: () async {
        final url = Uri.parse('https://omerkarabalik.github.io/namaz-ogreniyorum/privacy-policy.html');
        try {
          if (await canLaunchUrl(url)) {
            await launchUrl(url, mode: LaunchMode.externalApplication);
          }
        } catch (e) {
          debugPrint('Could not launch $url');
        }
      },
      isDark: isDark,
    );
  }

}
