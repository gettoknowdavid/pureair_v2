import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_dto.freezed.dart';
part 'debug_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class DebugDto with _$DebugDto {
  factory DebugDto({
    String? sync,
  }) = _DebugDto;

  factory DebugDto.fromJson(Map<String, dynamic> json) =>
      _$DebugDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DebugDtoToJson(this);
}
