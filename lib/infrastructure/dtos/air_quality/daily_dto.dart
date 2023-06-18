import 'package:freezed_annotation/freezed_annotation.dart';

import 'forecast_data_dto.dart';

part 'daily_dto.freezed.dart';
part 'daily_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class DailyDto with _$DailyDto {
  factory DailyDto({
    List<ForecastDataDto>? o3,
    List<ForecastDataDto>? no2,
    List<ForecastDataDto>? so2,
    List<ForecastDataDto>? co,
    List<ForecastDataDto>? pm10,
    List<ForecastDataDto>? pm25,
    List<ForecastDataDto>? uvi,
  }) = _DailyDto;

  factory DailyDto.fromJson(Map<String, dynamic> json) =>
      _$DailyDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DailyDtoToJson(this);
}
