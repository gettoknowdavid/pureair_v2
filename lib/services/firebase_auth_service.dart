import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

const Duration _limit = Duration(seconds: 30);

FirebaseAuthException _getError(e) {
  return FirebaseAuthException(
    code: e.code,
    message: e.message,
    credential: e.credential,
    email: e.email,
    phoneNumber: e.phoneNumber,
    tenantId: e.tenantId,
  );
}

/// A service that provides access to Firebase Authentication.
@injectable
class FirebaseAuthService {
  /// The Firebase Authentication instance.
  final FirebaseAuth _firebaseAuth;

  /// Creates a new instance of the FirebaseAuthService.
  FirebaseAuthService(this._firebaseAuth);

  /// Gets the current user.
  User? get currentUser => _firebaseAuth.currentUser;

  /// Checks if the current user is signed in.
  bool get isSignedIn => _firebaseAuth.currentUser != null;

  /// Checks if the current signed in user is verified.
  bool? get isVerified => _firebaseAuth.currentUser?.emailVerified;

  /// Notifies about changes to the user's sign-in state (such as sign-in or sign-out).
  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

  /// If the current user is signed in, it refreshes
  Future<void> reload() async {
    try {
      await _firebaseAuth.currentUser?.reload().timeout(_limit);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  /// Sends a password reset email to the given [email] address.
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email).timeout(_limit);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  /// Sends a verification email to a user.
  Future<void> sendVerificationEmail() async {
    try {
      await _firebaseAuth.currentUser?.reload();
      return await _firebaseAuth.currentUser
          ?.sendEmailVerification()
          .timeout(_limit);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  /// Signs in the user with the given [email] and [password].
  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(_limit);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  /// Signs in the user with the given Google credentials.
  Future<UserCredential> signInWithGoogle() async {
    try {
      return await _firebaseAuth.signInWithProvider(GoogleAuthProvider());
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  /// Signs out the current user.
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut().timeout(_limit);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  /// Signs up a new user with the given [name], [email] and [password].
  Future<UserCredential> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      return await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await _firebaseAuth.currentUser?.updateDisplayName(name);
        await _firebaseAuth.currentUser?.reload();
        return value;
      }).timeout(_limit);
    } on FirebaseAuthException catch (e) {
      throw _getError(e);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }

  Future<void> updateName(String name) async {
    try {
      return await _firebaseAuth.currentUser
          ?.updateDisplayName(name)
          .timeout(_limit);
    } on TimeoutException catch (e) {
      throw TimeoutException(e.message);
    }
  }
}
