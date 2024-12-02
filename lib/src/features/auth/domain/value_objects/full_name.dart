import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/core/value_objects/value_failure.dart';
import 'package:pureair_v2/src/core/value_objects/value_object.dart';

class FullName extends ValueObject<String> {
  factory FullName(String input) => FullName._(_validateFullName(input));

  const FullName._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

Either<ValueFailure<String>, String> _validateFullName(String input) {
  if (input.isEmpty) return left(const EmptyFailure());
  if (input.contains('\n')) return left(const MoreThanOneLineFailure());
  return right(input);
}
