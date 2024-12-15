import 'package:flutter/material.dart';

const double kGlobalPadding = 24;
const EdgeInsets kAllPadding24 = EdgeInsets.all(24);
const EdgeInsets kHorizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
const EdgeInsets kHorizontalPadding24 = EdgeInsets.symmetric(horizontal: 24);
const EdgeInsets kVerticalPadding24 = EdgeInsets.symmetric(vertical: 24);

/// The width of the screen minus the global padding (18px) for both sides
/// plus the inner padding for both sides + the border width(2px) for both sides
const double kBottomNavigationBarPadding = (kGlobalPadding * 4) + 4;
const double kBottomNavigationBarItemHeight = kBottomNavigationBarHeight * 0.65;
