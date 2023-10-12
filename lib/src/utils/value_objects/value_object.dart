import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import 'value_failure.dart';



@immutable

/// Abstract class for value objects.
abstract class ValueObject<T> {
  const ValueObject();

  @override
  int get hashCode => value.hashCode;

  /// Returns an [Either] object that contains either a [ValueFailure] or the value object of type T.
  Either<ValueFailure<T>, T> get value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  /// Returns the value object of type T, or throws an [UnexpectedValueError] containing the [ValueFailure].
  T? get() => value.fold((l) => l.mapOrNull(), id);

  /// Returns the value object of type T if it's valid, or returns the default value passed as a parameter.
  T getOrElse(T dflt) => value.getOrElse(() => dflt);

  /// Returns a boolean value indicating if the value object of type T is valid.
  bool isValid() => value.isRight();

  @override
  String toString() => 'Value($value)';
}
