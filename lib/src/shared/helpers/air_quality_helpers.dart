// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

/// Enum representing Air Quality Index categories.
///
/// Uses the  U.S. Environmental Protection Agency (EPA) guidelines for
/// calculating the air quality index value.
enum IndexCategory {
  good,
  moderate,
  unhealthyForSensitiveGroups,
  unhealthy,
  veryUnhealthy,
  hazardous,
  invalid,
}

/// AQI-related data including thresholds, colors, and messages.
class IndexData {
  const IndexData({
    required this.thresholds,
    required this.colors,
    required this.message,
    required this.longMessage,
  });

  final List<Color> colors;
  final List<String> longMessage;
  final List<String> message;
  final List<int> thresholds;
}

/// Singleton holding AQI configuration.
const _data = IndexData(
  colors: [
    Color(0xFF00E400),
    Color(0xFFFFD700),
    Color(0xFFFF8C00),
    Color(0xFF990000),
    Color(0xFF8F3F97),
    Color(0xFF7E0023),
  ],
  longMessage: [
    'Enjoy outdoor activities! There are no health concerns.',
    'Limit prolonged outdoor activities. Some people may experience health effects.',
    'Reduce prolonged outdoor activities. Sensitive groups should take precautions.',
    'Avoid prolonged outdoor activities. Everyone should limit outdoor activities.',
    'Stay indoors and avoid outdoor activities. Protect yourself with masks.',
    'Everyone should stay indoors and avoid all outdoor activities.',
  ],
  message: [
    'The air is good.',
    'The air quality is moderate.',
    'The air is unhealthy for sensitive groups.',
    'The air is unhealthy.',
    'The air is very unhealthy.',
    'The air is hazardous.',
  ],
  thresholds: [0, 51, 101, 151, 201, 301],
);

extension IndexCategoryX on IndexCategory {
  /// Gets the category index.
  int get i => IndexCategory.values.indexOf(this);

  /// Retrieves the color for the category.
  Color get color {
    return this == IndexCategory.invalid ? Colors.transparent : _data.colors[i];
  }

  /// Retrieves the short health message for the category.
  String get message => this == IndexCategory.invalid ? '' : _data.message[i];

  /// Retrieves the detailed health message for the category.
  String get longMessage {
    return this == IndexCategory.invalid ? '' : _data.longMessage[i];
  }
}

extension ColorX on Color {
  /// Determines the appropriate text color for a given background color.
  Color get textColor {
    final luminance = computeLuminance();
    return luminance > 0.5 ? Colors.black : Colors.white;
  }
}

/// Helper function to determine the AQI category from an AQI value.
IndexCategory getIndexCategory(num aqi) {
  if (aqi < 0) return IndexCategory.invalid;
  final index = _data.thresholds.indexWhere((threshold) => aqi < threshold);
  return index == -1 ? IndexCategory.hazardous : IndexCategory.values[index];
}

/// Retrieves the color associated with a specific AQI value.
Color getAirQualityColor(num aqi) => getIndexCategory(aqi).color;

/// Retrieves the short health message associated with a specific AQI value.
String getHealthMessage(num aqi) => getIndexCategory(aqi).message;

/// Retrieves the detailed health message associated with a specific AQI value.
String getLongHealthMessage(num aqi) => getIndexCategory(aqi).longMessage;

/// Checks if the current time is within daylight hours (6 AM to 6 PM).
bool get isDayLight {
  final hour = DateTime.now().hour;
  return hour >= 6 && hour < 18;
}
