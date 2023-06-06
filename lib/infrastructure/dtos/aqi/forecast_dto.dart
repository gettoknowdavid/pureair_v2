import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_dto.freezed.dart';
part 'forecast_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class ForecastDto with _$ForecastDto {
  factory ForecastDto({
    DateTime? ts,
    int? aqius,
    int? aqicn,
    int? tp,
    int? tpMin,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) = _ForecastDto;

  factory ForecastDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForecastDtoToJson(this);
}
