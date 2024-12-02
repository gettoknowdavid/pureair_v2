import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton.icon(
      onPressed: () {},
      label: const Text('Continue with Google'),
      icon: PhosphorIcon(
        PhosphorIconsDuotone.googleLogo,
        duotoneSecondaryColor: colorScheme.surface,
        duotoneSecondaryOpacity: 1,
        size: 20,
      ),
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
      ),
    );
  }
}
