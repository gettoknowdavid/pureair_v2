import 'package:flutter/material.dart';

const double kGlobalPadding = 16.0;

extension SizeExtension on num {
  Widget get verticalSpace => SizedBox(height: toDouble());

  Widget get horizontalSpace => SizedBox(width: toDouble());
}
