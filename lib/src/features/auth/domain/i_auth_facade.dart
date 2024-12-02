import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

abstract class IAuthFacade {
  Stream<User?> get userChanges;

  Future<Either<AuthException, Unit>> signIn({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthException, Unit>> signInWithGoogle();

  Future<void> signOut();

  Future<Either<AuthException, Unit>> signUp({
    required FullName fullName,
    required EmailAddress emailAddress,
    required Password password,
  });
}
