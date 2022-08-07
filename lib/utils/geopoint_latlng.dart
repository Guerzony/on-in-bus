import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

extension GeoPointToLatLng on GeoPoint {
  LatLng get latlng => LatLng(latitude, longitude);
}

extension LatLngToGeoPoint on LatLng {
  GeoPoint get geoPoint => GeoPoint(latitude, longitude);
}
