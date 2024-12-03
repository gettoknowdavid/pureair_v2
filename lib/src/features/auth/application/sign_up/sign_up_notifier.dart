import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_up_notifier.freezed.dart';
part 'sign_up_notifier.g.dart';
part 'sign_up_state.dart';

@riverpod
class SignUpNotifier extends _$SignUpNotifier {
  @override
  SignUpState build() => const SignUpInitial();

  Future<void> signUp() async {
    state = const SignUpInProgress();

    final fullName = ref.read(fullNameNotifierProvider);
    final emailAddress = ref.read(emailAddressNotifierProvider);
    final password = ref.read(passwordNotifierProvider);

    final result = await ref.read(authFacadeProvider).signUp(
          fullName: fullName,
          emailAddress: emailAddress,
          password: password,
        );

    state = result.fold(
      SignUpFailure.new,
      (_) => const SignUpSuccess(),
    );
  }
}
