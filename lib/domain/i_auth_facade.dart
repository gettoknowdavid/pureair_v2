import 'package:dartz/dartz.dart';

import 'core/core.dart';
import 'entities/entities.dart';
import 'errors/errors.dart';

/// An interface that defines the contract for an authentication facade.
abstract class IAuthFacade {
  /// Returns a stream of [User] objects representing the current user's authentication state.
  Stream<User?> authStateChanges();

  /// Checks if the current user's email address is verified.
  ///
  /// Returns a [Future] that completes with an [Option] containing either an [AuthError] or a [bool] value indicating whether the email is verified.
  Future<Option<Either<AuthError, bool>>> checkEmailVerified();

  /// Gets the currently signed-in user.
  ///
  /// Returns a [Future] that completes with a [User] object representing the current user, or `null` if there is no authenticated user.
  Future<User?> currentUser();

  /// Signs in the user using their Google account.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthError] or `Unit` if the operation was successful.
  Future<Either<AuthError, Unit>> googleLogin();

  /// Signs in the user using their email address and password.
  ///
  /// [email] and [password] are required.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthError] or `Unit` if the operation was successful.
  Future<Either<AuthError, Unit>> login({
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
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthError] or `Unit` if the operation was successful.
  Future<Either<AuthError, Unit>> register({
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
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthError] or `Unit` if the operation was successful.
  Future<Either<AuthError, Unit>> sendPasswordResetEmail(Email email);

  /// Sends a verification email to the current user's email address.
  ///
  /// Returns a [Future] that completes with an [Either] object containing either an [AuthError] or `Unit` if the operation was successful.
  Future<Either<AuthError, Unit>> sendVerificationEmail();
}
