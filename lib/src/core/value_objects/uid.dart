import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/core/value_objects/value_failure.dart';
import 'package:pureair_v2/src/core/value_objects/value_object.dart';
import 'package:uuid/uuid.dart';

class Uid<E> extends ValueObject<String> {
  factory Uid() => Uid._(right(const Uuid().v1()));

  factory Uid.fromString(String uidString) => Uid._(right(uidString));

  const Uid._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
