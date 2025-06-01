import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/application/application.dart';
import 'package:pureair_v2/src/router/routing.dart' show routerConfig;

class PureAirApp extends StatelessWidget {
  const PureAirApp({super.key});

  @override
  Widget build(BuildContext context) {
    ref.watch(authNotifierProvider);
    return const PureAirAppView();
  }
}

class PureAirAppView extends StatelessWidget {
  const PureAirAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      darkTheme: PureAirTheme.dark,
      debugShowCheckedModeBanner: false,
      theme: PureAirTheme.light,
      title: 'PureAir',
      routerConfig: routerConfig,
    );
  }
}
