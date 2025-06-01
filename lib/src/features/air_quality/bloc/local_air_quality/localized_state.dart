part of 'localized_bloc.dart';

sealed class LocalizedState with EquatableMixin {
  const LocalizedState();

  @override
  List<Object?> get props => [];
}

final class LocalizedInitial extends LocalizedState {
  const LocalizedInitial();
}

final class LocalizedLoadInProgress extends LocalizedState {
  const LocalizedLoadInProgress();
}

final class LocalizedLoadSuccess extends LocalizedState {
  const LocalizedLoadSuccess(this.airQuality);
  final AirQuality airQuality;

  @override
  List<Object?> get props => [airQuality];
}

final class LocalizedLoadFailure extends LocalizedState {
  const LocalizedLoadFailure(this.exception);
  final PureAirException exception;

  @override
  List<Object?> get props => [exception];
}
