import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:pureair_v2/src/core/value_objects/single_line_string.dart';
import 'package:pureair_v2/src/core/value_objects/uid.dart';
import 'package:pureair_v2/src/features/auth/domain/domain.dart';

extension FirebaseExtensions on fa.User {
  User get toDomain {
    return User(
      uid: Uid<User>.fromString(uid),
      fullName: SingleLineString(displayName ?? email!),
      emailAddress: EmailAddress(email!),
      imageUrl: photoURL,
    );
  }
}
