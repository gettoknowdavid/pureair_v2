// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'feels_like_dto.dart';
import 'temp_dto.dart';
import 'weather_info_dto.dart';

part 'weather_forecast_dto.freezed.dart';
part 'weather_forecast_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class WeatherForecastDto with _$WeatherForecastDto {
  factory WeatherForecastDto({
    @JsonKey(name: 'dt') int? dateTime,
    int? sunrise,
    int? sunset,
    int? moonrise,
    int? moonset,
    @JsonKey(name: 'moon_phase') double? moonPhase,
    String? summary,
    TempDto? temp,
    @JsonKey(name: 'feels_like') FeelsLikeDto? feelsLike,
    int? pressure,
    int? humidity,
    @JsonKey(name: 'dew_point') double? dewPoint,
    @JsonKey(name: 'wind_speed') double? windSpeed,
    @JsonKey(name: 'wind_deg') int? windDeg,
    @JsonKey(name: 'wind_gust') double? windGust,
    @JsonKey(name: 'weather') List<WeatherInfoDto>? weatherInfo,
    int? clouds,
    double? uvi,
    double? pop,
    double? rain,
  }) = _WeatherForecastDto;

  factory WeatherForecastDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherForecastDtoToJson(this);
}
