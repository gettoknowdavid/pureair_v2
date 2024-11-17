import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty() = Empty<T>;
  const factory ValueFailure.invalidEmail() = InvalidEmail<T>;
  const factory ValueFailure.invalidImageType() = InvalidImageType<T>;
  const factory ValueFailure.invalidPassword() = InvalidPassword<T>;
}
