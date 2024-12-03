import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_email_notifier.freezed.dart';
part 'verify_email_notifier.g.dart';
part 'verify_email_state.dart';

@riverpod
class VerifyEmailNotifier extends _$VerifyEmailNotifier {
  @override
  VerifyEmailState build() => const VerifyEmailInitial();

  Future<void> checkVerificationStatus() async {
    final result = await ref.read(authFacadeProvider).checkVerificationStatus();
    state = result.fold(
      () => const EmailUnverified(),
      (result) => result ? const EmailVerified() : const EmailUnverified(),
    );
  }

  Future<void> sendVerificationMail() async {
    state = const SendingVerification();
    final result = await ref.read(authFacadeProvider).sendVerificationEmail();
    state = result.fold(VerifyEmailFailure.new, VerificationMailSent.new);
  }

  Future<void> verify() async {
    state = const VerifyEmailInProgress();
    await checkVerificationStatus();
  }
}
