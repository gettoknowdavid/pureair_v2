import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/routing.dart' show routerConfig;

class PureAirApp extends StatelessWidget {
  const PureAirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthStreamScope(
      child: MaterialApp.router(
        darkTheme: PureAirTheme.dark,
        debugShowCheckedModeBanner: false,
        theme: PureAirTheme.light,
        title: 'PureAir',
        routerConfig: routerConfig,
      ),
    );
  }
}
