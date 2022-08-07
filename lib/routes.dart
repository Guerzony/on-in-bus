import 'package:flutter/material.dart';
import 'package:on_in_bus/pages/home.dart';
import 'package:on_in_bus/widgets/bus_dialog.dart';

final Map<String, WidgetBuilder> router = {
  '/': (BuildContext context) => const HomePage(),
  '/bus': (BuildContext context) => const BusDialog(),
};
