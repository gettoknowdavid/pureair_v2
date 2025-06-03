part of 'forgot_password_cubit.dart';

enum ForgotPasswordStatus {
  initial,
  emailSendInProgress,
  emailSendSuccess,
  failure,
}

final class ForgotPasswordState with EquatableMixin {
  ForgotPasswordState() : this._(email: EmailAddress(''));

  const ForgotPasswordState._({
    required this.email,
    this.status = ForgotPasswordStatus.initial,
    this.exception,
  });

  ForgotPasswordState withEmail(String email) {
    return ForgotPasswordState._(email: EmailAddress(email));
  }

  ForgotPasswordState withEmailSendInProgress() {
    return ForgotPasswordState._(
      email: email,
      status: ForgotPasswordStatus.emailSendInProgress,
    );
  }

  ForgotPasswordState withEmailSendSuccess(EmailAddress emailAddress) {
    return ForgotPasswordState._(
      email: emailAddress,
      status: ForgotPasswordStatus.emailSendSuccess,
    );
  }

  ForgotPasswordState withEmailSendFailure([PureAirException? exception]) {
    return ForgotPasswordState._(
      email: email,
      status: ForgotPasswordStatus.failure,
      exception: exception,
    );
  }

  final EmailAddress email;
  final ForgotPasswordStatus status;
  final PureAirException? exception;

  @override
  List<Object?> get props => [email, status, exception];
}

// final class ForgotPasswordInitial extends ForgotPasswordState {
//   const ForgotPasswordInitial();
// }

// final class ForgotPasswordSendResetEmailInProgress extends ForgotPasswordState {
//   const ForgotPasswordSendResetEmailInProgress();
// }

// final class ForgotPasswordSendResetEmailSuccess extends ForgotPasswordState {
//   const ForgotPasswordSendResetEmailSuccess(this.email);
//   final EmailAddress email;

//   @override
//   List<Object?> get props => [email];
// }

// final class ForgotPasswordFailure extends ForgotPasswordState {
//   const ForgotPasswordFailure(this.exception);
//   final PureAirException exception;

//   @override
//   List<Object?> get props => [exception];
// }
