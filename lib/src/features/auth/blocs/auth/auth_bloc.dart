import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/router/router.dart';
import 'package:pureair_v2/src/router/routes.dart' show R;

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthRepository repository,
  })  : _repository = repository,
        super(AuthState(user: repository.user)) {
    on<AuthUserSubscribed>(_onAuthUserSubscribed);
    on<AuthSignOutPressed>(_onAuthSignOutPressed);
  }

  final AuthRepository _repository;

  Future<void> _onAuthUserSubscribed(
    AuthUserSubscribed event,
    Emitter<AuthState> emit,
  ) {
    return emit.forEach(
      _repository.userChanges,
      onData: (user) => AuthState(user: user),
      onError: (error, stackTrace) => AuthState(user: User.empty),
    );
  }

  Future<void> _onAuthSignOutPressed(
    AuthSignOutPressed event,
    Emitter<AuthState> emit,
  ) {
    return _repository.signOut();
  }
}
