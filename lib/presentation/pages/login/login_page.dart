import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';

import 'widgets/login_form.dart';

@RoutePage(deferredLoading: true)
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(kGlobalPadding),
        shrinkWrap: true,
        children: [
          Text('Login', style: theme.textTheme.displaySmall),
          30.verticalSpace,
          const LoginForm(),
        ],
      ),
    );
  }
}
