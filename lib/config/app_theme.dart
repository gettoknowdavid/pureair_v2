// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pureair_v2/constants/constants.dart';

const _pageTransitionTheme = PageTransitionsTheme(builders: {
  TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
});

final _textTheme = GoogleFonts.figtreeTextTheme();

final _buttonTextStyle = MaterialStateProperty.resolveWith((states) {
  return _textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold);
});

final _textButtonTextStyle = MaterialStateProperty.resolveWith((states) {
  return _textTheme.labelLarge?.copyWith(
    fontWeight: FontWeight.bold,
    decorationThickness: 1.5,
  );
});

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: kPrimary,
    primaryContainer: kPrimaryContainer,
    secondary: kSecondary,
    secondaryContainer: kSecondaryContainer,
    tertiary: kTertiary,
    tertiaryContainer: kTertiaryContainer,
    appBarColor: kAppBarColor,
    error: kError,
  ),
  lightIsWhite: true,
  subThemesData: FlexSubThemesData(
    appBarScrolledUnderElevation: 0.0,
    blendOnLevel: 10,
    blendOnColors: false,
    thinBorderWidth: 2.0,
    thickBorderWidth: 2.5,
    defaultRadius: 0.0,
    textButtonRadius: 0.0,
    textButtonSchemeColor: SchemeColor.onBackground,
    elevatedButtonRadius: 0.0,
    elevatedButtonSchemeColor: SchemeColor.background,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    outlinedButtonRadius: 0.0,
    outlinedButtonSchemeColor: SchemeColor.onBackground,
    outlinedButtonOutlineSchemeColor: SchemeColor.onBackground,
    outlinedButtonBorderWidth: 2.0,
    outlinedButtonPressedBorderWidth: 2.5,
    toggleButtonsRadius: 0.0,
    inputDecoratorSchemeColor: SchemeColor.onBackground,
    inputDecoratorIsFilled: false,
    inputDecoratorBorderWidth: 2.0,
    inputDecoratorFocusedBorderWidth: 2.5,
    dialogBackgroundSchemeColor: SchemeColor.onPrimaryContainer,
    appBarBackgroundSchemeColor: SchemeColor.background,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.background,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarType: BottomNavigationBarType.shifting,
    bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
    filledButtonTextStyle: _buttonTextStyle,
    elevatedButtonTextStyle: _buttonTextStyle,
    outlinedButtonTextStyle: _buttonTextStyle,
    textButtonTextStyle: _textButtonTextStyle,
    chipRadius: 0.0,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  pageTransitionsTheme: _pageTransitionTheme,
  fontFamily: GoogleFonts.figtree().fontFamily,
  textTheme: _textTheme,
);

final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: kPrimary,
    primaryContainer: kPrimaryContainer,
    secondary: kSecondary,
    secondaryContainer: kSecondaryContainer,
    tertiary: kTertiary,
    tertiaryContainer: kTertiaryContainer,
    appBarColor: kAppBarColor,
    error: kError,
  ),
  // ).defaultError.toDark(0, false),
  darkIsTrueBlack: true,
  subThemesData: FlexSubThemesData(
    appBarScrolledUnderElevation: 0.0,
    blendOnLevel: 20,
    defaultRadius: 0.0,
    thinBorderWidth: 2.0,
    thickBorderWidth: 2.5,
    textButtonRadius: 0.0,
    textButtonSchemeColor: SchemeColor.onBackground,
    elevatedButtonRadius: 0.0,
    elevatedButtonSchemeColor: SchemeColor.background,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    outlinedButtonRadius: 0.0,
    outlinedButtonSchemeColor: SchemeColor.onBackground,
    outlinedButtonOutlineSchemeColor: SchemeColor.onBackground,
    outlinedButtonBorderWidth: 2.0,
    outlinedButtonPressedBorderWidth: 2.5,
    toggleButtonsRadius: 0.0,
    inputDecoratorSchemeColor: SchemeColor.onBackground,
    inputDecoratorIsFilled: false,
    inputDecoratorBorderWidth: 2.0,
    inputDecoratorFocusedBorderWidth: 2.5,
    dialogBackgroundSchemeColor: SchemeColor.onPrimaryContainer,
    appBarBackgroundSchemeColor: SchemeColor.background,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.background,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.secondary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.background,
    bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
    filledButtonTextStyle: _buttonTextStyle,
    elevatedButtonTextStyle: _buttonTextStyle,
    outlinedButtonTextStyle: _buttonTextStyle,
    textButtonTextStyle: _textButtonTextStyle,
    chipRadius: 0.0,
  ),
  useMaterial3ErrorColors: false,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  pageTransitionsTheme: _pageTransitionTheme,
  fontFamily: GoogleFonts.figtree().fontFamily,
  textTheme: _textTheme,
);
