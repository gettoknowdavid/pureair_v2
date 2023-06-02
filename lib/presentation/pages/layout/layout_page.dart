import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/config/router/router.dart';
import 'package:pureair_v2/presentation/pages/layout/widgets/home_app_bar.dart';

import 'widgets/widgets.dart';

@RoutePage()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        RankRoute(),
        ProfileRoute(),
      ],
      appBarBuilder: (context, tabsRouter) {
        Widget child = const SizedBox();
        switch (tabsRouter.activeIndex) {
          case 0:
            child = const HomeAppBar();
            break;
          default:
        }

        return PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: child,
        );
      },
      bottomNavigationBuilder: (context, tabsRouter) => AppBottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(PhosphorIcons.fill.house),
          ),
          BottomNavigationBarItem(
            label: 'Explore',
            icon: Icon(PhosphorIcons.fill.magnifyingGlass),
          ),
          BottomNavigationBarItem(
            label: 'Rank',
            icon: Icon(PhosphorIcons.fill.chartBar),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(PhosphorIcons.fill.userCircle),
          ),
        ],
      ),
    );
  }
}
