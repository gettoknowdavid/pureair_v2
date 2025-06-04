part of 'auth_bloc.dart';

enum AuthStatus {
  inProgress,
  unauthenticated,
  authenticated,
  unverified,
  failure,
}

final class AuthState with EquatableMixin {
  AuthState({
    User? user,
  }) : this._(user: user ?? User.empty, status: _status(user));

  const AuthState._({required this.user, required this.status});

  final User user;
  final AuthStatus status;

  @override
  List<Object?> get props => [user, status];
}

AuthStatus _status(User? user) {
  if (user == null || user == User.empty) return AuthStatus.unauthenticated;
  if (!user.emailVerified) return AuthStatus.unverified;
  return AuthStatus.authenticated;
}

extension AuthStatusX on AuthStatus {
  String get redirectPath {
    return switch (this) {
      AuthStatus.inProgress => R.root,
      AuthStatus.failure => R.signIn,
      AuthStatus.unauthenticated => R.signIn,
      AuthStatus.unverified => R.verifyEmail,
      AuthStatus.authenticated => R.home,
    };
  }

  List<String> get allowedPaths {
    return switch (this) {
      AuthStatus.inProgress => [R.root],
      AuthStatus.failure => [R.signIn],
      AuthStatus.unauthenticated => [
          R.signIn,
          R.signUp,
          R.forgotPassword,
          R.passwordResetConfirmation,
        ],
      AuthStatus.unverified => [
          R.verifyEmail,
          R.signIn,
          R.signUp,
          R.forgotPassword,
          R.passwordResetConfirmation,
        ],
      AuthStatus.authenticated => [
          R.home,
          R.explore,
          R.ranks,
          R.profile,
          R.details,
          R.addCity,
        ],
    };
  }

  bool get isInProgress => this == AuthStatus.inProgress;
  bool get isUnauthenticated => this == AuthStatus.unauthenticated;
  bool get isAuthenticated => this == AuthStatus.authenticated;
  bool get isUnverified => this == AuthStatus.unverified;
  bool get isFailure => this == AuthStatus.failure;
}

// sealed class AuthState with EquatableMixin {
//   const AuthState();

//   @override
//   List<Object?> get props => [];
// }

// final class AuthInitial extends AuthState {
//   const AuthInitial();
// }

// final class AuthUnauthenticated extends AuthState {
//   const AuthUnauthenticated();
// }

// final class AuthUnverified extends AuthState {
//   const AuthUnverified(this.user);
//   final User user;

//   @override
//   List<Object?> get props => [user];
// }

// final class AuthAuthenticated extends AuthState {
//   const AuthAuthenticated(this.user);
//   final User user;

//   @override
//   List<Object?> get props => [user];
// }

// final class AuthFailure extends AuthState {
//   const AuthFailure(this.exception);
//   final PureAirException exception;

//   @override
//   List<Object?> get props => [exception];
// }
