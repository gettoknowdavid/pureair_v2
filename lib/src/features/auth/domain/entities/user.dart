import 'package:freezed_annotation/freezed_annotation.dart';

import '../value_objects/value_objects.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    Name? displayName,
    Email? email,
    bool? emailVerified,
    String? photoURL,
  }) = _User;

  factory User.empty() {
    return const User(
      uid: '',
      displayName: null,
      email: null,
      photoURL: null,
      emailVerified: false,
    );
  }
}
