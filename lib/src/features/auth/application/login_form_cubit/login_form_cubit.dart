import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domain/domain.dart';

part 'login_form_cubit.freezed.dart';
part 'login_form_state.dart';

@injectable
class LoginFormCubit extends Cubit<LoginFormState> {
  final IAuthFacade _authFacade;

  LoginFormCubit(this._authFacade) : super(LoginFormState.initial());

  // Determine if the login button is disabled or not
  bool get isDisabled =>
      !state.email.isValid() ||
      !state.password.isValid() ||
      state.loading ||
      state.googleSignInLoading;

  void dispose() => emit(LoginFormState.initial());

  // Update the email value in LoginFormState
  void emailChanged(String email) {
    emit(state.copyWith(email: Email(email), loading: false, option: none()));
  }

  // Attempt to login the user with GoogleSignIn option
  Future<void> googleSignPressed() async {
    Either<AuthFailure, Unit> r;

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
    Either<AuthFailure, Unit> r;

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

  // Update the password value in LoginFormState
  void passwordChanged(String password) {
    emit(state.copyWith(
      password: Password(password, login: true),
      loading: false,
      option: none(),
    ));
  }
}
