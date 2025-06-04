import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/injector/injector.dart';
import 'package:pureair_v2/src/router/router.dart';
import 'package:pureair_v2/src/router/routes.dart' show R;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository repository,
  })  : _repository = repository,
        super(AuthState(user: repository.user)) {
    on<AuthUserSubscribed>(_onAuthUserSubscribed);
    on<AuthSignOutPressed>(_onAuthSignOutPressed);
  }

  final AuthRepository _repository;

  Future<void> _onAuthUserSubscribed(
    AuthUserSubscribed event,
    Emitter<AuthState> emit,
  ) {
    return emit.forEach(
      _repository.userChanges,
      onData: (user) => AuthState(user: user),
      onError: (error, stackTrace) => AuthState(user: User.empty),
    );
  }

  Future<void> _onAuthSignOutPressed(
    AuthSignOutPressed event,
    Emitter<AuthState> emit,
  ) {
    return _repository.signOut();
  }
}

class AuthStreamScope extends InheritedNotifier<AuthStream> {
  AuthStreamScope({
    required super.child,
    super.key,
  }) : super(
          notifier: AuthStream(
            AuthBloc(repository: di<AuthRepository>()).stream,
          ),
        );
  static AuthStream of(BuildContext ctx) {
    return ctx.dependOnInheritedWidgetOfExactType<AuthStreamScope>()!.notifier!;
  }
}

class AuthStream extends ChangeNotifier {
  AuthStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  AuthBloc get authBloc => AuthBloc(repository: di<AuthRepository>());

  bool get isAuthenticated => authBloc.state.status.isAuthenticated;

  AuthStatus get status => authBloc.state.status;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
