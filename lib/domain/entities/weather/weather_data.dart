import 'package:freezed_annotation/freezed_annotation.dart';

import 'rain.dart';
import 'weather_info.dart';

part 'weather_data.freezed.dart';

@freezed
class WeatherData with _$WeatherData {
  const factory WeatherData({
    int? dateTime,
    int? sunrise,
    int? sunset,
    double? temp,
    double? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? uvi,
    int? clouds,
    int? visibility,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<WeatherInfo>? weather,
    double? pop,
    Rain? rain,
  }) = _WeatherData;
}
