import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_exception.freezed.dart';

@freezed
class AuthException with _$AuthException {
  const factory AuthException.emailAddressInUse() = EmailAddressInUseException;

  const factory AuthException.invalidEmailOrPassword() =
      InvalidEmailOrPasswordException;

  const factory AuthException.serverException() = ServerException;

  const factory AuthException.canceled() = AuthCanceledException;

  const factory AuthException.permissionDenied() = AuthPermissionDenied;

  const factory AuthException.message(String error) = AuthMessageException;
}
