part of 'weather_cubit.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    required bool currentLoading,
    required bool forecastLoading,
    required Option<Either<WeatherError, Weather>> currentOption,
    required Option<Either<WeatherError, Weather>> forecastOption,
  }) = _WeatherState;

  factory WeatherState.initial() {
    return WeatherState(
      currentLoading: false,
      forecastLoading: false,
      currentOption: none(),
      forecastOption: none(),
    );
  }
}
