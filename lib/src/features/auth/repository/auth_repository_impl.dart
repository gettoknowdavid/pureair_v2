import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/value_objects/value_objects.dart';

@Injectable(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required fa.FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  final fa.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  @override
  Future<Option<bool>> checkVerificationStatus() async {
    if (_firebaseAuth.currentUser == null) return const None();
    await _firebaseAuth.currentUser!.reload();
    final isEmailVerified = _firebaseAuth.currentUser!.emailVerified;
    return Some(isEmailVerified);
  }

  @override
  Future<Either<PureAirException, EmailAddress>> sendPasswordResetEmail(
    EmailAddress email,
  ) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email.getOrCrash);
      return Right(email);
    } on fa.FirebaseAuthException catch (e) {
      return Left(PureAirException(e.message ?? 'Unknown error'));
    } on Exception catch (e) {
      return Left(PureAirException(e.toString()));
    }
  }

  @override
  Future<Either<PureAirException, EmailAddress>> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser?.sendEmailVerification();
      final emailAddress = EmailAddress(_firebaseAuth.currentUser!.email!);
      return Right(emailAddress);
    } on fa.FirebaseAuthException catch (e) {
      return Left(PureAirException(e.message ?? 'Unknown error'));
    } on Exception catch (e) {
      return Left(PureAirException(e.toString()));
    }
  }

  @override
  Future<Either<PureAirException, Unit>> signIn({
    required EmailAddress email,
    required Password password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email.getOrCrash,
        password: password.getOrCrash,
      );
      return const Right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
        case 'invalid-credential':
          return const Left(InvalidEmailOrPasswordException());
        default:
          return Left(PureAirException(e.message ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      return Left(PureAirException(e.toString()));
    }
  }

  @override
  Future<Either<PureAirException, Unit>> signInWithGoogle() async {
    try {
      await _googleSignIn.signOut();
      final googleUser = await _googleSignIn.signIn().catchError((_) => null);

      if (googleUser == null) return const Left(ActionCanceledException());

      final googleAuthentication = await googleUser.authentication;
      final credential = fa.GoogleAuthProvider.credential(
        accessToken: googleAuthentication.accessToken,
        idToken: googleAuthentication.idToken,
      );

      await _firebaseAuth.signInWithCredential(credential);
      return const Right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'operation-not-allowed':
          return const Left(PermissionDeniedException());
        default:
          return Left(PureAirException(e.message ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      return Left(PureAirException(e.toString()));
    }
  }

  @override
  Future<void> signOut() {
    return Future.wait([
      _firebaseAuth.signOut(),
      _googleSignIn.signOut(),
    ]);
  }

  @override
  Future<Either<PureAirException, Unit>> signUp({
    required SingleLineString fullName,
    required EmailAddress email,
    required Password password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.getOrCrash,
        password: password.getOrCrash,
      );
      final user = credential.user;
      if (user == null) return const Left(ActionCanceledException());

      await user.reload();
      final fullNameStr = fullName.value.getOrElse(() => 'Invalid full name');
      await user.updateDisplayName(fullNameStr);

      return const Right(unit);
    } on fa.FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
        case 'invalid-email':
          return const Left(EmailAlreadyInUseException());
        default:
          return Left(PureAirException(e.message ?? 'Unknown error'));
      }
    } on Exception catch (e) {
      return Left(PureAirException(e.toString()));
    }
  }

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
}
