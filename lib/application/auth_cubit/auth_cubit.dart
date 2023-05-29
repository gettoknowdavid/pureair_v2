import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'auth_state.dart';

enum AuthStatus { loading, authenticated, unauthenticated, unverified }

@injectable
class AuthCubit extends Cubit<AuthState> {
  final IAuthFacade _authFacade;

  AuthCubit(this._authFacade) : super(const AuthState.unauthenticated()) {
    _authFacade.authStateChanges().listen(
      (user) {
        switch (user) {
          case null:
            return emit(const AuthState.unauthenticated());
          default:
            if (user.emailVerified == false) {
              return emit(const AuthState.unverified());
            } else {
              return emit(AuthState.authenticated(user));
            }
        }
      },
    );
  }

  late StreamSubscription<User?> _authStatusSubscription;

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }
}
