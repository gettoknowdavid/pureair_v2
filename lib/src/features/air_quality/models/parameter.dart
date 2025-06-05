import 'package:equatable/equatable.dart';

final class Parameter with EquatableMixin {
  const Parameter({required this.value});

  final num value;

  @override
  List<Object?> get props => [value];

  Parameter copyWith({num? value}) => Parameter(value: value ?? this.value);
}
