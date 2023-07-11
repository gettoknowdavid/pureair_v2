import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_data.freezed.dart';

@freezed
class ForecastData with _$ForecastData {
  factory ForecastData({
    int? avg,
    DateTime? day,
    int? max,
    int? min,
  }) = _ForecastData;

  factory ForecastData.empty() {
    return ForecastData(
      avg: 0,
      day: DateTime.now(),
      max: 0,
      min: 0,
    );
  }
}
