import 'package:freezed_annotation/freezed_annotation.dart';

import 'feels_like.dart';
import 'temp.dart';
import 'weather_info.dart';

part 'weather_forecast.freezed.dart';

@freezed
class WeatherForecast with _$WeatherForecast {
  const factory WeatherForecast({
    int? dateTime,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    double? moonPhase,
    String? summary,
    Temp? temp,
    FeelsLike? feelsLike,
    int? pressure,
    int? humidity,
    double? dewPoint,
    double? windSpeed,
    int? windDeg,
    double? windGust,
    List<WeatherInfo>? weatherInfo,
    int? clouds,
    double? uvi,
    double? pop,
    double? rain,
  }) = _WeatherForecast;
}
