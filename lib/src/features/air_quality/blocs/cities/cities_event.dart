part of 'cities_bloc.dart';

sealed class CitiesEvent with EquatableMixin {
  const CitiesEvent();

  @override
  List<Object?> get props => [];
}

final class CitiesStarted extends CitiesEvent {
  const CitiesStarted();
}

final class CitiesAddCityPressed extends CitiesEvent {
  const CitiesAddCityPressed(this.airQuality);
  final AirQuality airQuality;

  @override
  List<Object?> get props => [airQuality];
}

final class CitiesRemoveCityPressed extends CitiesEvent {
  const CitiesRemoveCityPressed(this.airQuality);
  final AirQuality airQuality;

  @override
  List<Object?> get props => [airQuality];
}
