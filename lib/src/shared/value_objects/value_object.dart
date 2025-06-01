import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:pureair_v2/src/shared/value_objects/value_exception.dart';

abstract class IValueObject {
  bool get isValid;
}

@immutable
abstract class ValueObject<T> implements IValueObject {
  const ValueObject();

  Either<ValueException<T>, T> get value;

  Either<ValueException<T>, Unit> get failureOrUnit {
    return value.fold(left, (_) => right(unit));
  }

  T get getOrCrash => value.fold((failure) => throw failure, id);

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
