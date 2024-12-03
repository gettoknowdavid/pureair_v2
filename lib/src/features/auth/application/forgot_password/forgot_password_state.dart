part of 'forgot_password_notifier.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = ForgotPasswordInitial;
  const factory ForgotPasswordState.sendingPasswordResetEmail() =
      SendingPasswordResetEmail;
  const factory ForgotPasswordState.passwordResetEmailSent(
    EmailAddress emailAddress,
  ) = PasswordResetEmailSent;
  const factory ForgotPasswordState.failure(
    AuthException exception,
  ) = ForgotPasswordFailure;
}
