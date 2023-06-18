// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'parameter_dto.dart';

part 'measurements_dto.freezed.dart';
part 'measurements_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class MeasurementsDto with _$MeasurementsDto {
  factory MeasurementsDto({
    ParameterDto? co,
    ParameterDto? no2,
    ParameterDto? o3,
    ParameterDto? pm10,
    ParameterDto? pm25,
    ParameterDto? so2,
    ParameterDto? dew,
    @JsonKey(name: "h") ParameterDto? humidity,
    @JsonKey(name: "p") ParameterDto? pressure,
    @JsonKey(name: "t") ParameterDto? temperature,
    @JsonKey(name: "w") ParameterDto? wind,
  }) = _MeasurementsDto;

  factory MeasurementsDto.fromJson(Map<String, dynamic> json) =>
      _$MeasurementsDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MeasurementsDtoToJson(this);
}
