import 'package:equatable/equatable.dart';

sealed class ValueException<T> with EquatableMixin implements Exception {
  const ValueException({required this.code, required this.message});

  final String code;
  final String message;

  @override
  List<Object?> get props => [code, message];
}

final class UnexpectedValueException<T> extends ValueException<T> {
  const UnexpectedValueException({
    super.code = 'unexpected',
    super.message = 'An unexpected exception occurred.',
  });
}

final class RequiredValueException<T> extends ValueException<T> {
  const RequiredValueException({
    super.code = 'required-value',
    super.message = 'This value cannot be empty.',
  });
}

final class EmptyValueException<T> extends ValueException<T> {
  const EmptyValueException({
    super.code = 'empty',
    super.message = 'This value cannot be empty',
  });
}

final class InvalidValueException<T> extends ValueException<T> {
  const InvalidValueException({
    super.code = 'invalid-value',
    super.message = 'Invalid value.',
  });
}

final class MaxLinesExceededValueException<T> extends ValueException<T> {
  const MaxLinesExceededValueException(
    this.value,
    this.maxLines, {
    super.code = 'max-lines-exceeded',
    super.message = 'Number of valid lines has been exceeded.',
  });

  final T value;
  final int maxLines;
}

final class InvalidFileFormatException<T> extends ValueException<T> {
  const InvalidFileFormatException(
    this.value, {
    super.code = 'invalid-format',
    super.message = 'The file format selected is invalid.',
  });

  final T value;
}
