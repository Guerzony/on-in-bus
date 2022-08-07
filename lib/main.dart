import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:on_in_bus/firebase_options.dart';
import 'package:on_in_bus/routes.dart';

final _auth = FirebaseAuth.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Location.instance.requestPermission();
  await Location.instance.requestService();

  runApp(OnInBusApp(
    isLoggedIn: _auth.currentUser != null,
  ));
}

class OnInBusApp extends StatelessWidget {
  const OnInBusApp({Key? key, this.isLoggedIn = false}) : super(key: key);

  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      routes: router,
      initialRoute: isLoggedIn ? '/home' : '/',
    );
  }
}
