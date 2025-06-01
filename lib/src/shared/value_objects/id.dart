import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/shared/value_objects/value_exception.dart';
import 'package:pureair_v2/src/shared/value_objects/value_object.dart';
import 'package:uuid/uuid.dart';

class ID extends ValueObject<String> {
  /// Factory to generate a new, unique ID (UUID v4).
  /// Assumes newly generated UUIDs are inherently valid in this context.
  factory ID() {
    // Use non-const Uuid().v4() to ensure uniqueness at runtime
    final uuidString = const Uuid().v4();
    // Directly create a Right, bypassing string validation for generated IDs
    return ID._(Right(uuidString));
  }

  /// Factory to create an Id from a string representation.
  /// Validates the input string using internal logic.
  factory ID.fromString(String input) {
    // Perform validation using the static helper method
    final validationResult = _validateString(input);
    // Create instance using the private constructor, passing the validation
    // result
    return ID._(validationResult);
  }

  const ID._(this.value);

  @override
  final Either<ValueException<String>, String> value;

  static const ID empty = ID._(Right(''));

  /// Static validation logic for IDs created from strings.
  static Either<ValueException<String>, String> _validateString(String input) {
    final sanitizedInput = input.trim();

    if (sanitizedInput.isEmpty) {
      return const Left(RequiredValueException(message: 'ID cannot be empty.'));
    }

    if (!Uuid.isValidUUID(fromString: sanitizedInput)) {
      return const Left(
        InvalidValueException(
          code: 'invalid-id',
          message: 'Invalid ID',
        ),
      );
    }

    return Right(sanitizedInput);
  }
}
