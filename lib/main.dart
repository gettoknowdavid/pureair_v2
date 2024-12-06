import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/app.dart';
import 'package:pureair_v2/firebase_options.dart';
import 'package:pureair_v2/src/services/objectbox_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final objectbox = await Objectbox.create();
  runApp(
    ProviderScope(
      overrides: [objectboxProvider.overrideWithValue(objectbox)],
      child: const PureAirApp(),
    ),
  );
}
