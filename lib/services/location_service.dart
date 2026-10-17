import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class UserPosition {
  final double latitude;
  final double longitude;
  final String cityName;

  const UserPosition({
    required this.latitude,
    required this.longitude,
    required this.cityName,
  });
}

class LocationService {
  /// Safely get current location or fallback
  static Future<UserPosition?> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        debugPrint('Location services are disabled.');
        return null;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          debugPrint('Location permissions are denied');
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        debugPrint('Location permissions are permanently denied.');
        return null;
      }

      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.medium,
          timeLimit: Duration(seconds: 10),
        ),
      );

      return UserPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        cityName: 'Konumunuz',
      );
    } catch (e) {
      debugPrint('Error getting location: $e');
      return null;
    }
  }
}
