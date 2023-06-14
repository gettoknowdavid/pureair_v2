// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'air_quality_data_dto.dart';
import 'coordinates_dto.dart';

part 'air_quality_dto.freezed.dart';
part 'air_quality_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class AirQualityDto with _$AirQualityDto {
  factory AirQualityDto({
    @JsonKey(name: 'coord') required CoordinatesDto coordinates,
    @JsonKey(name: 'list') required List<AirQualityDataDto?> data,
  }) = _AirQualityDto;

  factory AirQualityDto.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AirQualityDtoToJson(this);
}
