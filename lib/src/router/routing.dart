import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/features/explore/presentation/pages/explore_view.dart';
import 'package:pureair_v2/src/router/routes.dart';
import 'package:pureair_v2/src/shared/layout/layout.dart';
import 'package:pureair_v2/src/shared/widgets/loading_indicator.dart';

part 'routing.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final mainLayoutNavigatorKey = GlobalKey<NavigatorState>();

final routerConfig = GoRouter(
  initialLocation: R.home,
  navigatorKey: rootNavigatorKey,
  routes: $appRoutes,
);

@TypedGoRoute<LoadingRoute>(path: R.root, name: R.root)
class LoadingRoute extends GoRouteData {
  const LoadingRoute();

  @override
  Widget build(context, state) => const LoadingIndicator();
}

@TypedGoRoute<SignInRoute>(path: R.signIn, name: R.signIn)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(context, state) => const SignInView();
}

@TypedGoRoute<SignUpRoute>(path: R.signUp, name: R.signIn)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  @override
  Widget build(context, state) => const SignUpView();
}

@TypedGoRoute<VerifyEmailRoute>(path: R.verifyEmail, name: R.verifyEmail)
class VerifyEmailRoute extends GoRouteData {
  const VerifyEmailRoute();

  @override
  Widget build(context, state) => const VerifyEmailView();
}

@TypedGoRoute<ForgotPasswordRoute>(
  path: R.forgotPassword,
  name: R.forgotPassword,
)
class ForgotPasswordRoute extends GoRouteData {
  const ForgotPasswordRoute();

  @override
  Widget build(context, state) => const ForgotPasswordView();
}

@TypedGoRoute<DetailsRoute>(path: R.details, name: R.details)
class DetailsRoute extends GoRouteData {
  const DetailsRoute();

  @override
  Widget build(context, state) => const DetailsView(showAddButton: false);
}

/*
  ###########################
  ##                       ##
  ##        Dialogs        ##
  ##                       ##
  ###########################
*/
@TypedGoRoute<PasswordResetConfirmationRoute>(
  path: R.passwordResetConfirmation,
  name: R.passwordResetConfirmation,
)
class PasswordResetConfirmationRoute extends GoRouteData {
  const PasswordResetConfirmationRoute(this.email);
  final String email;

  @override
  Page<void> buildPage(context, state) {
    final emailAddress = EmailAddress(state.uri.queryParameters['email'] ?? '');
    return DialogPage<void>(
      barrierDismissible: false,
      builder: (_) => PasswordResetConfirmationDialog(
        emailAddress: emailAddress,
      ),
    );
  }
}

/*
  ###########################
  ##                       ##
  ##     Bottom Sheets     ##
  ##                       ##
  ###########################
*/
@TypedGoRoute<AddCityRoute>(path: R.addCity, name: R.addCity)
class AddCityRoute extends GoRouteData {
  const AddCityRoute();

  @override
  Page<void> buildPage(context, state) {
    return const BottomSheetPage<void>(
      isScrollControlled: true,
      useRootNavigator: true,
      child: AddCitySheetWidget(),
    );
  }
}

/*
  ###########################
  ##                       ##
  ##      Main Layout      ##
  ##                       ##
  ###########################
*/
@TypedStatefulShellRoute<PureAirLayoutRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<HomeShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<HomeRoute>(path: R.home, name: R.home)
      ],
    ),
    TypedStatefulShellBranch<ExploreShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ExploreRoute>(path: R.explore, name: R.explore)
      ],
    ),
    TypedStatefulShellBranch<RanksShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<RanksRoute>(path: R.ranks, name: R.ranks)
      ],
    ),
    TypedStatefulShellBranch<ProfileShellBranchData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<ProfileRoute>(path: R.profile, name: R.profile)
      ],
    ),
  ],
)
class PureAirLayoutRouteData extends StatefulShellRouteData {
  const PureAirLayoutRouteData();

  @override
  Widget builder(context, state, navigationShell) {
    return PureAirLayout(
      key: mainLayoutNavigatorKey,
      navigationShell: navigationShell,
    );
  }
}

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(context, state) => const HomeView();
}

class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
}

class ExploreRoute extends GoRouteData {
  const ExploreRoute();

  @override
  Widget build(context, state) => const ExploreView();
}

class RanksShellBranchData extends StatefulShellBranchData {
  const RanksShellBranchData();
}

class RanksRoute extends GoRouteData {
  const RanksRoute();

  @override
  Widget build(context, state) => const ExploreView();
}

class ProfileShellBranchData extends StatefulShellBranchData {
  const ProfileShellBranchData();
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(context, state) => const ProfileView();
}
