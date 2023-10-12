import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
class AuthFailure with _$AuthFailure {
  const factory AuthFailure.cannotComplete() = _CannotComplete;
  const factory AuthFailure.emailInUse() = _EmailInUse;
  const factory AuthFailure.error([String? message]) = _AuthFailureMessage;
  const factory AuthFailure.invalidEmail() = _InvalidEmail;
  const factory AuthFailure.invalidEmailOrPassword() = _InvalidEmailOrPassword;
  const factory AuthFailure.invalidPassword() = _InvalidPassword;
  const factory AuthFailure.noGoogleAccount() = _NoGoogleAccount;
  const factory AuthFailure.noNetworkConnection() = _NoNetworkConnection;
  const factory AuthFailure.notVerified() = _NotVerified;
  const factory AuthFailure.requiresRecentLogin() = _RequiresRecentLogin;
  const factory AuthFailure.serverError() = _ServerError;
  const factory AuthFailure.timeOut() = _TimeOut;
  const factory AuthFailure.userNotFound() = _UserNotFound;
}
