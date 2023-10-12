import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:injectable/injectable.dart';

import '../../../services/firebase_auth_service.dart';
import '../domain/entities/user.dart';
import '../domain/failures/auth_failure.dart';
import '../domain/i_auth_facade.dart';
import '../domain/value_objects/value_objects.dart';

@Injectable(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final FirebaseAuthService _firebase;

  AuthFacade(this._firebase);

  /// Returns a stream of authenticated user changes.
  ///
  /// The method maps the Firebase [User] object to a User object using the _mapper's toDomain method.
  ///
  /// @return a Stream object which emits a User object or null depending on the user's authentication state changes.
  @override
  Stream<User?> get authStateChanges =>
      _firebase.authStateChanges().map<User?>((fUser) => fUser?.toUser);

  /// A method that checks if the user's email is verified by reloading the user's
  /// information from Firebase authentication and returning an [Either] indicating whether the email is verified or not.
  ///
  /// If the user is not logged in, returns an [Option] with null value.
  ///
  /// @return A [Future] that returns an [Option] of [Either] where the right value indicates email is verified and the left value is an [AuthFailure] indicating the email is not verified.
  @override
  bool? get isEmailVerified => _firebase.isVerified;

  @override
  User? get currentUser => _firebase.currentUser!.toUser;

  /// Logs in the user using their Google account credentials.
  ///
  /// Returns [AuthFailure.noNetworkConnection()] if there is no network connection,
  /// [AuthFailure.noGoogleAccount()] if the user's Google account cannot be accessed,
  /// or [AuthFailure.serverError()] if there is a server-side error.
  /// Otherwise, returns [unit] if the user is successfully logged in.
  @override
  Future<Either<AuthFailure, Unit>> googleLogin() async {
    try {
      await _firebase.signInWithGoogle();
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Return an error if the user's Google account cannot be accessed
      return left(AuthFailure.error(e.message));
    } on TimeoutException {
      return left(const AuthFailure.timeOut());
    } on Exception catch (_) {
      // Return a server error if any other exception occurs
      return left(const AuthFailure.serverError());
    }
  }

  /// Tries to log in the user with the given email and password.
  /// Returns [right(unit)] if the user is successfully logged in.
  /// Otherwise, returns [left] with an [AuthFailure] indicating the reason
  /// for the failure.
  @override
  Future<Either<AuthFailure, Unit>> login({
    required Email email,
    required Password password,
  }) async {
    try {
      // Attempt to sign in using Firebase Authentication.
      await _firebase.signIn(email.get()!, password.get()!);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'wrong-password':
          return left(const AuthFailure.invalidEmailOrPassword());
        case 'user-not-found':
          return left(const AuthFailure.userNotFound());
        default:
          return left(const AuthFailure.serverError());
      }
    } on TimeoutException {
      return left(const AuthFailure.timeOut());
    }
  }

  /// Logs the user out by deleting their data from storage and signing them out
  @override
  Future<void> logout() async {
    try {
      // Wait for both the storage and authentication operations to complete
      await _firebase.signOut();
    } on TimeoutException {
      throw TimeoutException('Server error');
    }
  }

  /// Registers a new user with the given name, email, and password
  ///
  /// Returns [AuthFailure.noNetworkConnection] if there is no network connection,
  /// [AuthFailure.emailInUse] if the email is already in use, or [AuthFailure.serverError] if
  /// there is an error with the server. Otherwise, returns [Unit].
  @override
  Future<Either<AuthFailure, Unit>> register({
    required Name name,
    required Email email,
    required Password password,
  }) async {
    try {
      // Create account
      await _firebase.signUp(
        email: email.get()!,
        password: password.get()!,
      );

      await Future.wait([
        _firebase.reload(),
        _firebase.updateName(name.get()!),
        _firebase.sendVerificationEmail(),
      ]);

      // Return the right value (unit)
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Handle any firebase_auth.FirebaseAuthExceptions that may occur
      if (e.code == 'email-already-in-use') {
        return left(const AuthFailure.emailInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    } on TimeoutException {
      return left(const AuthFailure.timeOut());
    }
  }

  @override
  Future<void> reload() => _firebase.reload();

  /// Sends a password reset email to the specified email address.
  ///
  /// Returns [AuthFailure.noNetworkConnection()] if there is no internet connection.
  /// Returns [AuthFailure.userNotFound()] if there is no user with the specified email address.
  /// Returns [AuthFailure.invalidEmail()] if the email address is invalid.
  /// Returns [AuthFailure.serverError()] for other server-side errors.
  /// Returns [Unit] on successful execution.
  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(Email email) async {
    try {
      // Send password reset email using Firebase authentication.
      await _firebase.sendPasswordResetEmail(email.get()!);
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthFailure.userNotFound());
        case 'invalid-email':
          return left(const AuthFailure.invalidEmail());
        default:
          return left(const AuthFailure.serverError());
      }
    } on TimeoutException {
      return left(const AuthFailure.timeOut());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> sendVerificationEmail() async {
    try {
      await _firebase.sendVerificationEmail();
      return right(unit);
    } on TimeoutException {
      return left(const AuthFailure.timeOut());
    } on Exception {
      return left(const AuthFailure.serverError());
    }
  }
}

extension on firebase_auth.User {
  /// Maps a [firebase_auth.User] into a [User].
  User? get toUser {
    return User(
      uid: uid,
      email: email == null ? null : Email(email!),
      displayName: displayName == null ? null : Name(displayName!),
      photoURL: photoURL,
      emailVerified: emailVerified,
    );
  }
}
