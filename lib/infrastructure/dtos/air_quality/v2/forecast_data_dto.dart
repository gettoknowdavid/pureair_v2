import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_data_dto.freezed.dart';
part 'forecast_data_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class ForecastDataDto with _$ForecastDataDto {
  factory ForecastDataDto({
    required int avg,
    required String day,
    required int max,
    required int min,
  }) = _ForecastDataDto;

  factory ForecastDataDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForecastDataDtoToJson(this);
}
