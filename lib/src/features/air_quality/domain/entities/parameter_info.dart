import 'package:flutter/material.dart';

/// Class representing thresholds and colors for air quality parameters.
class ParameterInfo {
  /// Creates an instance of [ParameterInfo].
  const ParameterInfo({
    required this.parameter,
    required this.thresholds,
    required this.colors,
  });

  /// The name of the air quality parameter (e.g., "pm25").
  final String parameter;

  /// Threshold values defining the categories for the parameter.
  final List<double> thresholds;

  /// Colors corresponding to the thresholds.
  final List<Color> colors;
}
