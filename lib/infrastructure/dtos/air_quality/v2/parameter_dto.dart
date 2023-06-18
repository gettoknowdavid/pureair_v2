import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameter_dto.freezed.dart';
part 'parameter_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class ParameterDto with _$ParameterDto {
  factory ParameterDto({
    required double value,
  }) = _ParameterDto;

  factory ParameterDto.fromJson(Map<String, dynamic> json) =>
      _$ParameterDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ParameterDtoToJson(this);
}
