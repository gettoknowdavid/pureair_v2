import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/auth/repository/repository.dart';
import 'package:pureair_v2/src/shared/shared.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({
    required AuthRepository repository,
  })  : _repository = repository,
        super(ForgotPasswordState());

  final AuthRepository _repository;

  void emailChanged(String email) => emit(state.withEmail(email));

  Future<void> sendPasswordResetEmail() async {
    emit(state.withEmailSendInProgress());
    final response = await _repository.sendPasswordResetEmail(state.email);
    emit(response.fold(state.withEmailSendFailure, state.withEmailSendSuccess));
  }
}
