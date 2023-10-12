import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/services.dart';

part 'map_cubit.freezed.dart';
part 'map_state.dart';

@injectable
class MapCubit extends Cubit<MapState> {
  final LocationService _service;
  late StreamSubscription<Position> _locationSubscription;

  MapCubit(this._service) : super(MapState.initial()) {
    _locationSubscription = _service.getPositionStream().listen((event) async {
      return await onLocationChanged(event);
    });
  }

  @override
  Future<void> close() {
    _locationSubscription.cancel();
    return super.close();
  }

  Future<void> getLocation(List<double> geo) async {
    emit(state.copyWith(loading: true));
    final placemark = await _service.getPlacemark(geo[0], geo[1]);
    emit(state.copyWith(
      loading: false,
      city: placemark.locality,
      country: placemark.country,
      geo: geo,
    ));
  }

  Future<void> onLocationChanged(Position position) async {
    final myGeo = [position.latitude, position.longitude];
    final placemark = await _service.getPlacemark(myGeo[0], myGeo[1]);
    emit(state.copyWith(
      myCity: placemark.locality,
      myCountry: placemark.country,
      myGeo: myGeo,
    ));
  }
}
