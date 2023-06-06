import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class WeatherDto with _$WeatherDto {
  factory WeatherDto({
    DateTime? ts,
    int? tp,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);
}
