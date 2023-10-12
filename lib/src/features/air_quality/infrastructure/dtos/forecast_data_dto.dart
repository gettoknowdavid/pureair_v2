import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/utils.dart';

part 'forecast_data_dto.freezed.dart';
part 'forecast_data_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class ForecastDataDto with _$ForecastDataDto {
  factory ForecastDataDto({
    int? avg,
    @DateTimeConverter() DateTime? day,
    int? max,
    int? min,
  }) = _ForecastDataDto;

  factory ForecastDataDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ForecastDataDtoToJson(this);
}
