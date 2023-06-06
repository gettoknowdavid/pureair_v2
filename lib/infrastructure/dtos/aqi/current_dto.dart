import 'package:freezed_annotation/freezed_annotation.dart';

import 'pollution_dto.dart';
import 'weather_dto.dart';

part 'current_dto.freezed.dart';
part 'current_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class CurrentDto with _$CurrentDto {
  factory CurrentDto({
    WeatherDto? weather,
    PollutionDto? pollution,
  }) = _CurrentDto;

  factory CurrentDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CurrentDtoToJson(this);
}
