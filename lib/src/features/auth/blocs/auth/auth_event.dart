part of 'auth_bloc.dart';

sealed class AuthEvent with EquatableMixin {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class AuthUserSubscribed extends AuthEvent {
  const AuthUserSubscribed();
}

final class AuthSignOutPressed extends AuthEvent {
  const AuthSignOutPressed();
}
