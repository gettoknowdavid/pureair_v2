import 'package:dartz/dartz.dart';

import 'entities/user.dart';
import 'failures/auth_failure.dart';
import 'value_objects/value_objects.dart';

/// An interface that defines the contract for an authentication facade.
abstract class IAuthFacade {
  /// Returns a stream of [User] objects representing the current user's authentication state.
  Stream<User?> get authStateChanges;

  /// Checks if the current user's email address is verified.
  ///
  /// Returns a [Future] that completes with an [Option] containing either an [AuthFailure] or a [bool] value indicating whether the email is verified.
  bool? get isEmailVerified;

  /// Gets the currently signed-in user.
  ///
  /// Returns a [Future] that completes with a [User] object representing the current user, or `null` if there is no authenticated user.
  User? get currentUser;

  /// Signs in the user using their Google account.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure] or `Unit` if the operation was successful.
  Future<Either<AuthFailure, Unit>> googleLogin();

  /// Signs in the user using their email address and password.
  ///
  /// [email] and [password] are required.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure] or `Unit` if the operation was successful.
  Future<Either<AuthFailure, Unit>> login({
    required Email email,
    required Password password,
  });

  /// Signs out the current user.
  ///
  /// Returns a [Future] that completes when the operation is complete.
  Future<void> logout();

  /// Registers a new user with the specified [name], [email], and [password].
  ///
  /// [name], [email], and [password] are required.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure] or `Unit` if the operation was successful.
  Future<Either<AuthFailure, Unit>> register({
    required Name name,
    required Email email,
    required Password password,
  });

  /// Reloads the current user's information.
  ///
  /// Returns a [Future] that completes when the operation is complete.
  Future<void> reload();

  /// Sends a password reset email to the specified [email].
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure] or `Unit` if the operation was successful.
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(Email email);

  /// Sends a verification email to the current user's email address.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthFailure] or `Unit` if the operation was successful.
  Future<Either<AuthFailure, Unit>> sendVerificationEmail();
}
