part of 'register_form_cubit.dart';

@freezed
class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    required Name name,
    required Email email,
    required Password password,
    required bool loading,
    required bool showError,
    required Option<Either<AuthFailure, Unit>> option,
    TextEditingController? passwordController,
  }) = _RegisterFormState;

  factory RegisterFormState.initial() {
    return RegisterFormState(
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
