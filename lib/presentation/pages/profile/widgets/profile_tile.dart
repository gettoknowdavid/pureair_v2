import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/constants/app_sizes.dart';

class ProfileTile extends StatelessWidget {
  final Widget leading;
  final String title;
  final Widget? trailing;
  final bool showTrailing;
  final Color? tileColor;
  final Color? textColor;
  final Color? duotoneSecondaryColor;
  final void Function()? onTap;

  const ProfileTile({
    super.key,
    required this.leading,
    required this.title,
    this.trailing,
    this.showTrailing = true,
    this.tileColor,
    this.textColor,
    this.duotoneSecondaryColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return ListTile(
      leading: leading,
      onTap: onTap,
      title: Text(title),
      trailing: showTrailing
          ? trailing ??
              PhosphorIcon(
                PhosphorIcons.bold.caretRight,
                color: textColor,
                duotoneSecondaryColor: duotoneSecondaryColor,
              )
          : null,
      contentPadding: kHorizontalPadding18,
      tileColor: tileColor ?? colorScheme.background,
      titleTextStyle: textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.bold,
        color: textColor,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 2, color: colorScheme.onBackground),
      ),
    );
  }
}
