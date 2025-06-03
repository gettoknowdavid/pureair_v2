import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/router.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        switch (state.status) {
          case ForgotPasswordStatus.failure:
            final message = state.exception?.message ?? 'Unknown exception';
            context.showErrorSnackBar(message);
          case ForgotPasswordStatus.emailSendSuccess:
            final email = state.email.getOrCrash;
            PasswordResetConfirmationRoute(email).push(context);
          case ForgotPasswordStatus.emailSendInProgress:
          case ForgotPasswordStatus.initial:
            return;
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
