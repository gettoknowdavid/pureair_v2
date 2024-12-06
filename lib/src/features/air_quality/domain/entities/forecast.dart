import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/domain/entities/daily_forecast.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    List<DailyForecast>? o3,
    List<DailyForecast>? pm10,
    List<DailyForecast>? pm25,
    List<DailyForecast>? uvi,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
