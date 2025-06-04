import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/shared.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  VerifyEmailCubit({
    required AuthRepository repository,
  })  : _repository = repository,
        super(VerifyEmailState());

  final AuthRepository _repository;

  void emailChanged(String email) => emit(state.withEmail(email));

  Future<void> checkVerificationStatus() async {
    emit(state.withVerifyEmailInProgress());
    await _checkStatus();
  }

  Future<void> sendVerificationMail() async {
    emit(state.withVerifyEmailInProgress());
    final response = await _repository.sendVerificationEmail();
    emit(response.fold(state.withFailure, state.withEmailSendSuccess));
  }

  Future<void> silentlyCheckVerificationStatus() => _checkStatus();

  Future<void> _checkStatus() async {
    final response = await _repository.checkVerificationStatus();
    emit(response.fold(state.withVerifiedOption, state.withVerifiedOption));
  }
}
