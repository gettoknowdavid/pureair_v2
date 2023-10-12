import 'package:flutter/material.dart';

sealed class AppTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool underline;
  final Color? underlineColor;
  final String title;

  const AppTextButton(
    this.title, {
    super.key,
    this.onPressed,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.underline = false,
    this.underlineColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final style = theme.textTheme.labelLarge;

    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: color ?? colorScheme.onBackground,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: style?.copyWith(
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: underline ? TextDecoration.underline : null,
          decorationColor: underlineColor ?? colorScheme.onBackground,
        ),
      ),
      child: Text(title),
    );
  }
}

class UnderlinedButton extends AppTextButton {
  const UnderlinedButton(
    super.title, {
    super.key,
    super.color,
    super.underlineColor,
    super.fontSize,
    super.onPressed,
  });

  @override
  bool get underline => true;

  @override
  FontWeight? get fontWeight => FontWeight.bold;
}

class PlainButton extends AppTextButton {
  const PlainButton(
    super.title, {
    super.key,
    super.color,
    super.fontSize,
    super.onPressed,
  });

  @override
  FontWeight? get fontWeight => FontWeight.bold;
}
