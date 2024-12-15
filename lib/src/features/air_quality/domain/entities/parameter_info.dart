import 'package:flutter/material.dart';

/// Class representing thresholds and colors for air quality parameters.
class ParameterInfo {
  /// Creates an instance of [ParameterInfo].
  const ParameterInfo({
    required this.thresholds,
    required this.colors,
  });

  /// Threshold values defining the categories for the parameter.
  final List<double> thresholds;

  /// Colors corresponding to the thresholds.
  final List<Color> colors;

  int getIndexForValue(num value) {
    for (var i = 0; i < thresholds.length; i++) {
      if (value <= thresholds[i]) return i;
    }
    // Return the last index if the value exceeds all thresholds.
    return thresholds.length - 1;
  }
}
