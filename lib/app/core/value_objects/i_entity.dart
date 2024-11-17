import 'package:pureair_v2/app/core/value_objects/uid.dart';

abstract class IEntity<T> {
  Uid<T> get uid;
}
