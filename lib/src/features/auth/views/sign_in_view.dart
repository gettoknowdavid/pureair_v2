import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/routing.dart';
import 'package:pureair_v2/src/shared/shared.dart';

const double _topSpace = kToolbarHeight * 1.5;

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SignInCubit(repository: ctx.read<AuthRepository>()),
      child: const SignInWidget(),
    );
  }
}

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        switch (state.status) {
          case SignInStatus.inProgress:
          case SignInStatus.initial:
            return;
          case SignInStatus.failure:
            if (state.exception is ActionCanceledException) return;
            final message = state.exception?.message ?? 'Unknown exception';
            context.showErrorSnackBar(message);
          case SignInStatus.success:
            const HomeRoute().go(context);
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
