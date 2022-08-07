import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LatLngMidpoint on LatLng {
  static LatLng from(LatLng a, LatLng b) {
    final lat = (a.latitude + b.latitude) / 2;
    final lng = (a.longitude + b.longitude) / 2;
    return LatLng(lat, lng);
  }
}

extension LatLngDistance on LatLng {
  double distanceFrom(LatLng other) {
    return Geolocator.distanceBetween(latitude, longitude, other.latitude, other.longitude);
  }
}
