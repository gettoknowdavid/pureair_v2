import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(const _Loading()) {
    on<_UserCreated>(_created);
    on<_AuthChecked>(_authChecked);
    on<_LogoutPressed>(_logoutPressed);
    on<_VerificationChecked>(_verificationChecked);
    on<_VerificationMailSent>(_verificationMailSent);

    _authStatusSubscription = _authFacade.authStateChanges.listen((user) {
      add(_AuthChecked(user));
    });
  }

  late StreamSubscription<User?> _authStatusSubscription;

  @override
  Future<void> close() {
    _authStatusSubscription.cancel();
    return super.close();
  }

  _created(_UserCreated event, Emitter<AuthState> emit) async {
    return emit(AuthState.registered(event.user!));
  }

  /// Checks if the user's authentication state has changed.
  /// Sets the state to [AuthState.unauthenticated()] if the user is null.
  /// Sets the state to [AuthState.unverified()] if the user's email is not verified.
  /// Sets the state to [AuthState.authenticated(user)] if the user is not null and their email is verified.
  _authChecked(_AuthChecked event, Emitter<AuthState> emit) async {
    if (event.user == null) {
      return emit(const AuthState.unauthenticated());
    }

    if (event.user?.emailVerified == false) {
      return emit(const AuthState.unverified());
    } else {
      return emit(AuthState.authenticated(event.user!));
    }
  }

  /// Logs the user out and sets the state to [AuthState.unauthenticated()].
  _logoutPressed(_LogoutPressed event, Emitter<AuthState> emit) async {
    await _authFacade.logout();
    emit(const AuthState.unauthenticated());
  }

  /// Checks if the user's email is verified.
  /// Sets the state to [AuthState.unauthenticated()] if the user is null.
  /// Sets the state to [AuthState.unverified()] if the user's email is not verified.
  /// Sets the state to [AuthState.verified()] if the user's email is verified.
  _verificationChecked(
    _VerificationChecked event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());
    final isVerified = _authFacade.isEmailVerified;
    if (isVerified == true) {
      emit(const AuthState.verified());
    } else {
      emit(const AuthState.unverified());
    }
  }

  /// Checks if the user's email is verified.
  /// Sets the state to [AuthState.unauthenticated()] if the user is null.
  /// Sets the state to [AuthState.unverified()] if the user's email is not verified.
  /// Sets the state to [AuthState.verified()] if the user's email is verified.
  _verificationMailSent(
    _VerificationMailSent event,
    Emitter<AuthState> emit,
  ) async {
    await _authFacade.sendVerificationEmail();
    return emit(const AuthState.unverified());
  }
}
