part of 'password_cubit.dart';

@freezed
class PasswordState with _$PasswordState {
  const factory PasswordState({
    required List<Map> rules,
    required bool visible,
    required Color color,
  }) = _PasswordState;

  factory PasswordState.initial() {
    return PasswordState(
      color: Colors.grey,
      rules: passwordRules,
      visible: false,
    );
  }
}
