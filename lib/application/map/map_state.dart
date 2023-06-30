part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    required bool loading,
    LatLng? currentGeo,
    LatLng? geo,
    String? currentAddress,
    String? address,
    Placemark? placemark,
    Position? position,
    Place? place,
  }) = _MapState;

  factory MapState.initial() {
    return const MapState(
      loading: false,
      address: null,
      currentAddress: null,
      currentGeo: null,
      geo: null,
      place: null,
      placemark: null,
      position: null,
    );
  }
}
