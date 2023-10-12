import 'package:flutter/material.dart';

import '../constants/constants.dart';

class AppBottomNavigationBarItem extends StatelessWidget {
  final BottomNavigationBarItem item;
  final bool selected;
  final VoidCallback onTap;
  final String? indexLabel;
  final TextStyle? labelStyle;
  final Color selectedColor;
  final double width;
  final double height;

  const AppBottomNavigationBarItem({
    super.key,
    this.labelStyle,
    this.indexLabel,
    required this.selected,
    required this.onTap,
    required this.item,
    required this.selectedColor,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget? result;

    final effectiveTooltip =
        item.tooltip == '' ? null : item.tooltip ?? item.label;

    if (!selected) {
      result = SizedBox(height: height, width: width, child: item.icon);
    } else {
      result = Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: selectedColor, border: kBorder2),
        child: Text(item.label!, style: labelStyle),
      );
    }

    if (effectiveTooltip != null) {
      result = Tooltip(
        message: effectiveTooltip,
        preferBelow: false,
        verticalOffset: 30,
        excludeFromSemantics: true,
        child: result,
      );
    }

    result = Semantics(
      selected: selected,
      container: true,
      child: Stack(
        children: <Widget>[
          InkWell(onTap: onTap, child: result),
          Semantics(label: indexLabel),
        ],
      ),
    );

    return result;
  }
}
