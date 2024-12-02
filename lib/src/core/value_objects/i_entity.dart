import 'package:pureair_v2/src/core/value_objects/uid.dart';

abstract class IEntity<T> {
  Uid<T> get uid;
}
