import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    PhosphorIconData getBackIcon() {
      if (kIsWeb) {
        return PhosphorIcons.regular.arrowLeft;
      }

      switch (theme.platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          return PhosphorIcons.bold.arrowLeft;
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          return PhosphorIcons.bold.caretLeft;
      }
    }

    var styleFrom = IconButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 1.5,
          color: colorScheme.onBackground,
        ),
      ),
    );

    return AutoLeadingButton(
      builder: (context, leadingType, action) {
        if (leadingType == LeadingType.back) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 12),
            child: IconButton(
              constraints: _constraints(),
              style: styleFrom,
              padding: EdgeInsets.zero,
              onPressed: action,
              tooltip: 'Back Button',
              icon: PhosphorIcon(getBackIcon(), size: 20),
            ),
          );
        }

        return const SizedBox();
      },
    );
  }

  BoxConstraints _constraints() {
    return const BoxConstraints.tightFor(
      width: kToolbarHeight * 0.6,
      height: kToolbarHeight * 0.6,
    );
  }
}
