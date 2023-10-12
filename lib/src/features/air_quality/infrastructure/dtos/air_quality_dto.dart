// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribution_dto.dart';
import 'city_dto.dart';
import 'debug_dto.dart';
import 'forecast_dto.dart';
import 'measurements_dto.dart';
import 'time_dto.dart';

part 'air_quality_dto.freezed.dart';
part 'air_quality_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class AirQualityDto with _$AirQualityDto {
  factory AirQualityDto({
    required int aqi,
    required int idx,
    required List<AttributionDto> attributions,
    required CityDto city,
    @JsonKey(name: "dominentpol") required String domPol,
    @JsonKey(name: "iaqi") required MeasurementsDto measurements,
    required TimeDto time,
    required ForecastDto forecast,
    required DebugDto debug,
  }) = _AirQualityDto;

  factory AirQualityDto.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AirQualityDtoToJson(this);
}
