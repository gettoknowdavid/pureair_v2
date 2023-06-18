import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/services/location_service.dart';

part 'location_cubit.freezed.dart';
part 'location_state.dart';

@injectable
class LocationCubit extends Cubit<LocationState> {
  final LocationService _locationService;
  LocationCubit(this._locationService) : super(LocationState.initial());

  Future<void> getUserLocation() async {
    emit(state.copyWith(loading: true));
    final position = await _locationService.determinePosition();
    final geo = [position.latitude, position.longitude];
    final placemark = await _locationService.getPlacemark(geo[0], geo[1]);
    emit(state.copyWith(
      loading: false,
      city: placemark.subAdministrativeArea,
      state: placemark.locality,
      country: placemark.country,
      geo: geo,
    ));
  }

  Future<Place> getLocation(double lat, double lon) async {
    final placemark = await _locationService.getPlacemark(lat, lon);
    return Place(
      city: placemark.subAdministrativeArea!,
      state: placemark.locality!,
      country: placemark.country!,
      address: placemark.street!,
      lat: lat,
      lon: lon,
    );
  }
}
