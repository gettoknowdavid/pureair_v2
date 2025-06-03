import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/shared/value_objects/value_objects.dart';

final class User with EquatableMixin implements IEntity {
  const User({
    required this.uid,
    required this.fullName,
    required this.emailAddress,
    required this.emailVerified,
    this.imageUrl,
  });

  static User empty = User(
    uid: ID.fromString(''),
    fullName: SingleLineString(''),
    emailAddress: EmailAddress(''),
    emailVerified: false,
  );

  // factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  final ID uid;
  final SingleLineString fullName;
  final EmailAddress emailAddress;
  final bool emailVerified;
  final String? imageUrl;

  @override
  List<Object?> get props => [
        uid,
        fullName,
        emailAddress,
        emailVerified,
        imageUrl,
      ];

  // Map<String, dynamic> toJson() => _$UserToJson(this);
}

extension UserX on User {
  Option<ValueException<dynamic>> get failureOption {
    return fullName.failureOrUnit
        .andThen(emailAddress.failureOrUnit)
        .fold(some, (r) => none());
  }
}
