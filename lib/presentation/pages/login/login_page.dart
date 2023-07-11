import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'login_form.dart';
import 'widgets/terms_condition_policy_link.dart';

@RoutePage(deferredLoading: true)
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final cubit = context.read<LoginCubit>();

    return WillPopScope(
      onWillPop: () async {
        cubit.dispose();
        return true;
      },
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(kGlobalPadding),
          shrinkWrap: true,
          children: [
            (kToolbarHeight * 1.5).verticalSpace,
            Text(
              'Welcome back!',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            4.verticalSpace,
            Text(
              'Use your credentials below to login to your account.',
              style: textTheme.bodyLarge?.copyWith(
                letterSpacing: 0,
                color: colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            40.verticalSpace,
            const LoginForm(),
            30.verticalSpace,
            Text(
              'or login with',
              textAlign: TextAlign.center,
              style:
                  textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            30.verticalSpace,
            GoogleButton(
              loading: cubit.state.googleSignInLoading,
              disabled: cubit.state.loading || cubit.state.googleSignInLoading,
              onPressed: cubit.googleSignPressed,
            ),
            30.verticalSpace,
            FacebookButton(
              loading: false,
              disabled: cubit.state.loading || cubit.state.googleSignInLoading,
              onPressed: () {},
            ),
            40.verticalSpace,
            AuthRedirectionText(
              text: "Don't have an account yet? ",
              buttonText: "Register now",
              action: () => context.router.push(const RegisterRoute()),
            ),
            70.verticalSpace,
            const TermsConditionPolicyLink(),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
