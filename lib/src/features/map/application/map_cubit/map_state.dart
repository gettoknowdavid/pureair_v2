part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    required bool loading,
    String? myCity,
    String? myCountry,
    List<double>? myGeo,
    String? city,
    String? country,
    List<double>? geo,
  }) = _MapState;

  factory MapState.initial() {
    return const MapState(loading: false);
  }
}
