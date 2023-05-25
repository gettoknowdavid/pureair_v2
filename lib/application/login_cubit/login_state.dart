part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required Email email,
    required Password password,
    required bool showError,
    required bool loading,
    required bool googleSignInLoading,
    required Option<Either<AuthError, Unit>> option,
  }) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      email: Email(''),
      password: Password(''),
      showError: false,
      loading: false,
      googleSignInLoading: false,
      option: none(),
    );
  }
}
