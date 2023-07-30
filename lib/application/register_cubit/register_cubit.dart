import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'register_cubit.freezed.dart';
part 'register_state.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final IAuthFacade _authFacade;
  RegisterCubit(this._authFacade) : super(RegisterState.initial());

  // Determine if the login button is disabled or not
  bool get isDisabled =>
      !state.name.isValid() ||
      !state.email.isValid() ||
      !state.password.isValid();

  bool? get isPasswordEmpty => state.passwordController?.text.isEmpty;

  // Update the email value in RegisterState
  emailChanged(String email) async {
    emit(state.copyWith(email: Email(email), loading: false, option: none()));
  }

  // Update the name value in RegisterState
  nameChanged(String name) async {
    emit(state.copyWith(name: Name(name), loading: false, option: none()));
  }

  // Update the password value in RegisterState
  passwordChanged(String password) async {
    emit(state.copyWith(
      password: Password(password),
      passwordController: TextEditingController(text: password),
      loading: false,
      option: none(),
    ));
  }

  // Attempt to register the user
  registerPressed() async {
    Either<AuthError, Unit> r;

    final nameValid = state.name.isValid() == true;
    final emailValid = state.email.isValid() == true;
    final passwordValid = state.password.isValid() == true;

    if (nameValid && emailValid && passwordValid) {
      // Show a loading spinner while the registration is processing
      emit(state.copyWith(loading: true, option: none()));

      // Attempt to register the user and get the result
      r = await _authFacade.register(
        name: state.name,
        email: state.email,
        password: state.password,
      );

      // Update the state with the result of the registration
      emit(state.copyWith(loading: false, option: some(r)));
    }

    // Show an error message if the registration was not successful
    emit(state.copyWith(loading: false, showError: true, option: none()));
  }

  @override
  Future<void> close() async {
    Logger().wtf('CLOSE');
    emit(RegisterState.initial());
    super.close();
  }
}
