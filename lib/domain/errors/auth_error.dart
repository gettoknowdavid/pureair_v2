import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_error.freezed.dart';

@freezed
class AuthError with _$AuthError {
  const factory AuthError.cannotComplete() = _CannotComplete;
  const factory AuthError.emailInUse() = _EmailInUse;
  const factory AuthError.error([String? message]) = _AuthErrorMessage;
  const factory AuthError.invalidEmail() = _InvalidEmail;
  const factory AuthError.invalidEmailOrPassword() = _InvalidEmailOrPassword;
  const factory AuthError.invalidPassword() = _InvalidPassword;
  const factory AuthError.noGoogleAccount() = _NoGoogleAccount;
  const factory AuthError.noNetworkConnection() = _NoNetworkConnection;
  const factory AuthError.notVerified() = _NotVerified;
  const factory AuthError.requiresRecentLogin() = _RequiresRecentLogin;
  const factory AuthError.serverError() = _ServerError;
  const factory AuthError.timeOut() = _TimeOut;
  const factory AuthError.userNotFound() = _UserNotFound;
}