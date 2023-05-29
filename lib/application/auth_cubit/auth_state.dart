part of 'auth_cubit.dart';

final class AuthState extends Equatable {
  final AuthStatus status;

  final User? user;

  const AuthState.authenticated(User user)
      : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  const AuthState.unverified() : this._(status: AuthStatus.unverified);


  const AuthState._({required this.status, this.user});

  @override
  List<Object?> get props => [status, user];
}
