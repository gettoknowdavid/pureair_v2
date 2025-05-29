part of 'map_notifier.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(false) bool loading,
    String? currentAddress,
    String? address,
    Placemark? placemark,
    Position? position,
    Place? place,
  }) = _MapState;
  
}
