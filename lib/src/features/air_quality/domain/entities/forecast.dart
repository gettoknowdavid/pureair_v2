import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/domain/entities/forecast_data.dart';

part 'forecast.freezed.dart';
part 'forecast.g.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    @JsonKey(name: 'daily') required ForecastData data,
  }) = _Forecast;

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
}
