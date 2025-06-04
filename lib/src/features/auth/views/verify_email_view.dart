import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/router.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => VerifyEmailCubit(repository: ctx.read<AuthRepository>(),),
      child: const VerifyEmailViewWidget(),
    );
  }
}

class VerifyEmailViewWidget extends HookWidget {
  const VerifyEmailViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    final bloc = context.read<VerifyEmailCubit>();

    final status = context.select((VerifyEmailCubit bloc) => bloc.state.status);
    final verificationInProgress = status == VerifyEmailStatus.inProgress;
    final isSendingMail = status == VerifyEmailStatus.emailSendInProgress;

    useEffect(() {
      bloc.sendVerificationMail();
      return null;
    }, const []);

    useInterval(
      bloc.silentlyCheckVerificationStatus,
      const Duration(seconds: 10),
    );

    return BlocListener<VerifyEmailCubit, VerifyEmailState>(
      listener: (context, state) {
        switch (state.status) {
          case VerifyEmailStatus.unverified:
          case VerifyEmailStatus.emailSendInProgress:
          case VerifyEmailStatus.inProgress:
          case VerifyEmailStatus.initial:
            return;
          case VerifyEmailStatus.failure:
            final message = state.exception?.message ?? 'Unknown exception';
            context.showErrorSnackBar(message);
          case VerifyEmailStatus.emailSendSuccess:
            final email = state.email.getOrCrash;
            context.showSuccessSnackBar('Verification mail sent to $email');
          case VerifyEmailStatus.verified:
            const HomeRoute().go(context);
        }
      },
      child: Scaffold(
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
                '''We have sent an email to the email address you registered with. '''
                'Click on the link in the email to verify your account.',
                style: textTheme.body,
              ),
              const SizedBox(height: 40),
              PrimaryButton(
                title: 'Verify your account',
                loading: verificationInProgress,
                disabled: verificationInProgress || isSendingMail,
                onPressed: bloc.checkVerificationStatus,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthSignOutPressed());
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: bloc.sendVerificationMail,
                    child: const Text('Resend'),
                  ),
                ],
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
