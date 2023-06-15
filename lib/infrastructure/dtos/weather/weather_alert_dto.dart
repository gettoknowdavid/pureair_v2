// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_alert_dto.freezed.dart';
part 'weather_alert_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)class WeatherAlertDto with _$WeatherAlertDto {
  factory WeatherAlertDto({
    @JsonKey(name: 'sender_name') String? senderName,
    String? event,
    int? start,
    int? end,
    String? description,
    List<String?>? tags,
  }) = _WeatherAlertDto;

  factory WeatherAlertDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherAlertDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WeatherAlertDtoToJson(this);
}
