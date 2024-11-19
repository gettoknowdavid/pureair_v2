import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:pureair_v2/app/auth/domain/domain.dart';
import 'package:pureair_v2/app/auth/infrastructure/firebase_extensions.dart';
import 'package:pureair_v2/app/core/value_objects/single_line_string.dart';

class AuthFacade implements IAuthFacade {
  AuthFacade({
    required fa.FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final fa.FirebaseAuth _firebaseAuth;

  @override
  Future<Either<AuthException, Unit>> register({
    required SingleLineString fullName,
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailStr = emailAddress.value.getOrElse(() => 'Invalid email');
    final passwordStr = password.value.getOrElse(() => 'Invalid password');

    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailStr,
        password: passwordStr,
      );
      final user = credential.user;
      if (user == null) return left(const AuthCanceledException());

      final fullNameStr = fullName.value.getOrElse(() => 'Invalid full name');
      await user.updateDisplayName(fullNameStr);
      await user.reload();

      return right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return left(const EmailAddressInUseException());
        default:
          return left(const ServerException());
      }
    } catch (e) {
      return left(AuthMessageException(e.toString()));
    }
  }

  @override
  Future<Either<AuthException, Unit>> signIn({
    required EmailAddress emailAddress,
    required Password password,
  }) async {
    final emailStr = emailAddress.value.getOrElse(() => 'Invalid email');
    final passwordStr = password.value.getOrElse(() => 'Invalid password');

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: emailStr,
        password: passwordStr,
      );
      return right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          return left(const InvalidEmailOrPasswordException());
        default:
          return left(const ServerException());
      }
    } catch (e) {
      return left(AuthMessageException(e.toString()));
    }
  }

  @override
  Future<Either<AuthException, Unit>> signInWithGoogle() async {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() => _firebaseAuth.signOut();

  @override
  Stream<User?> get userChanges {
    final stream = _firebaseAuth.userChanges().map((authUser) {
      if (authUser == null) return null;
      return authUser.toDomain;
    });
    return stream;
  }
}
