import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';

class AppSnackbar extends SnackBar {
  const AppSnackbar({
    super.key,
    required super.content,
    required this.theme,
  });

  final ThemeData theme;

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  Color? get backgroundColor => theme.colorScheme.error;

  @override
  EdgeInsetsGeometry? get margin => const EdgeInsets.all(kGlobalPadding);

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.all(kGlobalPadding);

  @override
  ShapeBorder? get shape {
    return RoundedRectangleBorder(
      side: BorderSide(width: 1.2, color: theme.colorScheme.onBackground),
    );
  }
}

class SnackbarContent extends StatelessWidget {
  final String? title;
  const SnackbarContent(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    if (title == null) {
      return const SizedBox();
    } else {
      return Text(
        title!,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onError,
        ),
      );
    }
  }
}
