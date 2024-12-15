// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/theme/theme.dart';

class PureAirTheme {
  const PureAirTheme._();

  static ThemeData get dark => _raw(const ColorScheme.dark());

  static ThemeData get light => _raw(const ColorScheme.light());

  static ThemeData _raw(ColorScheme scheme) {
    final colorScheme = ColorScheme.light(
      brightness: scheme.brightness,
      primary: PureAirColors.primary,
      primaryContainer: PureAirColors.primaryContainer,
      secondary: PureAirColors.secondary,
      onSecondary: PureAirColors.onSecondary,
      secondaryContainer: PureAirColors.secondaryContainer,
      tertiary: PureAirColors.tertiary,
      onTertiary: PureAirColors.onTertiary,
      tertiaryContainer: PureAirColors.tertiaryContainer,
    );

    const border = OutlineInputBorder(
      borderSide: BorderSide(width: 2),
      borderRadius: BorderRadius.zero,
    );
    final focusedBorder = border.copyWith(
      borderSide: BorderSide(width: 3, color: colorScheme.primary),
    );
    final errorBorder = border.copyWith(
      borderSide: BorderSide(width: 2, color: colorScheme.error),
    );
    final focusedErrorBorder = border.copyWith(
      borderSide: BorderSide(width: 3, color: colorScheme.error),
    );

    final textTheme = PureAirTextTheme.$default(colorScheme);

    return ThemeData(
      appBarTheme: AppBarTheme(titleTextStyle: textTheme.titleRegular),
      colorScheme: colorScheme,
      dialogTheme: DialogTheme(
        titleTextStyle: textTheme.titleBold,
        contentTextStyle: textTheme.body?.copyWith(height: 1.3),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: colorScheme.onSurface),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(),
          side: const BorderSide(width: 2),
          backgroundColor: PureAirColors.primary,
          foregroundColor: PureAirColors.onPrimary,
          textStyle: textTheme.button,
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          shape: const RoundedRectangleBorder(),
          side: const BorderSide(width: 2),
          fixedSize: const Size(double.infinity, 56),
          backgroundColor: PureAirColors.primary,
          foregroundColor: PureAirColors.onPrimary,
          textStyle: textTheme.button,
        ),
      ),
      extensions: [textTheme],
      fontFamily: PureAirFontFamily.figtree,
      inputDecorationTheme: InputDecorationTheme(
        border: border,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        disabledBorder: border,
        focusedErrorBorder: focusedErrorBorder,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: textTheme.formHint,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.transparent,
        height: 60,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        contentTextStyle: textTheme.caption,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: colorScheme.onSurface),
        ),
      ),
      useMaterial3: true,
      visualDensity: VisualDensity.comfortable,
    );
  }
}

final class Internal {
  const Internal._();

  static T resolveTheme<T>(bool isLight, T lightThemeValue, T darkThemeValue) {
    return isLight ? lightThemeValue : darkThemeValue;
  }
}
