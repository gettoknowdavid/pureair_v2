import 'package:flutter/material.dart';
import 'package:pureair_v2/domain/domain.dart';

const String kHealthMessageGood = "The air is good.";
const String kHealthMessageHazardous = "The air is hazardous.";
const String kHealthMessageModerate = "The air quality is moderate.";
const String kHealthMessageUnhealthy = "The air is unhealthy.";
const String kHealthMessageUnhealthySensitive =
    "The air is unhealthy for sensitive groups.";
const String kHealthMessageVeryUnhealthy = "The air is very unhealthy.";

const String kDetailedHealthMessageGood =
    "Enjoy outdoor activities! There are no health concerns. You can do all your usual activities.";
const String kDetailedHealthMessageHazardous =
    "Everyone should stay indoors and avoid all outdoor activity. If you must go outside, wear a mask that covers your nose and mouth and seek medical attention if you experience any health problems.";
const String kDetailedHealthMessageModerate =
    "Limit prolonged outdoor exertion. Some people may experience health effects, especially those who are sensitive to air pollution. If you are feeling sick, stay indoors and avoid strenuous activity.";
const String kDetailedHealthMessageUnhealthy =
    "Avoid prolonged outdoor exertion. Everyone should avoid prolonged or strenuous outdoor exertion. If you must be outside, wear a mask that covers your nose and mouth.";
const String kDetailedHealthMessageUnhealthySensitive =
    "Reduce prolonged outdoor exertion. People with heart or lung disease, older adults, and children should reduce prolonged or strenuous outdoor exertion. Everyone else should reduce outdoor exertion.";
const String kDetailedHealthMessageVeryUnhealthy =
    "Stay indoors and avoid outdoor activities. Everyone should stay indoors as much as possible. If you must go outside, wear a mask that covers your nose and mouth and avoid strenuous activity.";

Map<int, String> _healthMessages = {
  0: kHealthMessageGood,
  51: kHealthMessageModerate,
  101: kHealthMessageUnhealthySensitive,
  151: kHealthMessageUnhealthy,
  201: kHealthMessageVeryUnhealthy,
  301: kHealthMessageHazardous,
};

Map<int, String> _detailedHealthMessages = {
  0: kDetailedHealthMessageGood,
  51: kDetailedHealthMessageModerate,
  101: kDetailedHealthMessageUnhealthySensitive,
  151: kDetailedHealthMessageUnhealthy,
  201: kDetailedHealthMessageVeryUnhealthy,
  301: kDetailedHealthMessageHazardous,
};

String? getHealthMessage(num aqi) {
  int nearestLowerAQI =
      _healthMessages.keys.lastWhere((key) => key <= aqi, orElse: () => -1);

  if (nearestLowerAQI != -1) {
    return _healthMessages[nearestLowerAQI];
  } else {
    return "Invalid AQI value.";
  }
}

String getDetailedHealthMessage(num aqi) {
  int nearestLowerAQI =
      _healthMessages.keys.lastWhere((key) => key <= aqi, orElse: () => -1);

  if (nearestLowerAQI != -1) {
    return _detailedHealthMessages[nearestLowerAQI] ?? 'Invalid AQI value';
  } else {
    return "Invalid AQI value.";
  }
}

Color getAirQualityColor(num aqi) {
  int nearestLowerAQI =
      _healthMessages.keys.lastWhere((key) => key <= aqi, orElse: () => -1);

  if (nearestLowerAQI != -1) {
    return airQualityColor[nearestLowerAQI] ?? kTransparent;
  } else {
    return kTransparent;
  }
}

bool get isDayLight {
  DateTime currentTime = DateTime.now();
  int currentHour = currentTime.hour;

  if (currentHour >= 6 && currentHour < 18) {
    return true; // It's daytime
  } else {
    return false; // It's nighttime (moon)
  }
}

const Color kColorGood = Color(0xFF00E400);
const Color kColorModerate = Color(0xFFFFD700);
const Color kColorUnhealthySensitive = Color(0xFFFF8C00);
const Color kColorUnhealthy = Color(0xFF990000);
const Color kColorVeryUnhealthy = Color(0xFF8F3F97);
const Color kColorHazardous = Color(0xFF7E0023);

const Color kBlack = Color(0xff000000);
const Color kWhite = Color(0xffffffff);
const Color kTransparent = Color.fromRGBO(255, 255, 255, 0);

Map<int, Color> airQualityColor = {
  0: kColorGood,
  51: kColorModerate,
  101: kColorUnhealthySensitive,
  151: kColorUnhealthy,
  201: kColorVeryUnhealthy,
  301: kColorHazardous,
};

Color getTextColor(Color color) {
  final lum =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

  return lum > 0.5 ? const Color(0xff000000) : const Color(0xffffffff);
}

Color getColorForPM25([double? pm25]) {
  if (pm25 == null) {
    return Colors.transparent;
  }

  if (pm25 <= 15.4) {
    return kColorGood;
  } else if (pm25 <= 40.4) {
    return kColorModerate;
  } else if (pm25 <= 65.4) {
    return kColorUnhealthySensitive;
  } else if (pm25 <= 150.4) {
    return kColorUnhealthy;
  } else if (pm25 <= 250.4) {
    return kColorVeryUnhealthy;
  } else {
    return kColorHazardous;
  }
}

const _aqiColors = [
  kColorGood,
  kColorModerate,
  kColorUnhealthySensitive,
  kColorUnhealthy,
  kColorVeryUnhealthy,
  kColorHazardous,
];

List<ParameterInfo?> parameterColors = [
  ParameterInfo(
    parameter: "pm25",
    thresholds: [15.4, 40.4, 65.4, 150.4, 250.4, 350.4],
    // thresholds: [15.4, 40.4, 65.4, 150.4, 250.4, 350.4, 500.4],
    colors: _aqiColors,
  ),
  ParameterInfo(
    parameter: "pm10",
    thresholds: [54.0, 154.0, 254.0, 354.0, 424.0],
    // thresholds: [54.0, 154.0, 254.0, 354.0, 424.0, 504.0],
    colors: _aqiColors,
  ),
  ParameterInfo(
    parameter: "o3",
    thresholds: [0.059, 0.075, 0.095, 0.115, 0.374],
    // thresholds: [0.059, 0.075, 0.095, 0.115, 0.374, 0.374],
    colors: _aqiColors,
  ),
  ParameterInfo(
    parameter: "co",
    thresholds: [4.4, 9.4, 12.4, 15.4, 30.4, 40.4],
    // thresholds: [4.4, 9.4, 12.4, 15.4, 30.4, 40.4, 50.4],
    colors: _aqiColors,
  ),
  ParameterInfo(
    parameter: "so2",
    thresholds: [0.034, 0.144, 0.224, 0.304, 0.604, 0.804],
    // thresholds: [0.034, 0.144, 0.224, 0.304, 0.604, 0.804, 1.004],
    colors: _aqiColors,
  ),
  ParameterInfo(
    parameter: "no2",
    thresholds: [1.24, 1.64, 2.04],
    colors: _aqiColors,
  ),
];

Color getColorForParameter(String parameter, [num? value]) {
  final parameterColor = parameterColors.firstWhere(
    (pc) => pc?.parameter == parameter,
    orElse: () => null,
  );

  if (parameterColor != null && value != null) {
    for (var i = 0; i < parameterColor.thresholds.length; i++) {
      if (value <= parameterColor.thresholds[i]) {
        return parameterColor.colors[i];
      }
    }
  }
  return Colors.black;
}
