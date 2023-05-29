// This theme was made for FlexColorScheme version 6.1.1. Make sure
// you use same or higher version, but still same major version. If
// you use a lower version, some properties may not be supported. In
// that case you can also remove them after copying the theme to your app.
import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _pageTransitionTheme = PageTransitionsTheme(builders: {
  TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
  TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
});

final _fontFamily = GoogleFonts.notoSans().fontFamily;

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff4ac3bf),
    primaryContainer: Color(0xff8ff3ef),
    secondary: Color(0xffffd4b7),
    secondaryContainer: Color(0xffcce8e6),
    tertiary: Color(0xffffa9a4),
    tertiaryContainer: Color(0xffd1e4ff),
    appBarColor: Color(0xffcce8e6),
    error: Color(0xffb00020),
  ),
  lightIsWhite: true,
  subThemesData: const FlexSubThemesData(
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
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.background,
    bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  pageTransitionsTheme: _pageTransitionTheme,
  fontFamily: _fontFamily,
);
final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff4ac3bf),
    primaryContainer: Color(0xff8ff3ef),
    secondary: Color(0xffffd4b7),
    secondaryContainer: Color(0xffcce8e6),
    tertiary: Color(0xffffa9a4),
    tertiaryContainer: Color(0xffd1e4ff),
    appBarColor: Color(0xffcce8e6),
    error: Color(0xffb00020),
  ).defaultError.toDark(0, false),
  darkIsTrueBlack: true,
  subThemesData: const FlexSubThemesData(
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
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  pageTransitionsTheme: _pageTransitionTheme,
  fontFamily: GoogleFonts.lato().fontFamily,
);
