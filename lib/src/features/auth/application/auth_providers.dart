import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@riverpod
IAuthFacade authFacade(Ref ref) {
  return AuthFacade(firebaseAuth: fa.FirebaseAuth.instance);
}

@riverpod
User? user(Ref ref) => ref.read(authFacadeProvider).user;

@riverpod
class EmailAddressNotifier extends _$EmailAddressNotifier {
  @override
  EmailAddress build() => EmailAddress('');

  void onChanged(String value) => state = EmailAddress(value);

  String? validator(String? value) {
    return state.value.fold(
      (failure) => failure.whenOrNull(
        empty: () => ErMsg.emptyEmail,
        invalidEmail: () => ErMsg.invalidEmail,
      ),
      (_) => null,
    );
  }
}

@riverpod
class FullNameNotifier extends _$FullNameNotifier {
  @override
  FullName build() => FullName('');

  void onChanged(String value) => state = FullName(value);

  String? validator(String? value) {
    return state.value.fold(
      (failure) => failure.whenOrNull(empty: () => ErMsg.emptyFullName),
      (_) => null,
    );
  }
}

@riverpod
class PasswordNotifier extends _$PasswordNotifier {
  @override
  Password build() => Password('');

  void onChanged(String value) => state = Password(value);

  String? validator(String? value) {
    return state.value.fold(
      (failure) => failure.whenOrNull(
        empty: () => ErMsg.emptyPassword,
        invalidPassword: () => ErMsg.invalidPassword,
      ),
      (_) => null,
    );
  }
}
