import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/widgets/pure_air_bottom_navigation_bar.dart';

class PureAirLayout extends StatelessWidget {
  const PureAirLayout({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('PureAirLayout'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          context.read<LocalizedBloc>().add(const LocalizedStarted());
          context.read<CitiesBloc>().add(const CitiesStarted());
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: PureAirBottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: onTap,
        ),
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
