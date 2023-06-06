import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/core.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    Name? name,
    Email? email,
    bool? emailVerified,
    String? avatar,
  }) = _User;

  factory User.empty() {
    return const User(
      uid: '',
      name: null,
      email: null,
      avatar: null,
      emailVerified: false,
    );
  }
}
