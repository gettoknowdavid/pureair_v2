import 'dart:ui';

class ParameterInfo {
  final String parameter;
  final List<double> thresholds;
  final List<Color> colors;

  ParameterInfo({
    required this.parameter,
    required this.thresholds,
    required this.colors,
  });
}
