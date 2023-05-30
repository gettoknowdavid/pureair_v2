import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

@RoutePage(deferredLoading: true)
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bloc = context.read<AuthBloc>();

    return BlocListener<AuthBloc, AuthState>(
      bloc: bloc,
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        bloc.state.whenOrNull(
          verified: () => context.router.replaceAll([const LayoutRoute()]),
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(kGlobalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Text(
                'Verify your account',
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              4.verticalSpace,
              Text(
                'We have sent an email to the email address you registered with. '
                'Click on the link in the email to verify your account.',
                style: textTheme.bodyLarge?.copyWith(
                  letterSpacing: 0,
                  color: colorScheme.onBackground.withOpacity(0.5),
                ),
              ),
              40.verticalSpace,
              PrimaryButton(
                title: 'Verify your account',
                onPressed: () {
                  bloc.add(const AuthEvent.verificationChecked());
                },
              ),
              40.verticalSpace,
              TertiaryButton(
                onPressed: () {},
                title: 'Open mail app',
              ),
              20.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PlainButton(
                    'Cancel',
                    onPressed: () {
                      bloc.add(const AuthEvent.logoutPressed());
                      context.router.replaceAll([const LoginRoute()]);
                    },
                  ),
                  PlainButton(
                    'Resend',
                    onPressed: () {
                      bloc.add(const AuthEvent.verificationMailSent());
                    },
                  ),
                ],
              ),
              60.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
