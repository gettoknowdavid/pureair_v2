// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:pureair_v2/presentation/pages/details/details_page.dart'
    deferred as _i1;
import 'package:pureair_v2/presentation/pages/explore/explore_page.dart' as _i2;
import 'package:pureair_v2/presentation/pages/forgot_password/forgot_password_page.dart'
    deferred as _i3;
import 'package:pureair_v2/presentation/pages/home/home_page.dart' as _i4;
import 'package:pureair_v2/presentation/pages/layout/layout_page.dart' as _i5;
import 'package:pureair_v2/presentation/pages/login/login_page.dart'
    deferred as _i6;
import 'package:pureair_v2/presentation/pages/profile/profile_page.dart' as _i7;
import 'package:pureair_v2/presentation/pages/rank/rank_page.dart' as _i8;
import 'package:pureair_v2/presentation/pages/register/register_page.dart'
    deferred as _i9;
import 'package:pureair_v2/presentation/pages/verification/verification_page.dart'
    deferred as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () => const DetailsRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i1.loadLibrary,
          () => _i1.DetailsPage(
            key: args.key,
            geo: args.geo,
            showActions: args.showActions,
          ),
        ),
      );
    },
    ExploreRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ExplorePage(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ForgotPasswordRouteArgs>(
          orElse: () => const ForgotPasswordRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i3.loadLibrary,
          () => _i3.ForgotPasswordPage(
            key: args.key,
            emailSent: args.emailSent,
          ),
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
    LayoutRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LayoutPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i6.loadLibrary,
          () => _i6.LoginPage(),
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProfilePage(),
      );
    },
    RankRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.RankPage(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i9.loadLibrary,
          () => _i9.RegisterPage(),
        ),
      );
    },
    VerificationRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.DeferredWidget(
          _i10.loadLibrary,
          () => _i10.VerificationPage(),
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailsPage]
class DetailsRoute extends _i11.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i12.Key? key,
    List<double>? geo,
    bool showActions = true,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            geo: geo,
            showActions: showActions,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i11.PageInfo<DetailsRouteArgs> page =
      _i11.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    this.geo,
    this.showActions = true,
  });

  final _i12.Key? key;

  final List<double>? geo;

  final bool showActions;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, geo: $geo, showActions: $showActions}';
  }
}

/// generated route for
/// [_i2.ExplorePage]
class ExploreRoute extends _i11.PageRouteInfo<void> {
  const ExploreRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ForgotPasswordPage]
class ForgotPasswordRoute extends _i11.PageRouteInfo<ForgotPasswordRouteArgs> {
  ForgotPasswordRoute({
    _i12.Key? key,
    bool emailSent = false,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          ForgotPasswordRoute.name,
          args: ForgotPasswordRouteArgs(
            key: key,
            emailSent: emailSent,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i11.PageInfo<ForgotPasswordRouteArgs> page =
      _i11.PageInfo<ForgotPasswordRouteArgs>(name);
}

class ForgotPasswordRouteArgs {
  const ForgotPasswordRouteArgs({
    this.key,
    this.emailSent = false,
  });

  final _i12.Key? key;

  final bool emailSent;

  @override
  String toString() {
    return 'ForgotPasswordRouteArgs{key: $key, emailSent: $emailSent}';
  }
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LayoutPage]
class LayoutRoute extends _i11.PageRouteInfo<void> {
  const LayoutRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LayoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'LayoutRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.LoginPage]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.RankPage]
class RankRoute extends _i11.PageRouteInfo<void> {
  const RankRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RankRoute.name,
          initialChildren: children,
        );

  static const String name = 'RankRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.RegisterPage]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.VerificationPage]
class VerificationRoute extends _i11.PageRouteInfo<void> {
  const VerificationRoute({List<_i11.PageRouteInfo>? children})
      : super(
          VerificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerificationRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
