part of 'weather_bloc.dart';

@freezed
class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.initialized() = _Initialized;
  const factory WeatherEvent.currentRetrieved({
    required double lat,
    required double lon,
    String? units,
  }) = _CurrentRetrieved;
  const factory WeatherEvent.forecastRetrieved({
    required double lat,
    required double lon,
    String? units,
  }) = _ForecastRetrieved;
}
