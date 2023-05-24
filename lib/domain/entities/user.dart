import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/core.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required Name name,
    required Email email,
    required bool emailVerified,
    String? avatar,
  }) = _User;

  factory User.empty() {
    return User(
      uid: '',
      name: Name(''),
      email: Email(''),
      avatar: null,
      emailVerified: false,
    );
  }
}
