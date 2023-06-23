import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';

import 'app_bottom_navigation_bar_item.dart';

const _constraints = BoxConstraints(minHeight: kBottomNavigationBarHeight);

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int>? onTap;

  const AppBottomNavigationBar({
    super.key,
    required this.items,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final itemWidth = (size.width - kBottomNavigationBarPadding) / 4;

    final theme = Theme.of(context);

    final colorScheme = theme.colorScheme;

    final labelStyle = theme.textTheme.labelLarge?.copyWith(
      color: colorScheme.onTertiary,
      fontWeight: FontWeight.bold,
    );

    final tiles = List.generate(4, (i) {
      return AppBottomNavigationBarItem(
        onTap: () => onTap?.call(i),
        item: items[i],
        selected: i == currentIndex,
        width: itemWidth,
        height: kBottomNavigationBarItemHeight,
        selectedColor: colorScheme.tertiary,
        labelStyle: labelStyle,
      );
    });

    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      padding: kHorizontalPadding18,
      constraints: _constraints,
      decoration: BoxDecoration(color: colorScheme.primary, border: kBorder2),
      child: IconTheme(
        data: const IconThemeData(color: kOnPrimary),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          runAlignment: WrapAlignment.center,
          children: tiles,
        ),
      ),
    );
  }
}
