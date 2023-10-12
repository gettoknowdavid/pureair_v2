part of 'login_form_cubit.dart';

@freezed
class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    required Email email,
    required Password password,
    required bool showError,
    required bool loading,
    required bool googleSignInLoading,
    required Option<Either<AuthFailure, Unit>> option,
  }) = _LoginFormState;

  factory LoginFormState.initial() {
    return LoginFormState(
      email: Email(''),
      password: Password(''),
      showError: false,
      loading: false,
      googleSignInLoading: false,
      option: none(),
    );
  }
}
