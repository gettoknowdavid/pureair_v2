import 'package:dartz/dartz.dart';
import 'package:pureair_v2/app/auth/domain/entities/user.dart';
import 'package:pureair_v2/app/auth/domain/exceptions/auth_exception.dart';
import 'package:pureair_v2/app/auth/domain/value_objects/email_address.dart';
import 'package:pureair_v2/app/auth/domain/value_objects/password.dart';
import 'package:pureair_v2/app/core/value_objects/single_line_string.dart';

abstract class IAuthFacade {
  Stream<User> get userChanges;

  Future<Either<AuthException, Unit>> register({
    required SingleLineString fullName,
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthException, Unit>> signIn({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthException, Unit>> signInWithGoogle();

  Future<void> signOut();
}
