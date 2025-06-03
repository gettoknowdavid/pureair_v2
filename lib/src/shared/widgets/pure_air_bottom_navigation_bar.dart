import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/shared/models/models.dart' show destinations;
import 'package:pureair_v2/src/shared/shared.dart';

class PureAirBottomNavigationBar extends StatelessWidget {
  const PureAirBottomNavigationBar({
    required this.currentIndex,
    super.key,
    this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.sizeOf(context);
    final itemWidth = (size.width - kBottomNavigationBarPadding) / 4;

    return Container(
      padding: kHorizontalPadding24,
      margin: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      decoration: BoxDecoration(
        color: colors.primary,
        border: Border.all(width: 2, color: colors.onSurface),
      ),
      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,
        destinations: destinations
            .mapIndexed(
              (index, destination) => DestinationWidget(
                destination: destination,
                selected: currentIndex == index,
                onTap: () => onTap?.call(index),
                width: itemWidth,
              ),
            )
            .toList(),
      ),
    );
  }
}
