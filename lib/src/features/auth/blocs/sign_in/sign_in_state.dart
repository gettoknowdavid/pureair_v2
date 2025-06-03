part of 'sign_in_cubit.dart';

enum SignInStatus { initial, inProgress, success, failure }

final class SignInState extends Equatable {
  SignInState() : this._(email: EmailAddress(''), password: Password(''));

  const SignInState._({
    required this.email,
    required this.password,
    this.status = SignInStatus.initial,
    this.exception,
    this.isGoogleSignIn = false,
  });

  SignInState withEmail(String email) {
    return SignInState._(email: EmailAddress(email), password: password);
  }

  SignInState withPassword(String password) {
    return SignInState._(email: email, password: Password(password));
  }

  SignInState withSubmissionInProgress({bool isGoogleSignIn = false}) {
    return SignInState._(
      email: email,
      password: password,
      status: SignInStatus.inProgress,
      isGoogleSignIn: isGoogleSignIn,
    );
  }

  SignInState withSubmissionSuccess() {
    return SignInState._(
      email: email,
      password: password,
      status: SignInStatus.success,
    );
  }

  SignInState withSubmissionFailure([PureAirException? exception]) {
    return SignInState._(
      email: email,
      password: password,
      status: SignInStatus.failure,
      exception: exception,
    );
  }

  final EmailAddress email;
  final Password password;
  final SignInStatus status;
  final PureAirException? exception;
  final bool isGoogleSignIn;

  bool get isValid => email.isValid && password.isValid;

  @override
  List<Object?> get props => [
        email,
        password,
        status,
        exception,
        isGoogleSignIn,
      ];
}
