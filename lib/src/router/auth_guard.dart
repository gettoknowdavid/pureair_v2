import 'package:auto_route/auto_route.dart';

import 'package:pureair_v2/injector/injector.dart';

import '../features/auth/application/auth_bloc/auth_bloc.dart';
import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final cubit = di<AuthBloc>();

    cubit.stream.listen((state) {
      state.whenOrNull(
        authenticated: (_) {
          if (!resolver.isResolved) {
            resolver.resolveNext(true);
          }
        },
        unverified: () {
          router.removeLast();
          resolver.redirect(const VerificationRoute(), replace: true);
        },
        unauthenticated: () {
          router.removeLast();
          resolver.redirect(const LoginRoute(), replace: true);
        },
      );
    });
  }
}
