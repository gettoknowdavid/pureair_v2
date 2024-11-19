import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/app/auth/domain/value_objects/email_address.dart';
import 'package:pureair_v2/app/core/value_objects/i_entity.dart';
import 'package:pureair_v2/app/core/value_objects/single_line_string.dart';
import 'package:pureair_v2/app/core/value_objects/uid.dart';
import 'package:pureair_v2/app/core/value_objects/value_failure.dart';

part 'user.freezed.dart';

@freezed
class User with _$User implements IEntity<User> {
  const factory User({
    required Uid<User> uid,
    required SingleLineString fullName,
    required EmailAddress emailAddress,
    String? imageUrl,
  }) = _User;
}

extension UserX on User {
  Option<ValueFailure<dynamic>> get failureOption {
    return fullName.failureOrUnit
        .andThen(emailAddress.failureOrUnit)
        .fold(some, (r) => none());
  }
}
