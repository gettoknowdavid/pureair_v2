import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/core/use_case/use_case.dart';
import 'package:pureair_v2/src/exceptions/exceptions.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

part 'cities_event.dart';
part 'cities_state.dart';

class CitiesBloc extends Bloc<CitiesEvent, CitiesState> {
  CitiesBloc({
    required AirQualityRepository repository,
    required AddCityUseCase addCityUseCase,
  })  : _repository = repository,
        _addCityUseCase = addCityUseCase,
        super(const CitiesInitial()) {
    on<CitiesStarted>(_onCitiesStarted);
    on<CitiesAddCityPressed>(_onCitiesAddCityPressed);
    on<CitiesRemoveCityPressed>(_onCitiesRemoveCityPressed);
  }

  final AirQualityRepository _repository;
  final AddCityUseCase _addCityUseCase;

  Future<void> _onCitiesStarted(
    CitiesStarted event,
    Emitter<CitiesState> emit,
  ) async {
    emit(const CitiesLoadInProgress());
    final cities = await _repository.getCitiesAirQualityData();
    emit(
      cities.fold(
        CitiesLoadFailure.new,
        (airQualities) => CitiesLoadSuccess(
          Set<AirQuality?>.from(airQualities),
        ),
      ),
    );
  }

  Future<void> _onCitiesAddCityPressed(
    CitiesAddCityPressed event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitiesLoadSuccess) {
      final cities = (state as CitiesLoadSuccess).cities;
      final city = event.city;
      if (cities.map((v) => v?.city.geo).contains(city.geo)) {
        const exception = PureAirException('City already added to the list');
        emit(const CitiesLoadFailure(exception));
      } else {
        final cityWithUid = city.copyWith(uid: city.geo?.generateCityUid);
        final failureOrSuccess = await _addCityUseCase(cityWithUid);
        emit(
          failureOrSuccess.fold(
            CitiesLoadFailure.new,
            (newCity) {
              final updatedCities = cities..add(newCity);
              return CitiesLoadSuccess(updatedCities);
            },
          ),
        );
      }
    }
  }

  void _onCitiesRemoveCityPressed(
    CitiesRemoveCityPressed event,
    Emitter<CitiesState> emit,
  ) {
    if (state is CitiesLoadSuccess) {
      final city = event.city;
      final cities = (state as CitiesLoadSuccess).cities;
      if (cities.isEmpty) return;
      final failureOrSuccess = _repository.removeCity(city);
      failureOrSuccess.fold(
        (exception) => emit(CitiesLoadFailure(exception)),
        (_) {
          cities.removeWhere((c) => c!.city.geo == city.geo);
          emit(CitiesLoadSuccess(cities));
        },
      );
    }
  }
}

class AddCityUseCase implements UseCase<void, City> {
  const AddCityUseCase({
    required AirQualityRepository repository,
  }) : _repository = repository;
  final AirQualityRepository _repository;

  @override
  Future<Either<PureAirException, AirQuality?>> call(City params) async {
    final geo = params.geo!;

    final addCityTask = Task(() async => _repository.addCity(params));

    final resultTask = addCityTask.flatMap(
      (addResult) => addResult.fold(
        (f) => Task(() async => left<PureAirException, AirQuality?>(f)),
        (_) => Task(() => _repository.getByGeo(geo)),
      ),
    );

    return resultTask.run();
  }
}
