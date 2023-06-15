import 'package:freezed_annotation/freezed_annotation.dart';

part 'temp_dto.freezed.dart';
part 'temp_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)class TempDto with _$TempDto {
  factory TempDto({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) = _TempDto;

  factory TempDto.fromJson(Map<String, dynamic> json) =>
      _$TempDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TempDtoToJson(this);
}
