import 'package:equatable/equatable.dart';

/// Base Result class
/// [E] should be [Exception] or a subclass of it
/// [S] represents the type of the success value
sealed class Result<E extends Exception, S> with EquatableMixin {
  const Result();

  B fold<B>(B Function(E failure) ifFailure, B Function(S success) ifSuccess);
}

final class Failure<E extends Exception, S> extends Result<E, S> {
  const Failure(this._exception);
  final E _exception;
  E get exception => _exception;

  @override
  List<Object?> get props => [_exception];

  @override
  B fold<B>(B Function(E failure) ifFailure, B Function(S success) ifSuccess) {
    return ifFailure(_exception);
  }
}

final class Success<E extends Exception, S> extends Result<E, S> {
  const Success(this._value);
  final S _value;
  S get value => _value;

  @override
  List<Object?> get props => [_value];

  @override
  B fold<B>(B Function(E failure) ifFailure, B Function(S success) ifSuccess) {
    return ifSuccess(_value);
  }
}
