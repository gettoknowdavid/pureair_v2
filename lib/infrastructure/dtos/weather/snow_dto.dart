// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'snow_dto.freezed.dart';
part 'snow_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class SnowDto with _$SnowDto {
  const factory SnowDto({
    @JsonKey(name: '1h') double? the1H,
  }) = _SnowDto;

  factory SnowDto.fromJson(Map<String, dynamic> json) =>
      _$SnowDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SnowDtoToJson(this);
}
