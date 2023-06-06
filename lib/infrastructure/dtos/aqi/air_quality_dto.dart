import 'package:freezed_annotation/freezed_annotation.dart';

import 'current_dto.dart';
import 'forecast_dto.dart';
import 'history_dto.dart';
import 'location_dto.dart';

part 'air_quality_dto.freezed.dart';
part 'air_quality_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class AirQualityDto with _$AirQualityDto {
  factory AirQualityDto({
    String? city,
    String? state,
    String? country,
    LocationDto? location,
    List<ForecastDto>? forecasts,
    CurrentDto? current,
    HistoryDto? history,
  }) = _AirQualityDto;

  factory AirQualityDto.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AirQualityDtoToJson(this);
}
