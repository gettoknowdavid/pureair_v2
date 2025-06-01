import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:pureair_v2/src/shared/value_objects/value_exception.dart';
import 'package:pureair_v2/src/shared/value_objects/value_object.dart';

class SingleLineString extends ValueObject<String> {
  factory SingleLineString(String input) {
    final sanitizedInput = toBeginningOfSentenceCase(input.trim());
    final validationResult = _validateString(sanitizedInput);
    return SingleLineString._(validationResult);
  }

  const SingleLineString._(this.value);

  @override
  final Either<ValueException<String>, String> value;

  static Either<ValueException<String>, String> _validateString(String input) {
    if (input.isEmpty) return const Left(RequiredValueException());

    if (input.contains('\n')) {
      return Left(MaxLinesExceededValueException(input, 1));
    }

    return Right(input);
  }
}
