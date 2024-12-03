import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final authState = ref.read(authNotifierProvider);
    final isAllowedPath = authState.allowedPaths.contains(state.fullPath);
    if (!isAllowedPath) return authState.redirectPath;
    return null;
  }

  final refreshListenable = ValueNotifier(const AuthState.initial());
  ref
    ..onDispose(refreshListenable.dispose)
    ..listen(authNotifierProvider, (_, next) => refreshListenable.value = next);

  return GoRouter(
    initialLocation: R.home,
    redirect: redirect,
    refreshListenable: refreshListenable,
    navigatorKey: rootNavigatorKey,
    routes: [
      // Pages
      GoRoute(
        path: R.root,
        builder: (context, state) => const Scaffold(),
      ),
      GoRoute(
        path: R.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: R.login,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: R.register,
        builder: (context, state) => const SignUpPage(),
      ),
      GoRoute(
        path: R.verifyEmail,
        builder: (context, state) => const VerifyEmailPage(),
      ),
      GoRoute(
        path: R.forgotPassword,
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      //
      // Dialog Routes
      GoRoute(
        path: R.passwordResetConfirmation,
        pageBuilder: (context, state) => DialogPage<void>(
          barrierDismissible: false,
          builder: (context) => PasswordResetConfirmationDialog(
            emailAddress: state.extra! as EmailAddress,
          ),
        ),
        onExit: (context, state) {
          context.go(R.login);
          return true;
        },
      ),
    ],
  );
}
