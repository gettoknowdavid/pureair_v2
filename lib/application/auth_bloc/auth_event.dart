part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authChecked([User? user]) = _AuthChecked;
  const factory AuthEvent.userCreated([User? user]) = _UserCreated;
  const factory AuthEvent.logoutPressed() = _LogoutPressed;
  const factory AuthEvent.mailAppOpened() = _MailAppOpened;
  const factory AuthEvent.verificationChecked() = _VerificationChecked;
  const factory AuthEvent.verificationMailSent() = _VerificationMailSent;
}
