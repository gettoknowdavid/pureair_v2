// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'main_dto.dart';
import 'pollutants_dto.dart';

part 'air_quality_data_dto.freezed.dart';
part 'air_quality_data_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class AirQualityDataDto with _$AirQualityDataDto {
  factory AirQualityDataDto({
    MainDto? main,
    @JsonKey(name: 'components') PollutantsDto? pollutants,
    @JsonKey(name: 'dt') int? dateTime,
  }) = _AirQualityDataDto;

  factory AirQualityDataDto.fromJson(Map<String, dynamic> json) =>
      _$AirQualityDataDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AirQualityDataDtoToJson(this);
}
