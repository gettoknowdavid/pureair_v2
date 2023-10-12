import 'package:dartz/dartz.dart';

import '../../../../utils/value_objects/value_objects.dart';



/// Validates whether the provided email is in a valid format or not.
///
/// Returns an [Either] instance where the left value is a [ValueFailure] if the input email is not valid,
/// otherwise the right value is the input email as a [String].
///
/// If the input email is empty or null, then the returned [Either] instance will have a left value
/// of [ValueFailure.empty] with the original input value as its argument.
/// If the input email is not empty, but is not in a valid email format, then the returned [Either]
///
/// instance will have a left value of [ValueFailure.invalidEmail] with the original input value as its argument.
/// @param input The email string to validate.
/// @return [Either] instance with either a [ValueFailure] or the input email as a [String] as the right value.
Either<ValueFailure<String>, String> validateEmail(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(input));
  }

  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidEmail(input));
}

/// Validates if the input value is not empty or null.
///
/// If the input value is null or empty, returns [ValueFailure.empty].
/// If the input value is not empty, returns the input value as a [String].
///
/// @param input The input value to validate.
/// @return An [Either] object with either [ValueFailure.empty] or the input value as a [String].
Either<ValueFailure<String>, String> validateEmpty(String? input) {
  if (input == null || input.isEmpty) {
    return left(ValueFailure.empty(input));
  }

  return right(input);
}

/// Validates a password string based on certain criteria.
///
/// The method returns an `Either` object which is `right` with the password
/// string if it's valid, and `left` with a `ValueFailure.invalidPassword`
/// error otherwise.
///
/// If [login] is set to `true`, the method returns `right` without validating
/// the password string.
///
/// The password string must:
/// - have at least 8 characters
/// - contain at least one uppercase letter, one lowercase letter, one number,
///   and one special character (e.g. @, #, $, etc.)
///
/// Throws a `ValueFailure.empty` error if [input] is empty or `null`.
Either<ValueFailure<String>, String> validatePassword(
  String input, {
  bool login = false,
}) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(input));
  }

  if (login) {
    return right(input);
  }

  const pattern =
      r'^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=!])(?=.{8,})';
  if (RegExp(pattern).hasMatch(input)) {
    return right(input);
  }

  return left(ValueFailure.invalidPassword(input));
}
