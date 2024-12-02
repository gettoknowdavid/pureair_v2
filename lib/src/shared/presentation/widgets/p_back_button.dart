import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class PBackButton extends StatelessWidget {
  const PBackButton({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    PhosphorIconData getBackIcon() {
      if (kIsWeb) return PhosphorIconsBold.arrowLeft;

      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return PhosphorIconsBold.arrowLeft;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return PhosphorIconsBold.caretLeft;
      }
    }

    final styleFrom = IconButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 1.5, color: colorScheme.onSurface),
      ),
    );

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 12),
      child: IconButton(
        constraints: _constraints(),
        style: styleFrom,
        padding: EdgeInsets.zero,
        onPressed: onTap ?? Navigator.maybeOf(context)?.pop,
        tooltip: 'Back Button',
        icon: PhosphorIcon(getBackIcon(), size: 20),
      ),
    );
  }

  BoxConstraints _constraints() {
    return const BoxConstraints.tightFor(
      width: kToolbarHeight * 0.6,
      height: kToolbarHeight * 0.6,
    );
  }
}
