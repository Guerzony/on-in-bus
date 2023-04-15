import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'firestore_serializable.dart';

part 'stop.g.dart';

@firestoreSerializable
class Stop {
  Stop({
    required this.name,
    required this.location,
  });

  final String name;
  final GeoPoint? location;

  factory Stop.fromJson(Map<String, Object?> json) => _$StopFromJson(json);
  Map<String, Object?> toJson() => _$StopToJson(this);
}

@Collection<Stop>('stops')
final stopsRef = StopCollectionReference();