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
  static const String details = '/details';
  // Dialog routes
  static const String passwordResetConfirmation = '/password-reset-confirmation';
  // Bottom Sheet routes
  static const String addCity = '/add-city';
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

class BottomSheetPage<T> extends Page<void> {
  const BottomSheetPage({
    required this.child,
    super.key,
    this.constraints,
    this.isScrollControlled = false,
    this.useRootNavigator = false,
    this.isDismissible = true,
    this.enableDrag = true,
  });

  final Widget child;
  final BoxConstraints? constraints;
  final bool isScrollControlled;
  final bool useRootNavigator;
  final bool isDismissible;
  final bool enableDrag;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      builder: (context) => Material(child: child),
      constraints: constraints,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: true,
      useSafeArea: true,
      settings: this,
    );
  }
}
