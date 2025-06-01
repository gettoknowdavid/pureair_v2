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
  const CitiesAddCityPressed(this.city);
  final City city;

  @override
  List<Object?> get props => [city];
}

final class CitiesRemoveCityPressed extends CitiesEvent {
  const CitiesRemoveCityPressed(this.city);
  final City city;

  @override
  List<Object?> get props => [city];
}
