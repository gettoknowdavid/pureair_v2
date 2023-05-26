part of 'forgot_password_cubit.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required Email email,
    required bool loading,
    required bool showError,
    required bool status,
    required Option<Either<AuthError, Unit>> option,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() {
    return ForgotPasswordState(
      email: Email(''),
      loading: false,
      showError: false,
      status: false,
      option: none(),
    );
  }
}
