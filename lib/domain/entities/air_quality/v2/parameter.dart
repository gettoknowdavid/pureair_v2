import 'package:freezed_annotation/freezed_annotation.dart';

part 'parameter.freezed.dart';

@freezed
class Parameter with _$Parameter {
  const factory Parameter({
    required double value,
  }) = _Parameter;
}
