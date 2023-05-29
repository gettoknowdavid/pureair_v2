import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/auth_bloc/auth_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'router/router.dart';

class PureAirApp extends StatefulWidget {
  const PureAirApp({super.key});

  @override
  State<PureAirApp> createState() => _PureAirAppState();
}

class _PureAirAppState extends State<PureAirApp> {
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PureAir',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => 'PureAir',
      routerConfig: router.config(
        reevaluateListenable: ReevaluateListenable.stream(
          context.watch<AuthBloc>().stream,
        ),
      ),
      theme: ThemeData.dark().copyWith(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
      ),
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 800, name: TABLET),
          const Breakpoint(start: 801, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
