import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pureair_v2/app/core/value_objects/value_error.dart';
import 'package:pureair_v2/app/core/value_objects/value_failure.dart';

abstract class IValueObject {
  bool get isValid;
}

@immutable
abstract class ValueObject<T> implements IValueObject {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  Either<ValueFailure<T>, Unit> get failureOrUnit {
    return value.fold(left, (_) => right(unit));
  }

  T get getOrCrash {
    return value.fold(
      (failure) => throw UnexpectedValueError(failure),
      id,
    );
  }

  T getOrElse(T dflt) => value.getOrElse(() => dflt);

  @override
  bool get isValid => value.isRight();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  String toString() => 'Value($value)';
}
