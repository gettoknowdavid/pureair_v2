part of 'verify_email_cubit.dart';

enum VerifyEmailStatus {
  initial,
  inProgress,
  verified,
  unverified,
  emailSendInProgress,
  emailSendSuccess,
  failure,
}

final class VerifyEmailState with EquatableMixin {
  VerifyEmailState() : this._(email: EmailAddress(''));

  const VerifyEmailState._({
    required this.email,
    this.status = VerifyEmailStatus.initial,
    this.exception,
  });

  VerifyEmailState withEmail(String email) {
    return VerifyEmailState._(email: EmailAddress(email));
  }

  VerifyEmailState withEmailSendInProgress() {
    return VerifyEmailState._(
      email: email,
      status: VerifyEmailStatus.emailSendInProgress,
    );
  }

  VerifyEmailState withEmailSendSuccess(EmailAddress emailAddress) {
    return VerifyEmailState._(
      email: emailAddress,
      status: VerifyEmailStatus.emailSendSuccess,
    );
  }

  VerifyEmailState withVerifyEmailInProgress() {
    return VerifyEmailState._(
      email: email,
      status: VerifyEmailStatus.inProgress,
    );
  }

  VerifyEmailState withVerifiedOption([bool isVerified = false]) {
    return VerifyEmailState._(
      email: email,
      status: isVerified
          ? VerifyEmailStatus.verified
          : VerifyEmailStatus.unverified,
    );
  }

  VerifyEmailState withFailure([PureAirException? exception]) {
    return VerifyEmailState._(
      email: email,
      status: VerifyEmailStatus.failure,
      exception: exception,
    );
  }

  final EmailAddress email;
  final VerifyEmailStatus status;
  final PureAirException? exception;

  @override
  List<Object?> get props => [email, status, exception];
}
