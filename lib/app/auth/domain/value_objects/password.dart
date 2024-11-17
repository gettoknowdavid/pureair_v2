import 'package:dartz/dartz.dart';
import 'package:pureair_v2/app/core/value_objects/value_failure.dart';
import 'package:pureair_v2/app/core/value_objects/value_object.dart';

class Password extends ValueObject<String> {
  factory Password(String input) => Password._(_validatePassword(input));

  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

Either<ValueFailure<String>, String> _validatePassword(String input) {
  if (input.length >= 8) return right(input);
  return left(const InvalidPasswordFailure());
}
