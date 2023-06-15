import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';

part 'weather_bloc.freezed.dart';
part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWeatherFacade _facade;
  WeatherBloc(this._facade) : super(WeatherState.initial()) {
    on<_CurrentRetrieved>(_currentRetrieved);
    on<_ForecastRetrieved>(_forecastRetrieved);
    on<_Initialized>(_initialized);
  }

  _currentRetrieved(_CurrentRetrieved event, Emitter<WeatherState> emit) async {
    final result = await _facade.getCurrent(lat: 4.8472, lon: 6.9746);

    emit(state.copyWith(currentLoading: true, currentOption: none()));

    emit(
      state.copyWith(
        currentLoading: false,
        currentOption: some(result),
      ),
    );
  }

  _forecastRetrieved(
    _ForecastRetrieved event,
    Emitter<WeatherState> emit,
  ) async {
    final result = await _facade.getForecast(lat: 4.8472, lon: 6.9746);

    emit(state.copyWith(forecastLoading: true, forecastOption: none()));

    emit(
      state.copyWith(
        forecastLoading: false,
        forecastOption: some(result),
      ),
    );
  }

  _initialized(_Initialized event, Emitter<WeatherState> emit) async {
    final currentResult = await _facade.getCurrent(lat: 4.8472, lon: 6.9746);
    final forecastResult = await _facade.getForecast(lat: 4.8472, lon: 6.9746);

    emit(state.copyWith(
      currentLoading: true,
      forecastLoading: true,
      currentOption: none(),
      forecastOption: none(),
    ));

    emit(
      state.copyWith(
        currentLoading: false,
        forecastLoading: false,
        currentOption: some(currentResult),
        forecastOption: some(forecastResult),
      ),
    );
  }
}
