import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_info_dto.freezed.dart';
part 'weather_info_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)
class WeatherInfoDto with _$WeatherInfoDto {
  factory WeatherInfoDto({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherInfoDto;

  factory WeatherInfoDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherInfoDtoToJson(this);
}
