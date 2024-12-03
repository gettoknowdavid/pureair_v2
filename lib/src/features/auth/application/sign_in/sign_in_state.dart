part of 'sign_in_notifier.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = SignInInitial;
  const factory SignInState.inProgress() = SignInInProgress;
  const factory SignInState.success() = SignInSuccess;
  const factory SignInState.failure(AuthException exception) = SignInFailure;
}
