part of 'air_quality_bloc.dart';

@freezed
class AirQualityState with _$AirQualityState {
  const factory AirQualityState({
    required bool loading,
    required List<AirQuality?> airQualityList,
    required Option<Either<AqiError, AirQuality>> currentAQIOption,
  }) = _AirQualityState;

  factory AirQualityState.initial() {
    return AirQualityState(
      loading: true,
      airQualityList: [],
      currentAQIOption: none(),
    );
  }
}
