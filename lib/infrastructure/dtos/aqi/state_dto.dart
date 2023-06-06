// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'state_dto.freezed.dart';
part 'state_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class StateDto with _$StateDto {
  factory StateDto({
    @JsonKey(name: 'state') required String name,
  }) = _StateDto;

  factory StateDto.fromJson(Map<String, dynamic> json) =>
      _$StateDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StateDtoToJson(this);
}
