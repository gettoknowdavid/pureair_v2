import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/services/services.dart';

part 'forgot_password_cubit.freezed.dart';
part 'forgot_password_state.dart';

// Create a ForgotPasswordCubit that extends Cubit
// and manages ForgotPasswordState
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final IAuthFacade _authFacade;
  final MailAppService _mailAppService;
  ForgotPasswordCubit(
    this._authFacade,
    this._mailAppService,
  ) : super(ForgotPasswordState.initial());
  // Update the email value in ForgotPasswordState
  emailChanged(String email) async {
    emit(state.copyWith(email: Email(email), option: none()));
  }

  // Open the email app in user's device
  mailAppOpened(BuildContext context) async {
    await _mailAppService.openMailApp(context);
  }

  statusChanged() async {
    emit(state.copyWith(status: true, loading: false, option: none()));
  }

  // Attempt to submit the password
  submitPressed() async {
    Either<AuthError, Unit> r;

    if (state.email.isValid()) {
      // Show a loading spinner while the forgot password is processing
      emit(state.copyWith(loading: true, status: false, option: none()));

      // Attempt to submit email for forgotten password
      r = await _authFacade.sendPasswordResetEmail(state.email);

      // Update the state with the result of the forgotten password
      emit(state.copyWith(loading: false, option: some(r)));
    }

    // Show an error message if the forgot password was not successful
    emit(state.copyWith(loading: false, showError: true, option: none()));
  }
}
