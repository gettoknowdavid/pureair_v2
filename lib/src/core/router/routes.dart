import 'package:flutter/material.dart';

class R {
  const R._();

  static const String root = '/';
  static const String home = '/home';
  static const String explore = '/explore';
  static const String ranks = '/ranks';
  static const String profile = '/profile';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String verifyEmail = '/verify-email';
  // Dialog routes
  static const String passwordResetConfirmation = '/password-reset-confirmation';
}

class DialogPage<T> extends Page<void> {
  const DialogPage({
    required this.builder,
    super.key,
    this.barrierDismissible = true,
  });

  final WidgetBuilder builder;
  final bool barrierDismissible;

  @override
  Route<T> createRoute(BuildContext context) {
    return DialogRoute<T>(
      context: context,
      builder: builder,
      settings: this,
      useSafeArea: false,
      barrierDismissible: barrierDismissible,
    );
  }
}
