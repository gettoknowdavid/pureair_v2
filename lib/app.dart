import 'package:flutter/material.dart';
import 'package:pureair_v2/config/app_theme.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'config/router/app_router.dart';

final router = AppRouter();

class PureAirApp extends StatelessWidget {
  const PureAirApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PureAir',
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => 'PureAir',
      routerConfig: router.config(),
      theme: lightTheme,
      darkTheme: darkTheme,
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
