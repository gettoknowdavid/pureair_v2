import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/value_objects/value_objects.dart';

abstract class AuthRepository {
  Stream<User?> get userChanges;

  User? get user;

  Future<Option<bool>> checkVerificationStatus();

  Future<Either<PureAirException, EmailAddress>> sendPasswordResetEmail(
    EmailAddress email,
  );

  Future<Either<PureAirException, EmailAddress>> sendVerificationEmail();

  Future<Either<PureAirException, Unit>> signIn({
    required EmailAddress email,
    required Password password,
  });

  Future<Either<PureAirException, Unit>> signInWithGoogle();

  Future<void> signOut();

  Future<Either<PureAirException, Unit>> signUp({
    required SingleLineString fullName,
    required EmailAddress email,
    required Password password,
  });
}
