part of 'air_quality_bloc.dart';

@freezed
class AirQualityState with _$AirQualityState {
  const factory AirQualityState({
    required bool loading,
    required Option<Either<AqiError, AirQuality>> ipAddressAQIOption,
  }) = _AirQualityState;

  factory AirQualityState.initial() {
    return AirQualityState(
      loading: false,
      ipAddressAQIOption: none(),
    );
  }
}
