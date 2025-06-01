import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/shared/value_objects/value_exception.dart';
import 'package:pureair_v2/src/shared/value_objects/value_object.dart';

class EmailAddress extends ValueObject<String> {
  /// Public factory constructor: Performs validation EAGERLY.
  /// This constructor cannot be const because it takes runtime input.
  factory EmailAddress(String input) {
    final sanitizedInput = input.trim();

    // Call the static validation logic
    final validationResult = _validateEmail(sanitizedInput);
    // Create instance using the private const constructor, passing the result
    return EmailAddress._(validationResult);
  }

  const EmailAddress._(this.value);

  @override
  final Either<ValueException<String>, String> value;

  static final _emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static EmailAddress empty = EmailAddress('');

  static Either<ValueException<String>, String> _validateEmail(String input) {
    if (input.isEmpty) {
      return const Left(
          RequiredValueException(message: 'EmailAddress is required'));
    }

    if (!_emailRegExp.hasMatch(input)) {
      return const Left(
        InvalidValueException(
          code: 'invalid-email',
          message: 'The entered email is not valid.',
        ),
      );
    }

    // Validation passed
    return Right(input);
  }
}
