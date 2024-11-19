import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:pureair_v2/app/auth/domain/domain.dart';
import 'package:pureair_v2/app/auth/domain/entities/user.dart';
import 'package:pureair_v2/app/core/value_objects/single_line_string.dart';
import 'package:pureair_v2/app/core/value_objects/uid.dart';

extension FirebaseExtensions on fa.User {
  User get toDomain {
    return User(
      uid: Uid<User>.fromString(uid),
      fullName: SingleLineString(displayName!),
      emailAddress: EmailAddress(email!),
      imageUrl: photoURL,
    );
  }
}
