import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/shared/value_objects/value_exception.dart';
import 'package:pureair_v2/src/shared/value_objects/value_object.dart';

class Password extends ValueObject<String> {
  factory Password(String input) {
    final sanitizedInput = input.trim();

    // Call the static validation logic
    final validationResult = _validatePassword(sanitizedInput);
    // Create instance using the private const constructor, passing the result
    return Password._(validationResult);
  }

  const Password._(this.value);

  @override
  final Either<ValueException<String>, String> value;

  static Either<ValueException<String>, String> _validatePassword(
    String input,
  ) {
    if (input.isEmpty) return const Left(EmptyValueException());
    if (input.length >= 8) return Right(input);
    return const Left(
      InvalidValueException(
        code: 'invalid-password',
        message: 'Invalid password. Password must be at least 8 characters',
      ),
    );
  }
}
