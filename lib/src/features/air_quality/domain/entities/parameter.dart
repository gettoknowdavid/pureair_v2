import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameter.freezed.dart';
part 'parameter.g.dart';

@freezed
class Parameter with _$Parameter {
  const factory Parameter({
    @JsonKey(name: 'v') required num value,
  }) = _Parameter;
  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);
}
