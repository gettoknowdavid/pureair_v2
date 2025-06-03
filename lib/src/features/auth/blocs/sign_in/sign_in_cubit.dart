import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/features/auth/repository/repository.dart';
import 'package:pureair_v2/src/shared/shared.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required AuthRepository repository,
  })  : _repository = repository,
        super(SignInState());
  final AuthRepository _repository;

  void emailChanged(String email) => emit(state.withEmail(email));

  void passwordChanged(String password) => emit(state.withPassword(password));

  Future<void> signIn() async {
    emit(state.withSubmissionInProgress());
    final response = await _repository.signIn(
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

  Future<void> signInWithGoogle() async {
    emit(state.withSubmissionInProgress(isGoogleSignIn: true));
    final response = await _repository.signInWithGoogle();
    emit(
      response.fold(
        state.withSubmissionFailure,
        (_) => state.withSubmissionSuccess(),
      ),
    );
  }
}
