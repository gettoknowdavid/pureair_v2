import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/config/router/app_router.gr.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'login_form.dart';

@RoutePage(deferredLoading: true)
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(kGlobalPadding),
        shrinkWrap: true,
        children: [
          Text('Login', style: theme.textTheme.displaySmall),
          30.verticalSpace,
          const LoginForm(),
          20.verticalSpace,
          AuthRedirectionText(
            text: "Don't have an account yet? ",
            buttonText: "Register now",
            action: () => AutoRouter.of(context).push(const RegisterRoute()),
          ),
        ],
      ),
    );
  }
}
