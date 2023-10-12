import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/router/router.dart';

import 'app_bottom_navigation_bar.dart';
import 'home_app_bar.dart';



@RoutePage()
class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarStyle = Theme.of(context).textTheme.bodyLarge;

    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        ExploreRoute(),
        RankRoute(),
        ProfileRoute(),
      ],
      appBarBuilder: (context, tab) {
        Widget child = const SizedBox();
        final title = Text(tab.current.title(context), style: appBarStyle);
        final appBar = AppBar(title: title);

        switch (tab.activeIndex) {
          case 0:
            child = HomeAppBar(onTap: () => tab.setActiveIndex(3));
            break;
          case 3:
            child;
          default:
            child = appBar;
        }

        return PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: child,
        );
      },
      bottomNavigationBuilder: (context, tab) => AppBottomNavigationBar(
        currentIndex: tab.activeIndex,
        onTap: tab.setActiveIndex,
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
