import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/config/router/auth_guard.dart';
import 'package:pureair_v2/constants/constants.dart';

import 'app_router.gr.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: RegisterRoute.page, path: '/register'),
        AutoRoute(page: VerificationRoute.page, path: '/verification'),
        AutoRoute(page: ForgotPasswordRoute.page, path: '/forgot-password'),
        AutoRoute(page: DetailsRoute.page, path: '/details'),
        AutoRoute(
          path: '/',
          initial: true,
          guards: [AuthGuard()],
          page: LayoutRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(
              page: ExploreRoute.page,
              title: (context, data) => kExploreTitle,
            ),
            AutoRoute(
              page: RankRoute.page,
              title: (context, data) => kRankTitle,
            ),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
