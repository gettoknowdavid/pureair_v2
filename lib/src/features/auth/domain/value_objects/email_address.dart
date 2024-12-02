import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/core/value_objects/value_failure.dart';
import 'package:pureair_v2/src/core/value_objects/value_object.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) => EmailAddress._(_validateEmail(input));

  const EmailAddress._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

Either<ValueFailure<String>, String> _validateEmail(String input) {
  const emailRegEx =
      r'''^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+''';
  if (RegExp(emailRegEx).hasMatch(input)) return right(input);
  return left(const InvalidEmailFailure());
}
