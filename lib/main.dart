import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pureair_v2/app/app.dart';

import 'injector/injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  
  configureDependencies();

  runApp(const PureAirApp());
}
