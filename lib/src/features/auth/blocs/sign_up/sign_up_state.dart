part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, inProgress, success, failure }

final class SignUpState extends Equatable {
  SignUpState()
      : this._(
          fullName: SingleLineString(''),
          email: EmailAddress(''),
          password: Password(''),
        );

  const SignUpState._({
    required this.fullName,
    required this.email,
    required this.password,
    this.status = SignUpStatus.initial,
    this.exception,
  });

  SignUpState withFullName(String fullName) {
    return SignUpState._(
      fullName: SingleLineString(fullName),
      email: email,
      password: password,
    );
  }

  SignUpState withEmail(String email) {
    return SignUpState._(
      fullName: fullName,
      email: EmailAddress(email),
      password: password,
    );
  }

  SignUpState withPassword(String password) {
    return SignUpState._(
      fullName: fullName,
      email: email,
      password: Password(password),
    );
  }

  SignUpState withSubmissionInProgress() {
    return SignUpState._(
      fullName: fullName,
      email: email,
      password: password,
      status: SignUpStatus.inProgress,
    );
  }

  SignUpState withSubmissionSuccess() {
    return SignUpState._(
      fullName: fullName,
      email: email,
      password: password,
      status: SignUpStatus.success,
    );
  }

  SignUpState withSubmissionFailure([PureAirException? exception]) {
    return SignUpState._(
      fullName: fullName,
      email: email,
      password: password,
      status: SignUpStatus.failure,
      exception: exception,
    );
  }

  final SingleLineString fullName;
  final EmailAddress email;
  final Password password;
  final SignUpStatus status;
  final PureAirException? exception;

  bool get isValid => fullName.isValid && email.isValid && password.isValid;

  @override
  List<Object?> get props => [fullName, email, password, status, exception];
}
