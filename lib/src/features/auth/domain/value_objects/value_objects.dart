import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../../../utils/value_objects/value_objects.dart';
import 'value_validators.dart';

/// A value object for an email address field
class Email extends ValueObject<String> {
  /// The validated value of the email address field
  @override
  final Either<ValueFailure<String>, String> value;

  /// Creates an Email object with the given [input].
  ///
  /// If the input is valid, returns an Email object with the validated value.
  /// Otherwise, returns an Email object with a [ValueFailure] object
  /// representing the specific failure.
  factory Email(String input) {
    return Email._(validateEmail(input.toLowerCase().trim()));
  }

  /// Private constructor that creates an Email object with the given [value].
  const Email._(this.value);
}

/// A value object for an name field
class Name extends ValueObject<String> {
  /// The validated value of the name.
  @override
  final Either<ValueFailure<String>, String> value;

  /// Creates a Name object with the given [input].
  ///
  /// If the input is valid, returns a Name object with the validated value.
  /// Otherwise, returns a Name object with a [ValueFailure] object
  /// representing the specific failure.
  ///
  /// The input is expected to be a string representing a person's name. It is
  /// transformed to begin with an uppercase letter, and empty inputs are
  /// considered invalid.
  factory Name(String input) {
    return Name._(validateEmpty(toBeginningOfSentenceCase(input.trim())));
  }

  /// Private constructor that creates a Name object with the given [value].
  const Name._(this.value);
}

/// Value object class for passwords.
class Password extends ValueObject<String> {
  /// The validated value of the password.
  @override
  final Either<ValueFailure<String>, String> value;

  /// Whether this password is being used for login. If `true`, the password
  /// will be validated differently to enforce different rules.
  final bool login;

  /// Creates a new `Password` object with the given [input] string and optional
  /// [login] flag. If [login] is `true`, the password will be validated
  /// differently to enforce different rules.
  factory Password(String input, {bool login = false}) {
    return Password._(
      validatePassword(input.trim(), login: login),
      login: login,
    );
  }

  /// Private constructor for creating a new `Password` object with a validated
  /// [value] and optional [login] flag.
  const Password._(this.value, {this.login = false});
}
