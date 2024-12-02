import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

const _topSpace = kToolbarHeight * 1.5;

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = PureAirTextTheme.of(context)!;
    final router = ref.watch(routerProvider);
    ref.listen(authProvider, (previous, next) {
      if (router.state?.path != R.login) return;
      next.whenOrNull(
        failure: (exception) => context.showErrorSnackBar(
          exception.maybeWhen(
            orElse: () => ErMsg.unknown,
            canceled: () => ErMsg.cancelled,
            invalidEmailOrPassword: () => ErMsg.invalidEmailOrPassword,
          ),
        ),
      );
    });

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: _topSpace),
            Text('Welcome back!', style: textTheme.heading1),
            const SizedBox(height: 10),
            Text(
              'Use your credentials below to login to your account.',
              style: textTheme.caption,
            ),
            const SizedBox(height: 40),
            const LoginForm(),
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
            const SizedBox(height: 40),
            const RegisterRedirectionButton(),
            const SizedBox(height: 20),
            const TermsConditionPolicyLink(),
          ],
        ),
      ),
    );
  }
}
