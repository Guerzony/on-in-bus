import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:on_in_bus/data/firestore_serializable.dart';

part 'bus.g.dart';

@firestoreSerializable
class Bus {
  Bus({
    required this.name,
    required this.price,
    required this.points,
  });

  final String name;
  final double price;
  final List<GeoPoint> points;

  factory Bus.fromJson(Map<String, Object?> json) => _$BusFromJson(json);
  Map<String, Object?> toJson() => _$BusToJson(this);
}

@Collection<Bus>('buses')
final busesRef = BusCollectionReference();
