import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';

class PureAirTextTheme extends ThemeExtension<PureAirTextTheme> {
  const PureAirTextTheme({
    this.heading1,
    this.body,
    this.bodyBold,
    this.titleRegular,
    this.titleBold,
    this.subtitle,
    this.caption,
    this.captionBold,
    this.formLabel,
    this.formHint,
    this.button,
  });

  factory PureAirTextTheme.$default(ColorScheme colors) {
    final typography = _Typography(colors);
    return PureAirTextTheme(
      heading1: typography.heading1,
      body: typography.body,
      bodyBold: typography.bodyBold,
      titleRegular: typography.titleRegular,
      titleBold: typography.titleBold,
      subtitle: typography.subtitle,
      caption: typography.caption,
      captionBold: typography.captionBold,
      formLabel: typography.formLabel,
      formHint: typography.formHint,
      button: typography.button,
    );
  }

  final TextStyle? heading1;
  final TextStyle? body;
  final TextStyle? bodyBold;
  final TextStyle? titleRegular;
  final TextStyle? titleBold;
  final TextStyle? subtitle;
  final TextStyle? caption;
  final TextStyle? captionBold;
  final TextStyle? formLabel;
  final TextStyle? formHint;
  final TextStyle? button;

  @override
  ThemeExtension<PureAirTextTheme> copyWith({
    TextStyle? heading1,
    TextStyle? body,
    TextStyle? bodyBold,
    TextStyle? titleRegular,
    TextStyle? titleBold,
    TextStyle? subtitle,
    TextStyle? caption,
    TextStyle? captionBold,
    TextStyle? formLabel,
    TextStyle? formHint,
    TextStyle? button,
  }) {
    return PureAirTextTheme(
      heading1: heading1 ?? this.heading1,
      body: body ?? this.body,
      bodyBold: bodyBold ?? this.bodyBold,
      titleRegular: titleRegular ?? this.titleRegular,
      titleBold: titleBold ?? this.titleBold,
      subtitle: subtitle ?? this.subtitle,
      caption: caption ?? this.caption,
      captionBold: captionBold ?? this.captionBold,
      formLabel: formLabel ?? this.formLabel,
      formHint: formHint ?? this.formHint,
      button: button ?? this.button,
    );
  }

  @override
  ThemeExtension<PureAirTextTheme> lerp(
    covariant ThemeExtension<PureAirTextTheme>? other,
    double t,
  ) {
    if (other is! PureAirTextTheme) return this;
    return PureAirTextTheme(
      heading1: TextStyle.lerp(heading1, other.heading1, t),
      body: TextStyle.lerp(body, other.body, t),
      bodyBold: TextStyle.lerp(bodyBold, other.bodyBold, t),
      titleRegular: TextStyle.lerp(titleRegular, other.titleRegular, t),
      titleBold: TextStyle.lerp(titleBold, other.titleBold, t),
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t),
      caption: TextStyle.lerp(caption, other.caption, t),
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t),
      formLabel: TextStyle.lerp(formLabel, other.formLabel, t),
      formHint: TextStyle.lerp(formHint, other.formHint, t),
      button: TextStyle.lerp(button, other.button, t),
    );
  }

  static PureAirTextTheme? of(BuildContext context) {
    return Theme.of(context).extension<PureAirTextTheme>();
  }
}

@immutable
class _Typography {
  _Typography(this._c);
  final ColorScheme _c;

  late final heading1 = _font(24);
  late final body = _font(16);
  late final bodyBold = _font(16, weight: FontWeight.bold);
  late final titleRegular = _font(20);
  late final titleBold = _font(20);
  late final subtitle = _font(18);
  late final caption = _font(14);
  late final captionBold = _font(14);
  late final formLabel = _font(15, weight: FontWeight.w600, color: _c.primary);
  late final formHint = _font(16, color: _c.onSurface.withOpacity(0.4));
  late final button = _font(15, weight: FontWeight.w600);

  TextStyle get _s => const TextStyle(fontFamily: PureAirFontFamily.figtree);

  TextStyle _font(
    double size, {
    FontWeight weight = FontWeight.w500,
    TextDecoration? decoration,
    Color? color,
  }) {
    return _s.copyWith(
      fontSize: size,
      fontFamily: PureAirFontFamily.figtree,
      fontWeight: weight,
      decoration: decoration,
      color: color ?? _c.onSurface,
      letterSpacing: -0.5,
    );
  }
}
