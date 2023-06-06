import 'package:freezed_annotation/freezed_annotation.dart';

import 'pollution_dto.dart';
import 'weather_dto.dart';

part 'history_dto.freezed.dart';
part 'history_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class HistoryDto with _$HistoryDto {
  factory HistoryDto({
    List<WeatherDto>? weather,
    List<PollutionDto>? pollution,
  }) = _HistoryDto;

  factory HistoryDto.fromJson(Map<String, dynamic> json) =>
      _$HistoryDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$HistoryDtoToJson(this);
}
