import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/widgets/loading_indicator.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loading = ref.watch(googleSignInNotifierProvider) is AsyncLoading;

    return FilledButton.icon(
      onPressed: ref.watch(googleSignInNotifierProvider.notifier).signIn,
      label: loading
          ? const LoadingIndicator()
          : const Text('Continue with Google'),
      icon: loading ? null : const Icon(PhosphorIconsBold.googleLogo),
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        iconSize: 20,
      ),
    );
  }
}
