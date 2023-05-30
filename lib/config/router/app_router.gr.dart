// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:pureair_v2/presentation/pages/forgot_password/forgot_password_page.dart'
    deferred as _i1;
import 'package:pureair_v2/presentation/pages/layout/layout_page.dart' as _i2;
import 'package:pureair_v2/presentation/pages/loading_page.dart'
    deferred as _i3;
import 'package:pureair_v2/presentation/pages/login/login_page.dart'
    deferred as _i4;
import 'package:pureair_v2/presentation/pages/register/register_page.dart'
    deferred as _i5;
import 'package:pureair_v2/presentation/pages/verification/verification_page.dart'
    deferred as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.ForgotPasswordPage(
            key: args.key,
            emailSent: args.emailSent,
          ),
        ),
      );
    },
    LayoutRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LayoutPage(),
      );
    },
    LoadingRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.LoadingPage(),
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i4.loadLibrary,
          () => _i4.LoginPage(),
        ),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i5.loadLibrary,
          () => _i5.RegisterPage(),
        ),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.VerificationPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.ForgotPasswordPage]
class ForgotPasswordRoute extends _i7.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i8.Key? key,
    bool emailSent = false,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            emailSent: emailSent,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i7.PageInfo<ForgotPasswordRouteArgs> page =
      _i7.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    this.emailSent = false,
  });

  final _i8.Key? key;

  final bool emailSent;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, emailSent: $emailSent}';
  }
}

/// generated route for
/// [_i2.LayoutPage]
class LayoutRoute extends _i7.PageRouteInfo<void> {
  const LayoutRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoadingPage]
class LoadingRoute extends _i7.PageRouteInfo<void> {
  const LoadingRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterRoute extends _i7.PageRouteInfo<void> {
  const RegisterRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.VerificationPage]
class VerificationRoute extends _i7.PageRouteInfo<void> {
  const VerificationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
