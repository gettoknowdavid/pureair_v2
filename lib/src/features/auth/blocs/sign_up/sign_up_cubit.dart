import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/features/auth/repository/repository.dart';
import 'package:pureair_v2/src/shared/shared.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required AuthRepository repository,
  })  : _repository = repository,
        super(SignUpState());
  final AuthRepository _repository;

  void fullNameChanged(String fullName) => emit(state.withFullName(fullName));
  void emailChanged(String email) => emit(state.withEmail(email));
  void passwordChanged(String password) => emit(state.withPassword(password));

  Future<void> signUp() async {
    emit(state.withSubmissionInProgress());
    final response = await _repository.signUp(
      fullName: state.fullName,
      email: state.email,
      password: state.password,
    );
    emit(
      response.fold(
        state.withSubmissionFailure,
        (_) => state.withSubmissionSuccess(),
      ),
    );
  }
}
