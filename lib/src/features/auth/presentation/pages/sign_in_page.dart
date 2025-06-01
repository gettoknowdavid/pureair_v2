import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

const _topSpace = kToolbarHeight * 1.5;

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;
    ref
      ..listen(signInNotifierProvider, (previous, next) {
        next.whenOrNull(
          failure: context.showSignInException,
          success: () => ref.invalidate(routerProvider),
        );
      })
      ..listen(googleSignInNotifierProvider, (previous, next) {
        next.whenOrNull(
          error: (e, _) => context.showSignInException(e as AuthException),
          data: (data) => ref.invalidate(routerProvider),
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
              'Use your credentials below to sign in to your account.',
              style: textTheme.caption,
            ),
            const SizedBox(height: 40),
            const SignInForm(),
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
            const SizedBox(height: 40),
            const SignUpRedirectionButton(),
            const SizedBox(height: 20),
            const TermsConditionPolicyLink(),
          ],
        ),
      ),
    );
  }
}
