import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/core/value_objects/value_failure.dart';
import 'package:pureair_v2/src/core/value_objects/value_object.dart';

class SingleLineString extends ValueObject<String> {
  factory SingleLineString(String input) {
    return SingleLineString._(validateSingleLine(input));
  }

  const SingleLineString._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) return left(const MoreThanOneLineFailure());
  return right(input);
}
