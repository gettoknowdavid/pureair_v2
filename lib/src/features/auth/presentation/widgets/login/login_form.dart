import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

class LoginForm extends HookConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          EmailAddressWidget(),
          SizedBox(height: 40),
          PasswordWidget(),
          SizedBox(height: 30),
          ForgotPasswordButton(),
          SizedBox(height: 30),
          LoginButton(),
        ],
      ),
    );
  }
}
