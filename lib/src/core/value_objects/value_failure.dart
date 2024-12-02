import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty() = EmptyFailure<T>;
  const factory ValueFailure.invalidEmail() = InvalidEmailFailure<T>;
  const factory ValueFailure.invalidImageType() = InvalidImageTypeFailure<T>;
  const factory ValueFailure.invalidPassword() = InvalidPasswordFailure<T>;
  const factory ValueFailure.moreThanOneLine() = MoreThanOneLineFailure<T>;
}
