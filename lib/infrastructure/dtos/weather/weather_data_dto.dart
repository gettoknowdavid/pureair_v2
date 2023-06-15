// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'rain_dto.dart';
import 'snow_dto.dart';
import 'weather_info_dto.dart';

part 'weather_data_dto.freezed.dart';
part 'weather_data_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)class WeatherDataDto with _$WeatherDataDto {
  factory WeatherDataDto({
    @JsonKey(name: 'dt') int? dateTime,
    int? sunrise,
    int? sunset,
    double? temp,
    @JsonKey(name: 'feels_like') double? feelsLike,
    int? pressure,
    int? humidity,
    @JsonKey(name: 'dew_point') double? dewPoint,
    double? uvi,
    int? clouds,
    int? visibility,
    @JsonKey(name: 'wind_speed') double? windSpeed,
    @JsonKey(name: 'wind_deg') int? windDeg,
    @JsonKey(name: 'wind_gust') double? windGust,
    @JsonKey(name: 'weather') List<WeatherInfoDto>? weatherInfo,
    double? pop,
    RainDto? rain,
    SnowDto? snow,
  }) = _WeatherDataDto;

  factory WeatherDataDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherDataDtoToJson(this);
}
