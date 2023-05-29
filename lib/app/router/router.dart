import 'package:auto_route/auto_route.dart';
import 'package:pureair_v2/app/router/auth_guard.dart';

import 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: VerificationRoute.page),
        AutoRoute(page: LayoutRoute.page, initial: true, guards: [AuthGuard()]),
        AutoRoute(page: LoadingRoute.page),
        AutoRoute(page: SplashRoute.page),
      ];
}
