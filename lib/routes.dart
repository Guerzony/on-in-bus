import 'package:flutter/material.dart';
import 'package:on_in_bus/pages/home.dart';
import 'package:on_in_bus/pages/login.dart';
import 'package:on_in_bus/pages/register.dart';
import 'package:on_in_bus/widgets/bus_dialog.dart';

final Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => const LoginPage(),
  '/home': (BuildContext context) => const HomePage(),
  '/bus': (BuildContext context) => const BusDialog(),
  '/register': (BuildContext context) => const RegisterPage(),
};
