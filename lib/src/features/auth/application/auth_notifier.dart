// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.freezed.dart';
part 'auth_notifier.g.dart';
part 'auth_state.dart';

@riverpod
IAuthFacade authFacade(Ref ref) {
  return AuthFacade(firebaseAuth: fa.FirebaseAuth.instance);
}

@riverpod
Raw<Stream<User?>> userChanges(Ref ref) {
  return ref.watch(authFacadeProvider).userChanges;
}

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    state = const AuthInitial();
    ref.watch(authFacadeProvider).userChanges.listen((user) {
      if (user == null) {
        state = const Unauthenticated();
      } else {
        state = Authenticated(user);
      }
    });
    return state;
  }

  Future<void> signIn() async {
    state = const AuthInProgress();

    final emailAddress = ref.read(emailAddressNotifierProvider);
    final password = ref.read(passwordNotifierProvider);

    final result = await ref.read(authFacadeProvider).signIn(
          emailAddress: emailAddress,
          password: password,
        );

    result.fold(
      (exception) => state = AuthFailed(exception),
      (_) => ref.invalidateSelf,
    );
  }

  Future<void> signOut() async {
    await ref.read(authFacadeProvider).signOut();
    ref.invalidateSelf();
  }

  Future<void> signUp() async {
    state = const AuthInProgress();

    final fullName = ref.read(fullNameNotifierProvider);
    final emailAddress = ref.read(emailAddressNotifierProvider);
    final password = ref.read(passwordNotifierProvider);

    final result = await ref.read(authFacadeProvider).signUp(
          fullName: fullName,
          emailAddress: emailAddress,
          password: password,
        );

    result.fold(
      (exception) => state = AuthFailed(exception),
      (_) => ref.invalidateSelf,
    );
  }
}

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
