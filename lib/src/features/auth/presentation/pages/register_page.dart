import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = PureAirTextTheme.of(context)!;

    ref.listen(authProvider, (previous, next) {
      next.whenOrNull(
        failure: (exception) => context.showErrorSnackBar(
          exception.maybeWhen(
            orElse: () => ErMsg.unknown,
            canceled: () => ErMsg.cancelled,
            emailAddressInUse: () => ErMsg.emailAlreadyInUse,
            message: (error) => error,
          ),
        ),
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
            Text('Register ', style: textTheme.heading1),
            const SizedBox(height: 4),
            Text(
              'Use your credentials to create your new account.',
              style: textTheme.caption,
            ),
            const SizedBox(height: 24),
            const RegisterForm(),
            const SizedBox(height: 24),
            Text(
              'Or login with',
              textAlign: TextAlign.center,
              style: textTheme.captionBold,
            ),
            const SizedBox(height: 24),
            const GoogleSignInButton(),
            const SizedBox(height: 18),
            const FacebookSignInButton(),
            const SizedBox(height: 30),
            const LoginRedirectionButton(),
            const SizedBox(height: 20),
            const TermsConditionPolicyLink(),
          ],
        ),
      ),
    );
  }
}
