part of 'register_cubit.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required Name name,
    required Email email,
    required Password password,
    required bool loading,
    required bool showError,
    required Option<Either<AuthError, Unit>> option,
    TextEditingController? passwordController,
  }) = _RegisterState;

  factory RegisterState.initial() {
    return RegisterState(
      name: Name(''),
      email: Email(''),
      password: Password(''),
      loading: false,
      showError: false,
      option: none(),
      passwordController: null,
    );
  }
}
