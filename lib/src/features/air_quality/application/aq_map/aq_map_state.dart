part of 'aq_map_cubit.dart';

@freezed
class AQMapState with _$AQMapState {
  const factory AQMapState({
    required bool loading,
    LatLng? currentGeo,
    LatLng? geo,
    String? currentAddress,
    String? address,
    Placemark? placemark,
    Position? position,
    Place? place,
  }) = _AQMapState;

  factory AQMapState.initial() {
    return const AQMapState(
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
