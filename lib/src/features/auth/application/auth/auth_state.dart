part of 'auth_notifier.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.unverified(User user) = Unverified;
  const factory AuthState.authenticated(User user) = Authenticated;
  const factory AuthState.failure(AuthException exception) = AuthFailed;
}

extension AuthStateX on AuthState {
  String get redirectPath {
    return maybeWhen(
      orElse: () => R.login,
      unverified: (user) => R.verifyEmail,
      authenticated: (user) => R.home,
    );
  }

  List<String> get allowedPaths {
    return maybeWhen(
      initial: ()=> [R.root],
      orElse: () => [
        R.login,
        R.register,
        R.forgotPassword,
        R.passwordResetConfirmation,
      ],
      unverified: (_) => [
        R.verifyEmail,
        R.login,
        R.register,
        R.forgotPassword,
        R.passwordResetConfirmation,
      ],
      authenticated: (_) => [
        R.home,
        R.explore,
        R.ranks,
        R.profile,
      ],
    );
  }
}
