part of 'verify_email_notifier.dart';

@freezed
class VerifyEmailState with _$VerifyEmailState {
  const factory VerifyEmailState.initial() = VerifyEmailInitial;
  const factory VerifyEmailState.inProgress() = VerifyEmailInProgress;
  const factory VerifyEmailState.verified() = EmailVerified;
  const factory VerifyEmailState.unverified() = EmailUnverified;
  const factory VerifyEmailState.sendingMail() = SendingVerification;
  const factory VerifyEmailState.mailSent(
    EmailAddress emailAddress,
  ) = VerificationMailSent;
  const factory VerifyEmailState.failure(
    AuthException exception,
  ) = VerifyEmailFailure;
}
