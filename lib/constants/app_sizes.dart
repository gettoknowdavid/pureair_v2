import 'package:flutter/material.dart';

const double kGlobalPadding = 18.0;
const EdgeInsets kAllPadding18 = EdgeInsets.all(18);
const EdgeInsets kHorizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets kHorizontalPadding18 = EdgeInsets.symmetric(horizontal: 18);
const EdgeInsets kVerticalPadding18 = EdgeInsets.symmetric(vertical: 18);

/// The width of the screen minus the global padding (18px) for both sides
/// plus the inner padding for both sides + the border width (2px) for both sides
const double kBottomNavigationBarPadding = (kGlobalPadding * 4) + 4;

const double kBottomNavigationBarItemHeight = kBottomNavigationBarHeight * 0.65;

final Border kBorder2 = Border.all(width: 2);
final Border kBorderWhite2 = Border.all(width: 2, color: Colors.white);

extension SizeExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());
}
