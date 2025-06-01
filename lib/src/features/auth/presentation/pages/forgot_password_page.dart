import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    ref.listen(forgotPasswordNotifierProvider, (previous, next) {
      next.whenOrNull(
        failure: context.showAuthExceptionMessageOrElse,
        passwordResetEmailSent: (emailAddress) => context.push(
          R.passwordResetConfirmation,
          extra: emailAddress,
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(leading: const PBackButton()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 4),
            Text('Forgot your password?', style: textTheme.heading1),
            const SizedBox(height: 4),
            Text(
              'It happens. All you need to do is type in your email address'
              ' and we will send a quick fix.',
              style: textTheme.caption,
            ),
            const SizedBox(height: 40),
            const ForgotPasswordForm(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
