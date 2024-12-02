// ignore_for_file: avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/theme/theme.dart';

class PureAirTheme {
  const PureAirTheme._();

  static ThemeData get dark => _raw(Brightness.dark);

  static ThemeData get light => _raw(Brightness.light);

  static ThemeData _raw(Brightness brightness) {
    final isLight = brightness == Brightness.light;

    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: PureAirColors.primary,
      onPrimary: PureAirColors.onPrimary,
      primaryContainer: PureAirColors.primaryContainer,
      secondary: PureAirColors.secondary,
      onSecondary: PureAirColors.onSecondary,
      secondaryContainer: PureAirColors.secondaryContainer,
      tertiary: PureAirColors.tertiary,
      onTertiary: PureAirColors.onTertiary,
      tertiaryContainer: PureAirColors.tertiaryContainer,
      error: PureAirColors.error,
      onError: PureAirColors.onError,
      surface: Internal.resolveTheme(
        isLight,
        PureAirColors.white,
        PureAirColors.black,
      ),
      onSurface: Internal.resolveTheme(
        isLight,
        PureAirColors.black,
        Colors.white,
      ),
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
      colorScheme: colorScheme,
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
      visualDensity: VisualDensity.comfortable,
      useMaterial3: true,
      extensions: [textTheme],
    );
  }
}

final class Internal {
  const Internal._();

  static T resolveTheme<T>(bool isLight, T lightThemeValue, T darkThemeValue) {
    return isLight ? lightThemeValue : darkThemeValue;
  }
}
