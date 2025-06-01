import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parameter.g.dart';

@JsonSerializable()
final class Parameter with EquatableMixin {
  const Parameter({required this.value});

  factory Parameter.fromJson(Map<String, dynamic> json) =>
      _$ParameterFromJson(json);

  @JsonKey(name: 'v')
  final num value;

  @override
  List<Object?> get props => [value];

  Parameter copyWith({num? value}) => Parameter(value: value ?? this.value);

  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}
