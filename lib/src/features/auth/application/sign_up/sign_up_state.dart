part of 'sign_up_notifier.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = SignUpInitial;
  const factory SignUpState.inProgress() = SignUpInProgress;
  const factory SignUpState.success() = SignUpSuccess;
  const factory SignUpState.failure(AuthException exception) = SignUpFailure;
}
