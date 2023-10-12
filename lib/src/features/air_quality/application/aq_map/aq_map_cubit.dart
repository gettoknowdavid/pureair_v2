import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../services/services.dart';
import '../../../air_quality/domain/entities/entities.dart';
import '../../../air_quality/domain/i_air_quality_facade.dart';
import '../../../map/domain/entities/entities.dart';

part 'aq_map_cubit.freezed.dart';
part 'aq_map_state.dart';

@injectable
class AQMapCubit extends Cubit<AQMapState> {
  final LocationService _locationService;
  final IAirQualityFacade _airQualityFacade;
  AQMapCubit(
    this._locationService,
    this._airQualityFacade,
  ) : super(AQMapState.initial());

  final mapCompleter = Completer<GoogleMapController>();
  late GoogleMapController mapController;

  Future<void> onMapCreated(GoogleMapController c) async {
    mapController = c;
    // final s = await getMapBounds();
    // Logger().wtf(s);
    mapCompleter.complete(c);
  }

  Future<void> onCameraMove(position) async {
    // final s = await getMapBounds();
    // Logger().wtf(s);
  }

  Future<List<MapData?>> getMapBounds(GoogleMapController c) async {
    final visibleRegion = await c.getVisibleRegion();

    final northeast = visibleRegion.northeast;
    final southwest = visibleRegion.southwest;

    final lat1 = southwest.latitude;
    final lng1 = southwest.longitude;
    final lat2 = northeast.latitude;
    final lng2 = northeast.longitude;

    final stationsOnMapResult = await _airQualityFacade.stationsOnMap(
      "$lat1,$lng1,$lat2,$lng2",
    );

    final result = stationsOnMapResult.getOrElse(() => []);

    return result;
  }

  Future<void> goToMyLocation() async {
    final controller = await mapCompleter.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: state.currentGeo!, zoom: 12),
      ),
    );
  }

  Future<void> initialized() async {
    emit(state.copyWith(loading: true));
    Logger().wtf(_locationService.currentGeo);
    final geo = _locationService.currentGeo;

    // final result = await _locationService.determinePosition();
    // Logger().d(result);

    final currentGeo = LatLng(geo.latitude, geo.longitude);

    emit(state.copyWith(loading: false, currentGeo: currentGeo));
  }

  Future<void> getLocationDetails(LatLng geo) async {
    emit(state.copyWith(loading: true));

    final placemarks = await placemarkFromCoordinates(
      geo.latitude,
      geo.longitude,
    );

    emit(state.copyWith(loading: false, placemark: placemarks[0]));
  }

  void updatePlace(Place place) {
    emit(state.copyWith(place: place));
  }
}
