part of 'cities_bloc.dart';

sealed class CitiesState with EquatableMixin {
  const CitiesState();

  @override
  List<Object?> get props => [];
}

final class CitiesInitial extends CitiesState {
  const CitiesInitial();
}

final class CitiesLoadInProgress extends CitiesState {
  const CitiesLoadInProgress();
}

final class CitiesLoadSuccess extends CitiesState {
  const CitiesLoadSuccess(this.cities);
  final Set<AirQuality?> cities;

  @override
  List<Object?> get props => [cities];
}

final class CitiesLoadFailure extends CitiesState {
  const CitiesLoadFailure(this.exception);
  final PureAirException exception;

  @override
  List<Object?> get props => [exception];
}
