import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/config/router/auth_guard.dart';

import 'app_router.gr.dart';

@injectable
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: VerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: LoadingRoute.page),
        AutoRoute(page: DetailsRoute.page),
        AutoRoute(
          initial: true,
          guards: [AuthGuard()],
          page: LayoutRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: ExploreRoute.page),
            AutoRoute(page: RankRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
