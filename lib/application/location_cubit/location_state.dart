part of 'location_cubit.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState({
    required bool loading,
    String? myCity,
    String? myCountry,
    List<double>? myGeo,
    String? city,
    String? country,
    List<double>? geo,
  }) = _LocationState;

  factory LocationState.initial() {
    return const LocationState(loading: false);
  }
}
