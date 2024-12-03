import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class VerifyEmailPage extends HookConsumerWidget {
  const VerifyEmailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = PureAirTextTheme.of(context)!;

    final notifier = ref.read(verifyEmailNotifierProvider.notifier);
    final state = ref.watch(verifyEmailNotifierProvider);

    final verificationInProgress = state is VerifyEmailInProgress;
    final sendingMail = state is SendingVerification;

    ref.listen(verifyEmailNotifierProvider, (previous, next) {
      next.whenOrNull(
        failure: context.showVerifyEmailException,
        mailSent: (emailAddress) => context.showSuccessSnackBar(
          'Verification mail has been sent to ${emailAddress.getOrCrash}',
        ),
        verified: () => ref.invalidate(routerProvider),
      );
    });

    useInterval(
      notifier.checkVerificationStatus,
      const Duration(seconds: 10),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(),
            Text('Verify your account', style: textTheme.heading1),
            const SizedBox(height: 4),
            Text(
              'We have sent an email to the email address you registered with. '
              'Click on the link in the email to verify your account.',
              style: textTheme.body,
            ),
            const SizedBox(height: 40),
            PrimaryButton(
              title: 'Verify your account',
              loading: verificationInProgress,
              disabled: verificationInProgress || sendingMail,
              onPressed: () async => notifier.verify(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: ref.read(authNotifierProvider.notifier).signOut,
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async => notifier.sendVerificationMail(),
                  child: const Text('Resend'),
                ),
              ],
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
