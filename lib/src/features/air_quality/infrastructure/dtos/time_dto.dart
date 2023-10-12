import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../utils/utils.dart';

part 'time_dto.freezed.dart';
part 'time_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class TimeDto with _$TimeDto {
  factory TimeDto({
    @DateTimeConverter() DateTime? s,
    @DateTimeConverter() DateTime? sTime,
    int? vTime,
    String? tz,
    int? v,
    @DateTimeConverter() DateTime? iso,
  }) = _TimeDto;

  factory TimeDto.fromJson(Map<String, dynamic> json) =>
      _$TimeDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimeDtoToJson(this);
}
