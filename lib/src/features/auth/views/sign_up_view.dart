import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/routing.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => SignUpCubit(repository: ctx.read<AuthRepository>()),
      child: const SignUpViewWidget(),
    );
  }
}

class SignUpViewWidget extends StatelessWidget {
  const SignUpViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        switch (state.status) {
          case SignUpStatus.inProgress:
          case SignUpStatus.initial:
            return;
          case SignUpStatus.failure:
            final message = state.exception?.message ?? 'Unknown exception';
            context.showErrorSnackBar(message);
          case SignUpStatus.success:
            const VerifyEmailRoute().go(context);
        }
      },
      child: Scaffold(
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
              const SizedBox(height: 60),
              const SignInRedirectionButton(),
              const SizedBox(height: 20),
              const TermsConditionPolicyLink(),
            ],
          ),
        ),
      ),
    );
  }
}
