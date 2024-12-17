import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({
    required this.destination,
    required this.selected,
    required this.onTap,
    required this.width,
    super.key,
  });

  final Destination destination;
  final bool selected;
  final VoidCallback onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = PureAirTextTheme.of(context)!;

    final icon = IconTheme(
      data: IconThemeData(color: colors.onPrimary),
      child: destination.icon,
    );

    final label = Container(
      height: kBottomNavigationBarItemHeight,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: colors.tertiary,
        border: Border.all(width: 2, color: colors.onTertiary),
      ),
      child: Text(
        destination.label,
        style: textTheme.body?.copyWith(
          letterSpacing: 0,
          color: colors.onTertiary,
        ),
      ),
    );

    return Center(
      child: InkWell(
        onTap: onTap,
        child: Container(
          child: selected ? label : icon,
        ),
      ),
    );
  }
}
