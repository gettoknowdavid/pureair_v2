import 'package:flutter/material.dart';

const double kGlobalPadding = 16.0;
const EdgeInsets kAllPadding16 = EdgeInsets.all(16);
const EdgeInsets kHorizontalPadding16 = EdgeInsets.symmetric(horizontal: 16);
const EdgeInsets kVerticalPadding16 = EdgeInsets.symmetric(vertical: 16);

/// The width of the screen minus the global padding (16px) for both sides
/// plus the inner padding for both sides + the border width (2px) for both sides
const double kBottomNavigationBarPadding = (kGlobalPadding * 4) + 4;

const double kBottomNavigationBarItemHeight = kBottomNavigationBarHeight * 0.65;

final Border kBorder2 = Border.all(width: 2);

extension SizeExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());
}
