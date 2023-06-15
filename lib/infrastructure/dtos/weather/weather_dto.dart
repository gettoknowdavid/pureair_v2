// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'weather_alert_dto.dart';
import 'weather_data_dto.dart';
import 'weather_forecast_dto.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)class WeatherDto with _$WeatherDto {
  factory WeatherDto({
    double? lat,
    double? lon,
    String? timezone,
    @JsonKey(name: 'timezone_offset') int? timezoneOffset,
    WeatherDataDto? current,
    List<WeatherForecastDto?>? daily,
    int? cod,
    String? message,
    List<WeatherAlertDto?>? alerts,
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
