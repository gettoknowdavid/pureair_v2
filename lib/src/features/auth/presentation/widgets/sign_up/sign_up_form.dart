import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignUpForm extends HookWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _FullNameWidget(),
          SizedBox(height: 24),
          _EmailAddressWidget(),
          SizedBox(height: 24),
          _PasswordWidget(),
          SizedBox(height: 40),
          _SignUpButton(),
        ],
      ),
    );
  }
}

class _FullNameWidget extends ConsumerWidget {
  const _FullNameWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(fullNameNotifierProvider.notifier);
    return PTextFormField(
      labelText: 'Full Name',
      hintText: 'John Doe',
      enabled: ref.watch(signUpNotifierProvider) is! SignInInProgress,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
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
      enabled: ref.watch(signUpNotifierProvider) is! SignInInProgress,
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
      enabled: ref.watch(signUpNotifierProvider) is! SignInInProgress,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
    );
  }
}

class _SignUpButton extends ConsumerWidget {
  const _SignUpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> signUp() async {
      if (Form.of(context).validate()) {
        return ref.read(signUpNotifierProvider.notifier).signUp();
      }
    }

    return PrimaryButton(
      title: 'Sign Up',
      loading: ref.watch(signUpNotifierProvider) is SignUpInProgress,
      onPressed: signUp,
    );
  }
}
