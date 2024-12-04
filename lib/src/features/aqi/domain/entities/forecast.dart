import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/aqi/domain/entities/daily_forecast.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  factory Forecast({
    List<DailyForecast>? o3,
    List<DailyForecast>? pm10,
    List<DailyForecast>? pm25,
    List<DailyForecast>? uvi,
  }) = _Forecast;
}
