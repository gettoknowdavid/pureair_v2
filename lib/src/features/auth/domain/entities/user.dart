import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/shared/value_objects/value_objects.dart';

final class User with EquatableMixin implements IEntity {
  const User({
    required this.uid,
    required this.fullName,
    required this.email,
    required this.emailVerified,
    this.imageUrl,
  });

  @override
  final ID uid;
  final SingleLineString fullName;
  final EmailAddress email;
  final bool emailVerified;
  final String? imageUrl;

  @override
  List<Object?> get props => [uid, fullName, email, emailVerified, imageUrl];
}


extension UserX on User {
  Option<ValueException<dynamic>> get failureOption {
    return fullName.failureOrUnit
        .andThen(email.failureOrUnit)
        .fold(some, (r) => none());
  }
}
