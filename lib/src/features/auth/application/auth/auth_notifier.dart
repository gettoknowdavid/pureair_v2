// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_notifier.freezed.dart';
part 'auth_notifier.g.dart';
part 'auth_state.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    state = const AuthInitial();
    ref.watch(authFacadeProvider).userChanges.listen((user) {
      if (user == null) {
        state = const Unauthenticated();
      } else if (!user.emailVerified) {
        state = Unverified(user);
      } else {
        state = Authenticated(user);
      }
    });
    return state;
  }

  Future<void> signOut() async {
    await ref.read(authFacadeProvider).signOut();
    ref.invalidateSelf();
  }
}
