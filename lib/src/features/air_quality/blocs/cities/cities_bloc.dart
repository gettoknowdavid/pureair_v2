import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
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
    emit(cities.fold(CitiesLoadFailure.new, CitiesLoadSuccess.new));
  }

  Future<void> _onCitiesAddCityPressed(
    CitiesAddCityPressed event,
    Emitter<CitiesState> emit,
  ) async {
    if (state is CitiesLoadSuccess) {
      final cities = (state as CitiesLoadSuccess).cities;

      // Optimistically update the list
      final optimisticUpdate = [event.airQuality, ...cities];
      emit(CitiesLoadSuccess(optimisticUpdate));

      final city = event.airQuality.city;
      final uid = city.geo?.generateCityUid;
      final cityWithUid = city.copyWith(uid: uid);
      final failureOrSuccess = await _addCityUseCase(cityWithUid);
      failureOrSuccess.fold(
        (exception) {
          // Remove added city air quality data
          final list = cities.where((c) => c?.city.geo != city.geo).toList();
          Future.microtask(() => emit(CitiesLoadSuccess(list)));

          emit(CitiesLoadFailure(exception));
        },
        (_) {},
      );
    }
  }

  void _onCitiesRemoveCityPressed(
    CitiesRemoveCityPressed event,
    Emitter<CitiesState> emit,
  ) {
    if (state is CitiesLoadSuccess) {
      final cities = (state as CitiesLoadSuccess).cities;

      // Optimistically update the list

      final city = event.airQuality.city;
      final list = cities.where((c) => c?.city.geo != city.geo).toList();
      emit(CitiesLoadSuccess(list));

      if (cities.isEmpty) return;
      final failureOrSuccess = _repository.removeCity(city);
      failureOrSuccess.fold(
        (exception) => emit(CitiesLoadFailure(exception)),
        (_) {},
      );
    }
  }

  bool isAlreadySaved(City? city) {
    if (state is CitiesLoadSuccess) {
      final cities = (state as CitiesLoadSuccess).cities;
      final geos = cities.map((a) => a?.city.geo).toSet();
      return geos.contains(city?.geo);
    }
    return false;
  }
}

@lazySingleton
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
