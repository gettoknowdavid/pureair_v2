import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

HookWIdg  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EmailAddressWidget(),
          SizedBox(height: 40),
          _PasswordWidget(),
          SizedBox(height: 30),
          ForgotPasswordButton(),
          SizedBox(height: 30),
          _SignInButton(),
        ],
      ),
    );
  }
}

class _EmailAddressWidget extends StatelessWidget {
  const _EmailAddressWidget();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(emailAddressNotifierProvider.notifier);
    final formState = ref.watch(signInNotifierProvider);
    final googleState = ref.watch(googleSignInNotifierProvider);

    return PTextFormField(
      labelText: 'Email Address',
      hintText: 'john@example.com',
      enabled: formState is! SignInInProgress && googleState is! AsyncLoading,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordWidget extends StatelessWidget {
  const _PasswordWidget();

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(passwordNotifierProvider.notifier);
    final formState = ref.watch(signInNotifierProvider);
    final googleState = ref.watch(googleSignInNotifierProvider);

    return PTextFormField(
      labelText: 'Password',
      hintText: 'Your password',
      isPassword: true,
      enabled: formState is! SignInInProgress && googleState is! AsyncLoading,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    Future<void> signIn() async {
      if (Form.of(context).validate()) {
        return ref.read(signInNotifierProvider.notifier).signIn();
      }
    }

    final formState = ref.watch(signInNotifierProvider);
    final googleState = ref.watch(googleSignInNotifierProvider);

    return PrimaryButton(
      title: 'Sign In',
      loading: formState is SignInInProgress,
      disabled: formState is SignInInProgress || googleState is AsyncLoading,
      onPressed: signIn,
    );
  }
}
