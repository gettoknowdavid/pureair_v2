import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_notifier.freezed.dart';
part 'sign_in_notifier.g.dart';
part 'sign_in_state.dart';

@riverpod
class SignInNotifier extends _$SignInNotifier {
  @override
  SignInState build() => const SignInInitial();

  Future<void> signIn() async {
    state = const SignInInProgress();

    final emailAddress = ref.read(emailAddressNotifierProvider);
    final password = ref.read(passwordNotifierProvider);

    final result = await ref.read(authFacadeProvider).signIn(
          emailAddress: emailAddress,
          password: password,
        );

    state = result.fold(
      SignInFailure.new,
      (success) => const SignInSuccess(),
    );
  }
}
