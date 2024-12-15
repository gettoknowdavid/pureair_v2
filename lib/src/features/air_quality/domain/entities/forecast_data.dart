import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/domain/entities/daily_forecast.dart';

part 'forecast_data.freezed.dart';
part 'forecast_data.g.dart';

@freezed
class ForecastData with _$ForecastData {
  const factory ForecastData({
    List<DailyForecast>? o3,
    List<DailyForecast>? pm10,
    List<DailyForecast>? pm25,
    List<DailyForecast>? uvi,
    List<DailyForecast>? co,
    List<DailyForecast>? no2,
    List<DailyForecast>? so2,
  }) = _ForecastData;

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);
}
