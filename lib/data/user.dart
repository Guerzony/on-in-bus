import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:on_in_bus/data/firestore_serializable.dart';

part 'user.g.dart';

@firestoreSerializable
class UserData {
  UserData({
    this.isAdmin = false,
  });

  final bool isAdmin;

  Map<String, Object?> toJson() => _$UserDataToJson(this);
}

@Collection<UserData>('users')
final usersRef = UserDataCollectionReference();
