import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

class AuthFacade implements IAuthFacade {
  AuthFacade({
    required fa.FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final fa.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  User? get user => _firebaseAuth.currentUser?.toDomain;

  @override
  Stream<User?> get userChanges {
    final stream = _firebaseAuth.userChanges().map((authUser) {
      if (authUser == null) return null;
      return authUser.toDomain;
    });
    return stream;
  }

  @override
  Future<Option<bool>> checkVerificationStatus() async {
    if (_firebaseAuth.currentUser == null) return const None();
    await _firebaseAuth.currentUser!.reload();
    final isEmailVerified = _firebaseAuth.currentUser!.emailVerified;
    return Some(isEmailVerified);
  }

  @override
  Future<Either<AuthException, EmailAddress>> sendPasswordResetEmail(
    EmailAddress emailAddress,
  ) async {
    try {
      final emailStr = emailAddress.value.getOrElse(() => 'Invalid email');
      await _firebaseAuth.sendPasswordResetEmail(email: emailStr);
      return right(emailAddress);
    } on fa.FirebaseAuthException catch (e) {
      return left(AuthMessageException(e.message ?? 'Unknown error'));
    } catch (e) {
      return left(AuthMessageException(e.toString()));
    }
  }

  @override
  Future<Either<AuthException, EmailAddress>> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
      final emailAddress = EmailAddress(_firebaseAuth.currentUser!.email!);
      return right(emailAddress);
    } on fa.FirebaseAuthException catch (e) {
      return left(AuthMessageException(e.message ?? 'Unknown error'));
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
        case 'invalid-credential':
          return left(const InvalidEmailOrPasswordException());
        default:
          return left(AuthMessageException(e.message ?? 'Unknown error'));
      }
    } catch (e) {
      return left(AuthMessageException(e.toString()));
    }
  }

  @override
  Future<Either<AuthException, Unit>> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final googleUser = await _googleSignIn.signIn().catchError((_) => null);

      if (googleUser == null) return left(const AuthCanceledException());

      final googleAuthentication = await googleUser.authentication;
      final credential = fa.GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      return right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'operation-not-allowed':
          return left(const AuthPermissionDenied());
        default:
          return left(AuthMessageException(e.message ?? 'Unknown error'));
      }
    } catch (e) {
      return left(AuthException.message(e.toString()));
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);

  @override
  Future<Either<AuthException, Unit>> signUp({
    required FullName fullName,
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

      await user.reload();
      final fullNameStr = fullName.value.getOrElse(() => 'Invalid full name');
      await user.updateDisplayName(fullNameStr);

      return right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
        case 'invalid-email':
          return left(const EmailAddressInUseException());
        default:
          return left(AuthMessageException(e.message ?? 'Unknown error'));
      }
    } catch (e) {
      return left(AuthMessageException(e.toString()));
    }
  }
}
