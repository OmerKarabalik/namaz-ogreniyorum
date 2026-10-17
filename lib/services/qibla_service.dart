import 'dart:math';

class QiblaService {
  static const double kaabaLat = 21.4225137;
  static const double kaabaLng = 39.8261681;

  /// Calculate Qibla bearing/heading angle in degrees (0..360) from North
  static double calculateQiblaAngle(double lat, double lng) {
    double phi1 = lat * pi / 180;
    double phi2 = kaabaLat * pi / 180;
    double deltaLambda = (kaabaLng - lng) * pi / 180;

    double y = sin(deltaLambda);
    double x = cos(phi1) * tan(phi2) - sin(phi1) * cos(deltaLambda);
    double qiblaRad = atan2(y, x);

    double qiblaDeg = qiblaRad * 180 / pi;
    return (qiblaDeg + 360) % 360;
  }

  /// Calculate Haversine distance to Kaaba in Kilometers
  static double calculateDistanceToKaabaKm(double lat, double lng) {
    const double earthRadiusKm = 6371.0;

    double dLat = (kaabaLat - lat) * pi / 180;
    double dLng = (kaabaLng - lng) * pi / 180;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat * pi / 180) * cos(kaabaLat * pi / 180) * sin(dLng / 2) * sin(dLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadiusKm * c;
  }
}
