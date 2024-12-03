import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/router/routes.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final authState = ref.read(authProvider);
    final isAllowedPath = authState.allowedPaths.contains(state.fullPath);
    if (!isAllowedPath) return authState.redirectPath;
    return null;
  }

  final refreshListenable = ValueNotifier(const AuthState.initial());
  ref
    ..onDispose(refreshListenable.dispose)
    ..listen(authProvider, (_, next) => refreshListenable.value = next);

  return GoRouter(
    initialLocation: R.home,
    redirect: redirect,
    refreshListenable: refreshListenable,
    routes: [
      GoRoute(path: R.root, builder: (_, __) => const Scaffold()),
      GoRoute(path: R.home, builder: (_, __) => const HomePage()),
      GoRoute(path: R.login, builder: (_, __) => const SignInPage()),
      GoRoute(path: R.register, builder: (_, __) => const SignUpPage()),
      GoRoute(path: R.verifyEmail, builder: (_, __) => const VerifyEmailPage()),
    ],
  );
}
