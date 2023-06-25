part of 'air_quality_cubit.dart';

@freezed
class AirQualityState with _$AirQualityState {
  const factory AirQualityState({
    required List<AirQuality?> cities,
    required bool loading,
    required Option<Either<AQError, List<AirQuality?>>> citiesOption,
  }) = _AirQualityState;

  factory AirQualityState.initial() {
    return AirQualityState(
      cities: [],
      loading: false,
      citiesOption: none(),
    );
  }
}
