import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'register_form.dart';

@RoutePage(deferredLoading: true)
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return WillPopScope(
      onWillPop: () async {
        context.read<RegisterCubit>().dispose();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(leading: const AppBackButton()),
        body: ListView(
          padding: const EdgeInsets.all(kGlobalPadding),
          shrinkWrap: true,
          children: [
            4.verticalSpace,
            Text(
              'Register ',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            4.verticalSpace,
            Text(
              'Use your name, email and password below to create your new account.',
              style: textTheme.bodyLarge?.copyWith(
                letterSpacing: 0,
                color: colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            40.verticalSpace,
            const RegisterForm(),
            40.verticalSpace,
            AuthRedirectionText(
              text: "Already got an account? ",
              buttonText: "Back to Login",
              action: () => context.router.pop(),
            ),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }
}
