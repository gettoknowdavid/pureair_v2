import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/auth_bloc/auth_bloc.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'register_form.dart';

@RoutePage(deferredLoading: true)
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          Text('Register', style: theme.textTheme.displaySmall),
          30.verticalSpace,
          const RegisterForm(),
          20.verticalSpace,
          AuthRedirectionText(
            text: "Already got an account? ",
            buttonText: "Back to Login",
            action: () => AutoRouter.of(context).pop(),
          ),
          20.verticalSpace,
          ElevatedButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.logoutPressed());
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
