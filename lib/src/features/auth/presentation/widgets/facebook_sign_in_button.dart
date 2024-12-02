import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FacebookSignInButton extends StatelessWidget {
  const FacebookSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return FilledButton.icon(
      onPressed: () {},
      label: const Text('Continue with Facebook'),
      icon: PhosphorIcon(
        PhosphorIconsDuotone.facebookLogo,
        duotoneSecondaryColor: colorScheme.surface,
        duotoneSecondaryOpacity: 1,
        size: 20,
      ),
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.tertiary,
        foregroundColor: colorScheme.onTertiary,
      ),
    );
  }
}
