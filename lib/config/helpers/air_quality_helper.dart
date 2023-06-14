import 'dart:ui';

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
