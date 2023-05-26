import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'router/router.dart';

class PureAirApp extends StatefulWidget {
  const PureAirApp({super.key});

  @override
  State<PureAirApp> createState() => _PureAirAppState();
}

class _PureAirAppState extends State<PureAirApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PureAir',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => 'PureAir',
      routerConfig: _router.config(),
      theme: ThemeData.dark().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      ),
    );
  }
}
