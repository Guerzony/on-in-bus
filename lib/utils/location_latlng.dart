import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

extension LocationToLatLng on LocationData {
  LatLng? get latlng {
    final lat = latitude;
    final lng = longitude;
    return lat != null && lng != null ? LatLng(lat, lng) : null;
  }
}
