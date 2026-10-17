import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/theme.dart';
import '../providers/app_provider.dart';
import '../services/prayer_times_service.dart';
import '../services/location_service.dart';

class LocationSelectionSheet extends StatefulWidget {
  const LocationSelectionSheet({super.key});

  static Future<bool?> show(BuildContext context) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const LocationSelectionSheet(),
    );
  }

  @override
  State<LocationSelectionSheet> createState() => _LocationSelectionSheetState();
}

class _LocationSelectionSheetState extends State<LocationSelectionSheet> {
  String _searchQuery = '';
  bool _isLoadingGps = false;

  List<CityLocation> get _filteredCities {
    if (_searchQuery.trim().isEmpty) {
      return PrayerTimesService.defaultCities;
    }
    final q = _searchQuery.toLowerCase().trim();
    return PrayerTimesService.defaultCities.where((c) {
      return c.name.toLowerCase().contains(q) || c.country.toLowerCase().contains(q);
    }).toList();
  }

  Future<void> _selectGps(AppProvider provider) async {
    setState(() => _isLoadingGps = true);
    final pos = await LocationService.getCurrentLocation();
    if (mounted) {
      setState(() => _isLoadingGps = false);
      if (pos != null) {
        await provider.setUserLocation(
          lat: pos.latitude,
          lng: pos.longitude,
          cityName: 'Mevcut Konum (GPS)',
          isGps: true,
        );
        Navigator.of(context).pop(true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              provider.languageCode == 'tr'
                  ? 'GPS konumu alınamadı. Lütfen listeden bir şehir seçin.'
                  : 'Could not get GPS location. Please select a city from the list.',
            ),
            backgroundColor: Colors.red.shade700,
          ),
        );
      }
    }
  }

  Future<void> _selectCity(AppProvider provider, CityLocation city) async {
    Navigator.of(context).pop(true);
    provider.setUserLocation(
      lat: city.latitude,
      lng: city.longitude,
      cityName: city.name,
      isGps: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    final lang = provider.languageCode;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final sheetTitle = lang == 'tr' ? 'Konumunuzu Seçin' : lang == 'de' ? 'Wählen Sie Ihren Standort' : lang == 'fr' ? 'Choisissez votre emplacement' : lang == 'es' ? 'Selecciona tu ubicación' : lang == 'id' ? 'Pilih Lokasi Anda' : lang == 'ru' ? 'Выберите ваше местоположение' : lang == 'it' ? 'Seleziona la tua posizione' : lang == 'ur' ? 'اپنا مقام منتخب کریں' : 'Select Your Location';
    final searchHint = lang == 'tr' ? 'Şehir veya ülke ara...' : lang == 'de' ? 'Stadt oder Land suchen...' : lang == 'fr' ? 'Rechercher ville ou pays...' : lang == 'es' ? 'Buscar ciudad o país...' : lang == 'id' ? 'Cari kota atau negara...' : lang == 'ru' ? 'Поиск города или страны...' : lang == 'it' ? 'Cerca città o paese...' : lang == 'ur' ? 'شہر یا ملک تلاش کریں...' : 'Search city or country...';
    final autoGpsLabel = lang == 'tr' ? 'Otomatik Konum (GPS)' : lang == 'de' ? 'Automatischer Standort (GPS)' : lang == 'fr' ? 'Emplacement automatique (GPS)' : lang == 'es' ? 'Ubicación automática (GPS)' : lang == 'id' ? 'Lokasi Otomatis (GPS)' : lang == 'ru' ? 'Автоматическое местоположение (GPS)' : lang == 'it' ? 'Posizione automatica (GPS)' : lang == 'ur' ? 'خودکار مقام (GPS)' : 'Auto Location (GPS)';
    final autoGpsDesc = lang == 'tr' ? 'Cihazınızın GPS\'ini kullanarak namaz vakitlerini bulur' : lang == 'de' ? 'Ermittelt Gebetszeiten mit GPS' : lang == 'fr' ? 'Calcule les heures de prière via GPS' : lang == 'es' ? 'Obtiene horarios usando GPS' : lang == 'id' ? 'Mendapatkan jadwal sholat menggunakan GPS' : lang == 'ru' ? 'Определяет время намаза через GPS' : lang == 'it' ? 'Ottiene gli orari tramite GPS' : lang == 'ur' ? 'GPS کا استعمال کرتے ہوئے نماز کے اوقات تلاش کرتا ہے' : 'Calculates prayer times using device GPS';

    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF12221D) : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          // Drag Handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: isDark ? Colors.white24 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),

          // Title & Close
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Icon(Icons.location_on_rounded, color: AppColors.premiumGold, size: 26),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    sheetTitle,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : AppColors.darkEmerald,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.close_rounded, color: isDark ? Colors.white70 : Colors.grey.shade700),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (val) => setState(() => _searchQuery = val),
              style: TextStyle(color: isDark ? Colors.white : Colors.black87),
              decoration: InputDecoration(
                hintText: searchHint,
                hintStyle: TextStyle(color: isDark ? Colors.white38 : Colors.grey.shade500, fontSize: 14),
                prefixIcon: const Icon(Icons.search_rounded, color: AppColors.premiumGold),
                filled: true,
                fillColor: isDark ? Colors.white.withOpacity(0.06) : Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // List Options
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              children: [
                // GPS Card
                InkWell(
                  onTap: _isLoadingGps ? null : () => _selectGps(provider),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF0D47A1), Color(0xFF1976D2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        _isLoadingGps
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                              )
                            : const Icon(Icons.my_location_rounded, color: Colors.white, size: 28),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                autoGpsLabel,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                autoGpsDesc,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.85),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (provider.isGpsActive)
                          const Icon(Icons.check_circle_rounded, color: AppColors.premiumGold, size: 22),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Cities Divider / Title
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                  child: Text(
                    lang == 'tr' ? 'Tüm Şehirler (${_filteredCities.length})' : 'All Cities (${_filteredCities.length})',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white54 : Colors.grey.shade600,
                    ),
                  ),
                ),

                // City List Items
                ..._filteredCities.map((city) {
                  final isSelected = !provider.isGpsActive && provider.userCityName.toLowerCase() == city.name.toLowerCase();
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? (isDark ? AppColors.darkEmerald.withOpacity(0.4) : const Color(0xFFE8F5E9))
                          : (isDark ? Colors.white.withOpacity(0.04) : Colors.grey.shade50),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.premiumGold
                            : (isDark ? Colors.white10 : Colors.grey.shade200),
                        width: isSelected ? 1.5 : 1,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                      leading: CircleAvatar(
                        radius: 18,
                        backgroundColor: isDark ? Colors.white10 : AppColors.lightBg,
                        child: Text(
                          city.country.substring(0, 1).toUpperCase(),
                          style: TextStyle(
                            color: isDark ? AppColors.premiumGold : AppColors.darkEmerald,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      title: Text(
                        city.name,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                          fontSize: 15,
                          color: isSelected
                              ? AppColors.premiumGold
                              : (isDark ? Colors.white : Colors.black87),
                        ),
                      ),
                      subtitle: Text(
                        city.country,
                        style: TextStyle(
                          fontSize: 12,
                          color: isDark ? Colors.white54 : Colors.grey.shade600,
                        ),
                      ),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded, color: AppColors.premiumGold, size: 22)
                          : const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Colors.grey),
                      onTap: () => _selectCity(provider, city),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
