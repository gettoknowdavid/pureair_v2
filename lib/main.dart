import 'package:flutter/material.dart';
import 'package:pureair_v2/app/app.dart';

import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  runApp(const PureAirApp());
}
