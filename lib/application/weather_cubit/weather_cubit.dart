import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/services/location_service.dart';

part 'weather_cubit.freezed.dart';
part 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final IWeatherFacade _facade;
  final LocationService _locationService;
  WeatherCubit(
    this._facade,
    this._locationService,
  ) : super(WeatherState.initial());

  Future<void> currentRetrieved({
    required double lat,
    required double lon,
    String? units,
  }) async {
    emit(state.copyWith(currentLoading: true, currentOption: none()));

    final result = await _facade.getCurrent(lat: 4.8472, lon: 6.9746);

    emit(state.copyWith(
      currentLoading: false,
      currentOption: some(result),
    ));
  }

  Future<void> forecastRetrieved({
    required double lat,
    required double lon,
    String? units,
  }) async {
    emit(state.copyWith(forecastLoading: true, forecastOption: none()));

    final result = await _facade.getForecast(lat: 4.8472, lon: 6.9746);

    emit(state.copyWith(
      forecastLoading: false,
      forecastOption: some(result),
    ));
  }

  Future<Weather> getWeather({
    required double lat,
    required double lon,
    String? units,
  }) async {
    final result = await _facade.getWeather(lat: 4.8472, lon: 6.9746);
    return result.getOrElse(() => Weather.empty());
  }

  Future<void> initialized([String? units]) async {
    emit(state.copyWith(
      currentLoading: true,
      forecastLoading: true,
      currentOption: none(),
      forecastOption: none(),
    ));

    final position = await _locationService.determinePosition();
    final lat = position.latitude;
    final lon = position.longitude;

    final currentResult = await _facade.getCurrent(
      lat: lat,
      lon: lon,
      units: units,
    );

    final forecastResult = await _facade.getForecast(
      lat: lat,
      lon: lon,
      units: units,
    );

    emit(state.copyWith(
      currentLoading: false,
      forecastLoading: false,
      currentOption: some(currentResult),
      forecastOption: some(forecastResult),
    ));
  }
}
