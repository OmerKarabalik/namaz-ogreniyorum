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

  static const String appVersionName = '1.0.27';
  static const String appBuildNumber = '29';
  static const String androidPackageId = 'com.omrkr.namaz.ogreniyorum.app';
  static const String iosAppId = '6737516890';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final isDark = provider.isDarkMode;
    final lang = provider.languageCode;

    // ──── Localized headers ────
    final profileHeader = lang == 'tr'
        ? 'Eğitim Profili'
        : lang == 'de'
            ? 'Lernprofil'
            : lang == 'fr'
                ? 'Profil d\'apprentissage'
                : lang == 'es'
                    ? 'Perfil de aprendizaje'
                    : lang == 'id'
                        ? 'Profil Belajar'
                        : lang == 'ru'
                            ? 'Профиль обучения'
                            : lang == 'it'
                                ? 'Profilo di apprendimento'
                                : lang == 'ur'
                                    ? 'سیکھنے کا پروفائل'
                                    : 'Learning Profile';

    final systemHeader = lang == 'tr'
        ? 'Sistem ve Uygulama Ayarları'
        : lang == 'de'
            ? 'System- & App-Einstellungen'
            : lang == 'fr'
                ? 'Paramètres système et application'
                : lang == 'es'
                    ? 'Configuración del sistema'
                    : lang == 'id'
                        ? 'Pengaturan Sistem'
                        : lang == 'ru'
                            ? 'Системные настройки'
                            : lang == 'it'
                                ? 'Impostazioni di sistema'
                                : lang == 'ur'
                                    ? 'سسٹم کی ترتیبات'
                                    : 'System Settings';

    final languageHeader = lang == 'tr'
        ? 'Dil / Language'
        : lang == 'id'
            ? 'Bahasa / Language'
            : lang == 'ru'
                ? 'Язык / Language'
                : lang == 'it'
                    ? 'Lingua / Language'
                    : lang == 'ur'
                        ? 'زبان / Language'
                        : 'Language / Dil';

    // ──── Localized items ────
    final mezTitle = lang == 'tr'
        ? 'Fıkıh Mezhebi'
        : lang == 'de'
            ? 'Rechtsschule (Mezhep)'
            : lang == 'fr'
                ? 'École juridique (Mezhep)'
                : lang == 'es'
                    ? 'Escuela jurídica (Mezhep)'
                    : lang == 'id'
                        ? 'Mazhab Fiqh'
                        : lang == 'ru'
                            ? 'Школа юриспруденции (Мазхаб)'
                            : lang == 'it'
                                ? 'Scuola di Giurisprudenza (Madhhab)'
                                : lang == 'ur'
                                    ? 'فقہی مکتب فکر'
                                    : 'School of Jurisprudence';

    final mezDesc = lang == 'tr'
        ? 'Namaz rekatları ve duaları seçtiğiniz mezhebe göre uyarlanır.'
        : lang == 'de'
            ? 'Gebetsrakats und Bittgebete passen sich der ausgewählten Rechtsschule an.'
            : lang == 'fr'
                ? 'Les rakats de prière et les invocations s\'adaptent à l\'école choisie.'
                : lang == 'es'
                    ? 'Los rakats de oración y súplicas se adaptan a la escuela seleccionada.'
                    : lang == 'id'
                        ? 'Rakaat shalat dan doa disesuaikan dengan mazhab yang dipilih.'
                        : lang == 'ru'
                            ? 'Ракааты молитвы и молитвы адаптируются в зависимости от выбранной школы.'
                            : lang == 'it'
                                ? 'I rakat della preghiera e le suppliche sono adattati in base alla scuola selezionata.'
                                : lang == 'ur'
                                    ? 'نماز کی رکعات اور دعائیں منتخب کردہ مکتب فکر کے مطابق تیار کی گئی ہیں۔'
                                    : 'Prayer rakats and supplications are adapted according to the selected school.';

    final genderTitle = lang == 'tr'
        ? 'Kılınış Şekli (Cinsiyet)'
        : lang == 'de'
            ? 'Gebetsweise (Geschlecht)'
            : lang == 'fr'
                ? 'Mode de prière (Sexe)'
                : lang == 'es'
                    ? 'Estilo de oración (Género)'
                    : lang == 'id'
                        ? 'Gaya Shalat (Gender)'
                        : lang == 'ru'
                            ? 'Стиль молитвы (Пол)'
                            : lang == 'it'
                                ? 'Stile di preghiera (Genere)'
                                : lang == 'ur'
                                    ? 'نماز کا طریقہ (صنف)'
                                    : 'Prayer Style (Gender)';

    final genderDesc = lang == 'tr'
        ? 'Duruşlar ve el bağlama kuralları seçtiğiniz kılınışa göre değişir.'
        : lang == 'de'
            ? 'Körperhaltungen und Handregeln ändern sich je nach gewählter Gebetsweise.'
            : lang == 'fr'
                ? 'Les postures et les règles de position des mains changent selon le mode choisi.'
                : lang == 'es'
                    ? 'Las posturas y reglas de posición de manos cambian según el estilo elegido.'
                    : lang == 'id'
                        ? 'Postur dan aturan posisi tangan berubah sesuai dengan gaya shalat yang dipilih.'
                        : lang == 'ru'
                            ? 'Позы и правила положения рук меняются в зависимости от выбранного стиля молитвы.'
                            : lang == 'it'
                                ? 'Le posture e le regole di posizionamento delle mani cambiano in base allo stile di preghiera selezionato.'
                                : lang == 'ur'
                                    ? 'منتخب کردہ نماز کے طریقے کی بنیاد پر کرنسیوں اور ہاتھ کی پوزیشن کے اصول تبدیل ہوتے ہیں۔'
                                    : 'Postures and hand positioning rules change based on the selected prayer style.';

    final maleLabel = lang == 'tr'
        ? 'Erkek'
        : lang == 'de'
            ? 'Mann'
            : lang == 'fr'
                ? 'Homme'
                : lang == 'es'
                    ? 'Hombre'
                    : lang == 'id'
                        ? 'Laki-laki'
                        : lang == 'ru'
                            ? 'Мужчина'
                            : lang == 'it'
                                ? 'Uomo'
                                : lang == 'ur'
                                    ? 'مرد'
                                    : 'Male';

    final femaleLabel = lang == 'tr'
        ? 'Kadın'
        : lang == 'de'
            ? 'Frau'
            : lang == 'fr'
                ? 'Femme'
                : lang == 'es'
                    ? 'Mujer'
                    : lang == 'id'
                        ? 'Perempuan'
                        : lang == 'ru'
                            ? 'Женщина'
                            : lang == 'it'
                                ? 'Donna'
                                : lang == 'ur'
                                    ? 'عورت'
                                    : 'Female';

    // Single unified notification title & subtitle (replaces duplicate Hatırlatıcılar & Bildirimler)
    final notifLabel = lang == 'tr'
        ? 'Ezan & Vakit Bildirimleri'
        : lang == 'de'
            ? 'Gebetsruf- & Zeiterinnerungen'
            : lang == 'fr'
                ? 'Alertes Adhan & Horaires de Prière'
                : lang == 'es'
                    ? 'Alertas de Adhān y Horarios'
                    : lang == 'id'
                        ? 'Notifikasi Adzan & Waktu Shalat'
                        : lang == 'ru'
                            ? 'Оповещения об Азане и времени'
                            : lang == 'it'
                                ? 'Notifiche Adhan e Orari'
                                : lang == 'ur'
                                    ? 'اذان اور اوقات کی اطلاعات'
                                    : 'Adhan & Prayer Time Alerts';

    final notifSub = lang == 'tr'
        ? 'Ezan alarm sesleri, vakit bildirimleri ve titreşim ayarları'
        : lang == 'de'
            ? 'Gebetsruftöne, Benachrichtigungen und Vibrationseinstellungen'
            : lang == 'fr'
                ? 'Sons d\'appel à la prière, alertes et vibrations'
                : lang == 'es'
                    ? 'Sonidos de alarma, notificaciones y vibración'
                    : lang == 'id'
                        ? 'Suara adzan, pengingat shalat dan pengaturan getar'
                        : lang == 'ru'
                            ? 'Звуки азана, напоминания и настройки вибрации'
                            : lang == 'it'
                                ? 'Suoni dell\'Adhan, avvisi e vibrazione'
                                : lang == 'ur'
                                    ? 'اذان کی آوازیں اور اطلاع کی ترتیبات'
                                    : 'Adhan alarm sounds, prayer alerts and vibration';

    final themeLabel = lang == 'tr'
        ? 'Tema'
        : lang == 'de'
            ? 'Design'
            : lang == 'fr'
                ? 'Thème'
                : lang == 'es'
                    ? 'Tema'
                    : lang == 'id'
                        ? 'Tema'
                        : lang == 'ru'
                            ? 'Тема'
                            : lang == 'it'
                                ? 'Tema'
                                : lang == 'ur'
                                    ? 'تھیم'
                                    : 'Theme';

    final themeSub = isDark
        ? (lang == 'tr'
            ? 'Karanlık tema aktif'
            : lang == 'de'
                ? 'Dunkles Design aktiv'
                : lang == 'fr'
                    ? 'Thème sombre actif'
                    : lang == 'es'
                        ? 'Tema oscuro activo'
                        : lang == 'id'
                            ? 'Tema gelap aktif'
                            : lang == 'ru'
                                ? 'Темная тема активна'
                                : lang == 'it'
                                    ? 'Tema scuro attivo'
                                    : lang == 'ur'
                                        ? 'ڈارک تھیم فعال ہے'
                                        : 'Dark theme active')
        : (lang == 'tr'
            ? 'Açık tema aktif'
            : lang == 'de'
                ? 'Helles Design aktiv'
                : lang == 'fr'
                    ? 'Thème clair actif'
                    : lang == 'es'
                        ? 'Tema claro activo'
                        : lang == 'id'
                            ? 'Tema terang aktif'
                            : lang == 'ru'
                                ? 'Светлая тема активна'
                                : lang == 'it'
                                    ? 'Tema chiaro attivo'
                                    : lang == 'ur'
                                        ? 'لائٹ تھیم فعال ہے'
                                        : 'Light theme active');

    final backupLabel = lang == 'tr'
        ? 'Yedekle ve Geri Yükle'
        : lang == 'de'
            ? 'Sichern & Wiederherstellen'
            : lang == 'fr'
                ? 'Sauvegarder & Restaurer'
                : lang == 'es'
                    ? 'Copia de seguridad y restaurar'
                    : lang == 'id'
                        ? 'Cadangkan & Pulihkan'
                        : lang == 'ru'
                            ? 'Резервное копирование и восстановление'
                            : lang == 'it'
                                ? 'Backup e ripristino'
                                : lang == 'ur'
                                    ? 'بیک اپ اور بحال'
                                    : 'Backup & Restore';

    final backupSub = lang == 'tr'
        ? 'Verilerinizi güvenle yedekleyin'
        : lang == 'de'
            ? 'Ihre Daten sichern'
            : lang == 'fr'
                ? 'Sauvegarder vos données'
                : lang == 'es'
                    ? 'Hacer una copia de seguridad'
                    : lang == 'id'
                        ? 'Cadangkan data Anda'
                        : lang == 'ru'
                            ? 'Резервное копирование данных'
                            : lang == 'it'
                                ? 'Fai il backup dei tuoi dati'
                                : lang == 'ur'
                                    ? 'اپنے ڈیٹا کا بیک اپ لیں'
                                    : 'Back up your data';

    final aboutLabel = lang == 'tr'
        ? 'Hakkımızda'
        : lang == 'de'
            ? 'Über uns'
            : lang == 'fr'
                ? 'À propos'
                : lang == 'es'
                    ? 'Acerca de'
                    : lang == 'id'
                        ? 'Tentang Kami'
                        : lang == 'ru'
                            ? 'О нас'
                            : lang == 'it'
                                ? 'Informazioni'
                                : lang == 'ur'
                                    ? 'ہمارے بارے میں'
                                    : 'About';

    final aboutSub = lang == 'tr'
        ? 'Namazı Öğreniyorum v$appVersionName ($appBuildNumber)'
        : lang == 'de'
            ? 'App-Details v$appVersionName ($appBuildNumber)'
            : lang == 'fr'
                ? 'Détails de l\'application v$appVersionName ($appBuildNumber)'
                : lang == 'es'
                    ? 'Detalles de la app v$appVersionName ($appBuildNumber)'
                    : lang == 'id'
                        ? 'Informasi Aplikasi v$appVersionName ($appBuildNumber)'
                        : lang == 'ru'
                            ? 'О приложении v$appVersionName ($appBuildNumber)'
                            : lang == 'it'
                                ? 'Informazioni sull\'app v$appVersionName ($appBuildNumber)'
                                : lang == 'ur'
                                    ? 'ایپ کی تفصیلات v$appVersionName ($appBuildNumber)'
                                    : 'App Information v$appVersionName ($appBuildNumber)';

    final wizardLabel = lang == 'tr'
        ? 'Sihirbazı Sıfırla'
        : lang == 'de'
            ? 'Einrichtungsassistent zurücksetzen'
            : lang == 'fr'
                ? 'Réinitialiser l\'assistant'
                : lang == 'es'
                    ? 'Restablecer el asistente'
                    : lang == 'id'
                        ? 'Setel Ulang Asisten'
                        : lang == 'ru'
                            ? 'Сбросить мастера'
                            : lang == 'it'
                                ? 'Ripristina procedura guidata'
                                : lang == 'ur'
                                    ? 'وزرڈ کو دوبارہ ترتیب دیں'
                                    : 'Reset Wizard';

    final wizardSub = lang == 'tr'
        ? 'İlk adım seçim kılavuzunu yeniden açar'
        : lang == 'de'
            ? 'Öffnet den Einrichtungsassistenten erneut'
            : lang == 'fr'
                ? 'Rouvre le guide de configuration initial'
                : lang == 'es'
                    ? 'Vuelve a abrir la guía de configuración inicial'
                    : lang == 'id'
                        ? 'Buka kembali panduan pengaturan awal'
                        : lang == 'ru'
                            ? 'Вновь открывает начальное руководство по настройке'
                            : lang == 'it'
                                ? 'Riapre la guida alla configurazione iniziale'
                                : lang == 'ur'
                                    ? 'ابتدائی سیٹ اپ گائیڈ کو دوبارہ کھولتا ہے'
                                    : 'Reopens the initial setup guide';

    final wizardConfirmTitle = wizardLabel;
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

    final cancelLabel = lang == 'tr'
        ? 'Vazgeç'
        : lang == 'de'
            ? 'Abbrechen'
            : lang == 'fr'
                ? 'Annuler'
                : lang == 'es'
                    ? 'Cancelar'
                    : lang == 'id'
                        ? 'Batal'
                        : lang == 'ru'
                            ? 'Отмена'
                            : lang == 'it'
                                ? 'Annulla'
                                : lang == 'ur'
                                    ? 'منسوخ کریں'
                                    : 'Cancel';

    final confirmLabel = lang == 'tr'
        ? 'Evet, Sıfırla'
        : lang == 'de'
            ? 'Ja, zurücksetzen'
            : lang == 'fr'
                ? 'Oui, réinitialiser'
                : lang == 'es'
                    ? 'Sí, restablecer'
                    : lang == 'id'
                        ? 'Ya, Setel Ulang'
                        : lang == 'ru'
                            ? 'Да, сбросить'
                            : lang == 'it'
                                ? 'Sì, ripristina'
                                : lang == 'ur'
                                    ? 'ہاں، دوبارہ ترتیب دیں'
                                    : 'Yes, Reset';

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

    final okLabel = lang == 'tr'
        ? 'Tamam'
        : lang == 'de'
            ? 'OK'
            : lang == 'fr'
                ? 'D\'accord'
                : lang == 'es'
                    ? 'Aceptar'
                    : lang == 'id'
                        ? 'OKE'
                        : lang == 'ru'
                            ? 'ОК'
                            : lang == 'it'
                                ? 'OK'
                                : lang == 'ur'
                                    ? 'ٹھیک ہے'
                                    : 'OK';

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // ── Section 0: Language ──
          _buildSectionHeader(languageHeader, isDark),
          _buildSettingsCard(
            context,
            title: lang == 'tr'
                ? 'Uygulama Dili'
                : lang == 'de'
                    ? 'App-Sprache'
                    : lang == 'fr'
                        ? 'Langue de l\'application'
                        : lang == 'es'
                            ? 'Idioma de la aplicación'
                            : lang == 'id'
                                ? 'Bahasa Aplikasi'
                                : lang == 'ru'
                                    ? 'Язык приложения'
                                    : lang == 'it'
                                        ? 'Lingua dell\'app'
                                        : lang == 'ur'
                                            ? 'ایپ کی زبان'
                                            : 'App Language',
            description: lang == 'tr'
                ? 'Arayüz dili ve namaz kılavuzları seçtiğiniz dilde gösterilir.'
                : lang == 'de'
                    ? 'Die Benutzeroberfläche und Gebetsanleitungen werden in der ausgewählten Sprache angezeigt.'
                    : lang == 'fr'
                        ? 'L\'interface et les guides de prière s\'affichent dans la langue choisie.'
                        : lang == 'es'
                            ? 'La interfaz y las guías de oración se muestran en el idioma seleccionado.'
                            : lang == 'id'
                                ? 'Antarmuka dan panduan shalat ditampilkan dalam bahasa yang dipilih.'
                                : lang == 'ru'
                                    ? 'Интерфейс и руководства по молитве отображаются на выбранном языке.'
                                    : lang == 'it'
                                        ? 'L\'interfaccia e le guide di preghiera sono mostrate nella lingua selezionata.'
                                        : lang == 'ur'
                                            ? 'انٹرفیس اور نماز کی گائیڈز منتخب زبان میں دکھائی گئی ہیں۔'
                                            : 'The interface and prayer guides are shown in the selected language.',
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

          // 1. Ezan & Vakit Bildirimleri (Unified & Real)
          _buildMockupTile(
            context,
            title: notifLabel,
            subtitle: notifSub,
            icon: Icons.notifications_active_rounded,
            onTap: () => NotificationSettingsSheet.show(context),
            isDark: isDark,
          ),

          // 2. Theme (Active toggle)
          _buildMockupTile(
            context,
            title: themeLabel,
            subtitle: themeSub,
            icon: isDark ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            onTap: () => provider.toggleTheme(),
            isDark: isDark,
          ),

          // 3. Hakkımızda (Beautiful Dialog with Dynamic Version)
          _buildMockupTile(
            context,
            title: aboutLabel,
            subtitle: aboutSub,
            icon: Icons.info_outline_rounded,
            onTap: () => _showAboutAppDialog(context, lang, isDark),
            isDark: isDark,
          ),

          // 4. Rate the App (Single Working 5-Star Button)
          _buildRateAppButton(context, lang, isDark),

          // 5. Gizlilik Politikası (In-App Compliant Dialog)
          _buildPrivacyPolicyButton(context, lang, isDark),

          // 6. Backup & Restore (Mockup / Cloud feature)
          _buildMockupTile(
            context,
            title: backupLabel,
            subtitle: backupSub,
            icon: Icons.cloud_sync_outlined,
            onTap: () => _showComingSoonDialog(context, backupLabel, okLabel),
            isDark: isDark,
          ),

          // 7. Reset Wizard
          _buildMockupTile(
            context,
            title: wizardLabel,
            subtitle: wizardSub,
            icon: Icons.restart_alt_rounded,
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    title: Text(wizardConfirmTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                        child: Text(confirmLabel, style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  );
                },
              );
            },
            isDark: isDark,
          ),

          const SizedBox(height: 36),
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

  // ──── GORGEOUS CUSTOM ABOUT DIALOG ────
  void _showAboutAppDialog(BuildContext context, String lang, bool isDark) {
    final title = lang == 'tr'
        ? 'Namazı Öğreniyorum'
        : lang == 'id'
            ? 'Belajar Shalat'
            : lang == 'ru'
                ? 'Учусь молиться'
                : lang == 'it'
                    ? 'Impara a pregare'
                    : lang == 'ur'
                        ? 'نماز سیکھیں'
                        : 'Learn Prayer';

    final description = lang == 'tr'
        ? 'Namaz kılmayı, abdest almayı, namaz dualarını ve surelerini sesli okunuşları ve anlamlarıyla beraber en sade ve doğru biçimde öğreten kapsamlı İslam kılavuzunuz.'
        : lang == 'de'
            ? 'Ihre mobile Leitfaden-App, die Ihnen auf einfachste und korrekteste Weise beibringt, wie man betet, Wudu macht und Gebete und Suren mit Aussprache und Bedeutung lernt.'
            : lang == 'fr'
                ? 'Votre application guide mobile pour apprendre la prière, les ablutions, et les sourates avec prononciation et signification.'
                : lang == 'es'
                    ? 'Su aplicación guía móvil para aprender a rezar, hacer el wudu y aprender las súplicas y suras con pronunciación.'
                    : lang == 'id'
                        ? 'Aplikasi panduan seluler Anda untuk belajar shalat, wudhu, dan doa-doa dengan pengucapan dan makna.'
                        : lang == 'ru'
                            ? 'Ваше мобильное руководство по обучению намазу, омовению, сурам и дуа с правильным произношением.'
                            : lang == 'it'
                                ? 'La tua app guida per imparare a pregare, fare il wudu e conoscere le sure e le preghiere.'
                                : lang == 'ur'
                                    ? 'نماز، وضو اور سورتیں سیکھنے کے لیے آپ کی مکمل رہنمائی ایپ۔'
                                    : 'Your comprehensive mobile guide to learning Islamic prayer, ablution, surahs, and supplications.';

    final features = [
      lang == 'tr' ? '🕌 5 Vakit & Nafile Namazlar' : '🕌 5 Daily & Sunnah Prayers',
      lang == 'tr' ? '🔊 Sesli Sureler & Dualar' : '🔊 Audio Surahs & Supplications',
      lang == 'tr' ? '🧭 Hassas Kıble Pusulası' : '🧭 Accurate Qibla Compass',
      lang == 'tr' ? '🔔 Ezan Vakti Hatırlatıcıları' : '🔔 Adhan & Prayer Time Alerts',
      lang == 'tr' ? '📿 Zikirmatik & Esmaül Hüsna' : '📿 Dhikr Counter & Asmaul Husna',
      lang == 'tr' ? '🌍 9 Farklı Dil Desteği' : '🌍 9 Supported Languages',
    ];

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF14242A) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              // App Icon with glowing circular badge
              Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.premiumGold.withOpacity(0.15),
                  border: Border.all(color: AppColors.premiumGold.withOpacity(0.4), width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.premiumGold.withOpacity(0.12),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(Icons.mosque_rounded, size: 42, color: AppColors.premiumGold),
              ),
              const SizedBox(height: 16),

              // Title
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.3,
                  color: isDark ? Colors.white : AppColors.darkEmerald,
                ),
              ),
              const SizedBox(height: 6),

              // Version Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.emeraldGreen.withOpacity(isDark ? 0.25 : 0.12),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.emeraldGreen.withOpacity(0.4), width: 1),
                ),
                child: Text(
                  'v$appVersionName ($appBuildNumber)',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.emeraldGreen,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.5,
                  height: 1.45,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 18),

              // Feature chips grid
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white.withOpacity(0.04) : const Color(0xFFF9F7F1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.champagneGold.withOpacity(0.15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features.map((f) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.5),
                    child: Row(
                      children: [
                        Text(
                          f,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white70 : AppColors.darkEmerald,
                          ),
                        ),
                      ],
                    ),
                  )).toList(),
                ),
              ),
              const SizedBox(height: 18),

              // Spiritual note
              Text(
                lang == 'tr'
                    ? 'Dualarınızda bizi de unutmamanız dileğiyle...\nAllah ibadetlerinizi kabul eylesin.'
                    : 'May Allah accept your prayers and worship.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11.5,
                  fontStyle: FontStyle.italic,
                  color: isDark ? Colors.white54 : Colors.black54,
                ),
              ),
            ],
          ),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.emeraldGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                elevation: 0,
              ),
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                lang == 'tr' ? 'Kapat' : 'Close',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ──── SINGLE WORKING 5-STAR RATE BUTTON ────
  Widget _buildRateAppButton(BuildContext context, String lang, bool isDark) {
    final isIos = Platform.isIOS;
    final storeName = isIos ? 'App Store' : 'Google Play';

    final rateTitle = lang == 'tr'
        ? '5 Yıldız Ver ⭐'
        : lang == 'en'
            ? 'Give 5 Stars ⭐'
            : lang == 'de'
                ? '5 Sterne geben ⭐'
                : lang == 'fr'
                    ? 'Donner 5 étoiles ⭐'
                    : lang == 'es'
                        ? 'Dar 5 estrellas ⭐'
                        : lang == 'id'
                            ? 'Beri 5 Bintang ⭐'
                            : lang == 'ru'
                                ? 'Поставить 5 звезд ⭐'
                                : lang == 'it'
                                    ? 'Lascia 5 stelle ⭐'
                                    : lang == 'ur'
                                        ? '5 ستارے دیں ⭐'
                                        : 'Give 5 Stars ⭐';

    final rateSub = lang == 'tr'
        ? '$storeName üzerinde bizi değerlendirin.'
        : lang == 'en'
            ? 'Review us on $storeName.'
            : lang == 'de'
                ? 'Bewerten Sie uns im $storeName.'
                : lang == 'fr'
                    ? 'Notez-nous sur $storeName.'
                    : lang == 'es'
                        ? 'Califícanos en $storeName.'
                        : lang == 'id'
                            ? 'Beri ulasan di $storeName.'
                            : lang == 'ru'
                                ? 'Оцените нас в $storeName.'
                                : lang == 'it'
                                    ? 'Valutaci su $storeName.'
                                    : lang == 'ur'
                                        ? '$storeName پر جائزہ دیں۔'
                                        : 'Review us on $storeName.';
                                        : 'Support us with a review on $storeName.';

    return _buildMockupTile(
      context,
      title: rateTitle,
      subtitle: rateSub,
      icon: Icons.star_rate_rounded,
      onTap: () async {
        if (isIos) {
          final iosUrl = Uri.parse('https://apps.apple.com/app/namaz%C4%B1-%C3%B6%C4%9Freniyorum/id$iosAppId');
          try {
            await launchUrl(iosUrl, mode: LaunchMode.externalApplication);
          } catch (e) {
            debugPrint('Could not launch App Store: $e');
          }
        } else {
          final marketUri = Uri.parse('market://details?id=$androidPackageId');
          final webUri = Uri.parse('https://play.google.com/store/apps/details?id=$androidPackageId');
          try {
            if (await canLaunchUrl(marketUri)) {
              await launchUrl(marketUri, mode: LaunchMode.externalApplication);
            } else {
              await launchUrl(webUri, mode: LaunchMode.externalApplication);
            }
          } catch (_) {
            try {
              await launchUrl(webUri, mode: LaunchMode.externalApplication);
            } catch (e) {
              debugPrint('Could not launch Play Store: $e');
            }
          }
        }
      },
      isDark: isDark,
    );
  }

  // ──── BEAUTIFUL IN-APP PRIVACY POLICY DIALOG ────
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
      onTap: () => _showPrivacyPolicyDialog(context, lang, isDark),
      isDark: isDark,
    );
  }

  void _showPrivacyPolicyDialog(BuildContext context, String lang, bool isDark) {
    final isTr = lang == 'tr';

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF14242A) : Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.emeraldGreen.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.shield_outlined, color: AppColors.emeraldGreen, size: 22),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                isTr ? 'Gizlilik ve Güvenlik' : 'Privacy & Security',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.darkEmerald,
                ),
              ),
            ),
          ],
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildPrivacySection(
                  icon: Icons.my_location_rounded,
                  title: isTr ? '1. Konum Bilgisi (GPS)' : '1. Location Data (GPS)',
                  body: isTr
                      ? 'Cihazınızın konumu yalnızca bulunduğunuz yerin namaz vakitlerini ve kıble yönünü doğru hesaplamak amacıyla kullanılır. Konum bilginiz hiçbir sunucuya gönderilmez ve kaydedilmez.'
                      : 'Your location is used solely to calculate accurate local prayer times and the Qibla direction. It is processed entirely on-device and never stored or shared.',
                  isDark: isDark,
                ),
                const SizedBox(height: 12),
                _buildPrivacySection(
                  icon: Icons.notifications_none_rounded,
                  title: isTr ? '2. Bildirimler ve Alarmlar' : '2. Notifications & Alarms',
                  body: isTr
                      ? 'Ezan vakti bildirimleri cihazınızın yerel sistem alarmları üzerinden çalışır. İnternet bağlantısına ihtiyaç duymaz.'
                      : 'Adhan and prayer alerts run locally on your device\'s alarm system and do not require external cloud sync.',
                  isDark: isDark,
                ),
                const SizedBox(height: 12),
                _buildPrivacySection(
                  icon: Icons.person_off_outlined,
                  title: isTr ? '3. Kişisel Veriler' : '3. Personal Data',
                  body: isTr
                      ? 'Uygulamamız üyelik veya hesap oluşturma gerektirmez. Ad, soyad, telefon veya e-posta gibi hiçbir kişisel veriniz toplanmaz.'
                      : 'The app requires no account creation or login. No personal identifying information (name, email, or phone) is ever collected.',
                  isDark: isDark,
                ),
                const SizedBox(height: 12),
                _buildPrivacySection(
                  icon: Icons.ads_click_rounded,
                  title: isTr ? '4. Reklamlar' : '4. Advertisements',
                  body: isTr
                      ? 'Uygulamanın ücretsiz sunulabilmesi için Google AdMob standart reklam ilkelerine uygun reklamlar gösterilir.'
                      : 'To keep the application free, standard non-intrusive advertisements are served via Google AdMob adhering to Google policies.',
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              isTr ? 'Anladım' : 'Got It',
              style: const TextStyle(color: AppColors.emeraldGreen, fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrivacySection({
    required IconData icon,
    required String title,
    required String body,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? Colors.white.withOpacity(0.04) : const Color(0xFFFBF9F4),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.champagneGold.withOpacity(0.12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColors.premiumGold),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : AppColors.darkEmerald,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            body,
            style: TextStyle(
              fontSize: 11.5,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
