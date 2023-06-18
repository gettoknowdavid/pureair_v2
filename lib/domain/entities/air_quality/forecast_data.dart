import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_data.freezed.dart';

@freezed
class ForecastData with _$ForecastData {
  factory ForecastData({
    required int avg,
    required String day,
    required int max,
    required int min,
  }) = _ForecastData;
}
