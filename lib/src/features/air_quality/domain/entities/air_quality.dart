import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/domain/domain.dart';

part 'air_quality.freezed.dart';
part 'air_quality.g.dart';

@freezed
class AirQuality with _$AirQuality {
  const factory AirQuality({
    @JsonKey(name: 'aqi') required int value,
    @JsonKey(name: 'dominentpol') required String dominantPol,
    required int idx,
    required List<Attribution> attributions,
    required City city,
    required IAQI iaqi,
    required Forecast forecast,
  }) = _AirQuality;

  factory AirQuality.fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);
}
