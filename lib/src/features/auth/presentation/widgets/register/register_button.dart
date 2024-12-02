import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class RegisterButton extends ConsumerWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(authProvider.select((l) => l is AuthInProgress));
    Future<void> signUp() async {
      if (Form.of(context).validate()) {
        return ref.read(authProvider.notifier).signUp();
      }
    }

    return PrimaryButton(
      title: 'Sign Up',
      loading: loading,
      onPressed: signUp,
    );
  }
}
