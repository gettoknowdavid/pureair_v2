import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignInForm extends HookConsumerWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

class _EmailAddressWidget extends ConsumerWidget {
  const _EmailAddressWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(emailAddressNotifierProvider.notifier);
    return PTextFormField(
      labelText: 'Email Address',
      hintText: 'john@example.com',
      enabled: ref.watch(signInNotifierProvider) is! SignInInProgress,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
      keyboardType: TextInputType.emailAddress,
    );
  }
}

class _PasswordWidget extends ConsumerWidget {
  const _PasswordWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(passwordNotifierProvider.notifier);
    return PTextFormField(
      labelText: 'Password',
      hintText: 'Your password',
      isPassword: true,
      enabled: ref.watch(signInNotifierProvider) is! SignInInProgress,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
    );
  }
}

class _SignInButton extends ConsumerWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> signIn() async {
      if (Form.of(context).validate()) {
        return ref.read(signInNotifierProvider.notifier).signIn();
      }
    }

    return PrimaryButton(
      title: 'Sign In',
      loading: ref.watch(signInNotifierProvider) is SignInInProgress,
      onPressed: signIn,
    );
  }
}
