import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pureair_v2/src/shared/layout/presentation/pure_air_bottom_navigation_bar.dart';

class PureAirLayout extends StatelessWidget {
  const PureAirLayout({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('PureAirLayout'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: PureAirBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: onTap,
      ),
    );
  }

  void onTap(int index) {
    return navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
