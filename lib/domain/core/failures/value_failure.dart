import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

/// The [ValueFailure] class is a union type that represents the different types
/// of failures that can occur when validating a value object. It is
/// implemented using the freezed package, which generates the necessary code
/// for making the class immutable and generating the different types
/// of failures.
@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  /// Represents the failure that occurs when a value is empty.
  const factory ValueFailure.empty([T? f]) = _Empty<T>;

  /// Represents the failure that occurs when a value is not a valid email.
  const factory ValueFailure.invalidEmail([T? f]) = _InvalidEmail<T>;

  /// Represents the failure that occurs when a value is not a valid password.
  const factory ValueFailure.invalidPassword([T? f]) = _InvalidPassword<T>;
}