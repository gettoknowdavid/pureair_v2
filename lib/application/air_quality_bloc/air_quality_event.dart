part of 'air_quality_bloc.dart';

@freezed
class AirQualityEvent with _$AirQualityEvent {
  const factory AirQualityEvent.started() = _Started;
  const factory AirQualityEvent.ipAddressAQIRequested() =
      _IPAddressAQIRequested;
}
