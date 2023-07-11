import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily_dto.dart';

part 'forecast_dto.freezed.dart';
part 'forecast_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class ForecastDto with _$ForecastDto {
  factory ForecastDto({
    required DailyDto daily,
  }) = _ForecastDto;

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ForecastDtoToJson(this);
}
