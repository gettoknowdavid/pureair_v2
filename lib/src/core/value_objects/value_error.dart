import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/core/value_objects/value_failure.dart';

part 'value_error.freezed.dart';

@freezed
class ValueError with _$ValueError {
  @Implements<Exception>()
  const factory ValueError.unexpectedError(
    ValueFailure<dynamic> failure,
  ) = UnexpectedValueError;

  @override
  String toString() {
    return when(
      unexpectedError: (failure) {
        const message = 'Encountered an unexpected ValueFailure. Terminating.';
        return Error.safeToString('$message Failure was: $failure');
      },
    );
  }
}
