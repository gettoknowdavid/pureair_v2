import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class PasswordWidget extends ConsumerWidget {
  const PasswordWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(authProvider.select((l) => l is AuthInProgress));
    final notifier = ref.watch(passwordNotifierProvider.notifier);
    return PTextFormField(
      labelText: 'Password',
      hintText: 'Your password',
      isPassword: true,
      enabled: !loading,
      onChanged: notifier.onChanged,
      validator: notifier.validator,
    );
  }
}
