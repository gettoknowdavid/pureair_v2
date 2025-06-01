import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    ref.listen(signUpNotifierProvider, (previous, next) {
      next.whenOrNull(
        failure: (exception) => context.showErrorSnackBar(
          exception.maybeWhen(
            orElse: () => ErMsg.unknown,
            canceled: () => ErMsg.cancelled,
            emailAddressInUse: () => ErMsg.emailAlreadyInUse,
            message: (error) => error,
          ),
        ),
        success: () {
          ref.read(verifyEmailNotifierProvider.notifier).sendVerificationMail();
          ref.invalidate(routerProvider);
        },
      );
    });

    return Scaffold(
      appBar: AppBar(leading: const PBackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 4),
            Text('Sign Up ', style: textTheme.heading1),
            const SizedBox(height: 4),
            Text(
              'Use your credentials to create your new account.',
              style: textTheme.caption,
            ),
            const SizedBox(height: 24),
            const SignUpForm(),
            const SizedBox(height: 24),
            Text(
              'Or',
              textAlign: TextAlign.center,
              style: textTheme.captionBold,
            ),
            const SizedBox(height: 24),
            const GoogleSignInButton(),
            const SizedBox(height: 18),
            const FacebookSignInButton(),
            const SizedBox(height: 30),
            const SignInRedirectionButton(),
            const SizedBox(height: 20),
            const TermsConditionPolicyLink(),
          ],
        ),
      ),
    );
  }
}
