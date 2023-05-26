import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;
  AuthBloc(this._authFacade) : super(const _Loading()) {
    on<AuthEvent>(
      (e, emit) => e.mapOrNull(
        authChecked: (event) => _authChecked(event, emit),
        logoutPressed: (event) => _logoutPressed(event, emit),
        verificationChecked: (event) => _verificationChecked(event, emit),
      ),
    );
  }

  /// Checks if the user's authentication state has changed.
  /// Sets the state to [AuthState.unauthenticated()] if the user is null.
  /// Sets the state to [AuthState.unverified()] if the user's email is not verified.
  /// Sets the state to [AuthState.authenticated(user)] if the user is not null and their email is verified.
  _authChecked(_AuthChecked event, Emitter<AuthState> emit) async {
    _authFacade.authStateChanges.listen((user) {
      if (user == null) {
        emit(const AuthState.unauthenticated());
      } else if (!user.emailVerified) {
        emit(const AuthState.unverified());
      } else {
        emit(AuthState.authenticated(user));
      }
    });
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
    final verifiedOption = await _authFacade.checkEmailVerified();
    verifiedOption.fold(
      () => emit(const AuthState.unauthenticated()),
      (either) => either.fold(
        (l) => emit(const AuthState.unverified()),
        (r) => emit(const AuthState.verified()),
      ),
    );
  }
}
