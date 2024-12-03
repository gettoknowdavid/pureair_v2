import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forgot_password_notifier.freezed.dart';
part 'forgot_password_notifier.g.dart';
part 'forgot_password_state.dart';

@riverpod
class ForgotPasswordNotifier extends _$ForgotPasswordNotifier {
  @override
  ForgotPasswordState build() => const ForgotPasswordInitial();

  Future<void> sendPasswordResetEmail() async {
    state = const SendingPasswordResetEmail();
    final emailAddress = ref.read(emailAddressNotifierProvider);
    final result = await ref.read(authFacadeProvider).sendPasswordResetEmail(
          emailAddress,
        );
    state = result.fold(ForgotPasswordFailure.new, PasswordResetEmailSent.new);
  }
}
