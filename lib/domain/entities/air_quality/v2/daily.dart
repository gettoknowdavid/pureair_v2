import 'package:freezed_annotation/freezed_annotation.dart';

import 'forecast_data.dart';

part 'daily.freezed.dart';

@freezed
class Daily with _$Daily {
  factory Daily({
    List<ForecastData>? o3,
    List<ForecastData>? no2,
    List<ForecastData>? so2,
    List<ForecastData>? co,
    List<ForecastData>? pm10,
    List<ForecastData>? pm25,
    List<ForecastData>? uvi,
  }) = _Daily;
}
