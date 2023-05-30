import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final IAuthFacade _authFacade;

  LoginCubit(this._authFacade) : super(LoginState.initial());

  // Determine if the login button is disabled or not
  bool get isDisabled =>
      !state.email.isValid() ||
      !state.password.isValid() ||
      state.loading ||
      state.googleSignInLoading;

  void dispose() {
    return emit(LoginState.initial());
  }

  // Update the email value in LoginState
  void emailChanged(String email) {
    emit(state.copyWith(email: Email(email), loading: false, option: none()));
  }

  // Attempt to login the user with GoogleSignIn option
  Future<void> googleSignPressed() async {
    Either<AuthError, Unit> r;

    // Show a loading spinner while the login is processing
    emit(state.copyWith(
      googleSignInLoading: true,
      loading: false,
      option: none(),
    ));

    // Attempt to login the user and get the result
    r = await _authFacade.googleLogin();

    // Update the state with the result of the login
    emit(state.copyWith(
      googleSignInLoading: false,
      loading: false,
      option: some(r),
    ));
  }

  // Attempt to login the user
  Future<void> loginPressed() async {
    Either<AuthError, Unit> r;

    final emailValid = state.email.isValid();
    final passwordValid = state.password.isValid();

    if (emailValid && passwordValid) {
      // Show a loading spinner while the login is processing
      emit(state.copyWith(loading: true, option: none()));

      // Attempt to login the user and get the result
      r = await _authFacade.login(email: state.email, password: state.password);

      // Update the state with the result of the login
      emit(state.copyWith(loading: false, option: some(r)));
    }

    // Show an error message if the login was not successful
    emit(state.copyWith(loading: false, showError: true, option: none()));
  }

  // Update the password value in LoginState
  void passwordChanged(String password) {
    emit(state.copyWith(
      password: Password(password, login: true),
      loading: false,
      option: none(),
    ));
  }
}
