// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'rain_dto.freezed.dart';
part 'rain_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class RainDto with _$RainDto {
  const factory RainDto({
    @JsonKey(name: '1h') double? the1H,
  }) = _RainDto;

  factory RainDto.fromJson(Map<String, dynamic> json) =>
      _$RainDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RainDtoToJson(this);
}
