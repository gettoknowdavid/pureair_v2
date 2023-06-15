import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_alert.dart';
import 'weather_data.dart';
import 'weather_forecast.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    double? lat,
    double? lon,
    String? timezone,
    int? timezoneOffset,
    WeatherData? current,
    List<WeatherForecast?>? daily,
    int? cod,
    String? message,
    List<WeatherAlert?>? alerts,
  }) = _Weather;
}
