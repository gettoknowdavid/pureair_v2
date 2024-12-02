import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(authProvider.select((l) => l is AuthInProgress));
    Future<void> signIn() async {
      if (Form.of(context).validate()) {
        return ref.read(authProvider.notifier).signIn();
      }
    }

    return PrimaryButton(
      title: 'Sign In',
      loading: loading,
      onPressed: signIn,
    );
  }
}
