part of 'auth_bloc.dart';

/// The state of the authentication feature.
///
/// This class defines the different states that the authentication feature can
/// be in. It uses sealed classes for creating and comparing these states.
///
/// To create a new instance of the class, use one of the factory constructors
/// provided, such as `AuthState.loading()` or `AuthState.authenticated(user)`.
@freezed
class AuthState with _$AuthState {
  /// The state when the authentication feature is in the process of loading.
  const factory AuthState.loading() = _Loading;

  /// The state when the user is authenticated.
  const factory AuthState.authenticated(User user) = _Authenticated;
  
  /// The state when the user is registered/created.
  const factory AuthState.registered(User user) = _Registered;

  /// The state when the user is not authenticated.
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// The state when the user is verified.
  const factory AuthState.verified() = _Verified;

  /// The state when the user is not verified.
  const factory AuthState.unverified() = _Unverified;
}
