import 'package:firebase_auth/firebase_auth.dart';
import 'package:on_in_bus/data/user.dart';
import 'package:on_in_bus/utils/pair.dart';

final _auth = FirebaseAuth.instance;
typedef UserWithData = Pair<User, UserData>;

Stream<UserWithData?> userDataStream() async* {
  await for (final authState in _auth.authStateChanges()) {
    if (authState == null) yield null;
    yield* usersRef.doc(authState!.uid).snapshots().map((snapshot) {
      if (snapshot.data == null) return null;
      return Pair(authState, snapshot.data!);
    });
  }
}
