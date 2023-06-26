part of 'air_quality_cubit.dart';

@freezed
class AirQualityState with _$AirQualityState {
  const factory AirQualityState({
    required bool localLoading,
    required bool citiesLoading,
    required Option<Either<AQError, AirQuality?>> localOption,
    required Option<Either<AQError, List<AirQuality?>>> citiesOption,
  }) = _AirQualityState;

  factory AirQualityState.initial() {
    return AirQualityState(
      localLoading: false,
      citiesLoading: false,
      localOption: none(),
      citiesOption: none(),
    );
  }
}
