import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/services/services.dart';

import 'datasources/datasources.dart';
import 'dtos/dtos.dart';

@Injectable(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  final FirebaseAuthService _authService;
  final AuthLocalDatasource _localDatasource;

  AuthFacade(this._authService, this._localDatasource);

  /// Returns a stream of authenticated user changes.
  ///
  /// The method maps the Firebase [User] object to a User object using the _mapper's toDomain method.
  ///
  /// @return a Stream object which emits a User object or null depending on the user's authentication state changes.
  @override
  Stream<User?> authStateChanges() {
    return _authService.authStateChanges().map((fUser) {
      if (fUser == null) {
        return null;
      } else {
        return User(
          uid: fUser.uid,
          email: fUser.email == null ? null : Email(fUser.email!),
          name: fUser.displayName == null ? null : Name(fUser.displayName!),
          avatar: fUser.photoURL,
          emailVerified: fUser.emailVerified,
        );
      }
    });
  }

  /// A method that checks if the user's email is verified by reloading the user's
  /// information from Firebase authentication and returning an [Either] indicating whether the email is verified or not.
  ///
  /// If the user is not logged in, returns an [Option] with null value.
  ///
  /// @return A [Future] that returns an [Option] of [Either] where the right value indicates email is verified and the left value is an [AuthError] indicating the email is not verified.
  @override
  Future<Option<Either<AuthError, bool>>> checkEmailVerified() async {
    if (!_authService.isSignedIn) {
      return optionOf(null);
    }

    await _authService.reload();

    if (_authService.isVerified == true) {
      return optionOf(right(true));
    } else {
      return optionOf(left(const AuthError.notVerified()));
    }
  }

  @override
  Future<User?> currentUser() async {
    final fUser = _authService.currentUser;
    if (fUser == null) {
      return null;
    } else {
      return User(
        uid: fUser.uid,
        email: fUser.email == null ? null : Email(fUser.email!),
        name: fUser.displayName == null ? null : Name(fUser.displayName!),
        avatar: fUser.photoURL,
        emailVerified: fUser.emailVerified,
      );
    }
  }

  /// Logs in the user using their Google account credentials.
  ///
  /// Returns [AuthError.noNetworkConnection()] if there is no network connection,
  /// [AuthError.noGoogleAccount()] if the user's Google account cannot be accessed,
  /// or [AuthError.serverError()] if there is a server-side error.
  /// Otherwise, returns [unit] if the user is successfully logged in.
  @override
  Future<Either<AuthError, Unit>> googleLogin() async {
    try {
      throw UnimplementedError();
    } on FirebaseAuthException {
      // Return an error if the user's Google account cannot be accessed
      return left(const AuthError.noGoogleAccount());
    } on TimeoutException {
      return left(const AuthError.timeOut());
    } on Exception catch (_) {
      // Return a server error if any other exception occurs
      return left(const AuthError.serverError());
    }
  }

  /// Tries to log in the user with the given email and password.
  /// Returns [right(unit)] if the user is successfully logged in.
  /// Otherwise, returns [left] with an [AuthError] indicating the reason
  /// for the failure.
  @override
  Future<Either<AuthError, Unit>> login({
    required Email email,
    required Password password,
  }) async {
    try {
      // Attempt to sign in using Firebase Authentication.
      final result = await _authService.signIn(email.get()!, password.get()!);

      // Get the user data from Firestore and store it in local storage.
      final userDto = (await usersRef.doc(result.user!.uid).get()).data;
      await _localDatasource.storeUser(userDto);

      return right(unit);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'wrong-password':
        case 'user-not-found':
          return left(const AuthError.invalidEmailOrPassword());
        default:
          return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.timeOut());
    }
  }

  /// Logs the user out by deleting their data from storage and signing them out
  @override
  Future<void> logout() async {
    try {
      // Wait for both the storage and authentication operations to complete
      await Future.wait([_localDatasource.delete(), _authService.signOut()]);
    } on TimeoutException {
      throw TimeoutException('Server error');
    }
  }

  /// Registers a new user with the given name, email, and password
  ///
  /// Returns [AuthError.noNetworkConnection] if there is no network connection,
  /// [AuthError.emailInUse] if the email is already in use, or [AuthError.serverError] if
  /// there is an error with the server. Otherwise, returns [Unit].
  @override
  Future<Either<AuthError, Unit>> register({
    required Name name,
    required Email email,
    required Password password,
  }) async {
    try {
      final res = await _authService.signUp(
        email: email.get()!,
        password: password.get()!,
        name: name.get()!,
      );

      if (res.user == null) {
        return left(const AuthError.cannotComplete());
      }

      // Create a new UserDto object and add it to the Firestore users collection
      final user = UserDto(
        uid: res.user!.uid,
        name: res.user!.displayName!,
        email: res.user!.email!,
        emailVerified: res.user!.emailVerified,
      );

      await usersRef.doc(user.uid).set(user);

      // Store the user in local storage
      await _localDatasource.storeUser(user);

      // Send a verification email to the user
      await _authService.sendVerificationEmail();

      // Return the right value (unit)
      return right(unit);
    } on FirebaseAuthException catch (e) {
      // Handle any FirebaseAuthExceptions that may occur
      if (e.code == 'email-already-in-use') {
        return left(const AuthError.emailInUse());
      } else {
        return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.timeOut());
    }
  }

  /// Sends a password reset email to the specified email address.
  ///
  /// Returns [AuthError.noNetworkConnection()] if there is no internet connection.
  /// Returns [AuthError.userNotFound()] if there is no user with the specified email address.
  /// Returns [AuthError.invalidEmail()] if the email address is invalid.
  /// Returns [AuthError.serverError()] for other server-side errors.
  /// Returns [Unit] on successful execution.
  @override
  Future<Either<AuthError, Unit>> sendPasswordResetEmail(Email email) async {
    try {
      // Send password reset email using Firebase authentication.
      await _authService.sendPasswordResetEmail(email.get()!);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      // Handle specific Firebase authentication exceptions.
      switch (e.code) {
        case 'user-not-found':
          return left(const AuthError.userNotFound());
        case 'invalid-email':
          return left(const AuthError.invalidEmail());
        default:
          return left(const AuthError.serverError());
      }
    } on TimeoutException {
      return left(const AuthError.timeOut());
    }
  }

  @override
  Future<Either<AuthError, Unit>> sendVerificationEmail() async {
    try {
      await _authService.sendVerificationEmail();
      return right(unit);
    } on TimeoutException {
      return left(const AuthError.timeOut());
    } on Exception {
      return left(const AuthError.serverError());
    }
  }
}
