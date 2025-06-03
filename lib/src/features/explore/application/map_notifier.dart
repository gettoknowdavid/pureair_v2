// import 'dart:async';

// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
// import 'package:pureair_v2/src/features/explore/explore.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'map_notifier.freezed.dart';
// part 'map_notifier.g.dart';
// part 'map_state.dart';

// final mapCompleterProvider = StateProvider<Completer<GoogleMapController>>((_) {
//   return Completer<GoogleMapController>();
// });

// final mapControllerProvider = StateProvider<GoogleMapController?>((_) {
//   return null;
// });

// @riverpod
// FutureOr<List<Station?>> stationsOnMapBound(Ref ref) async {
//   final controller = ref.watch(mapControllerProvider);
//   if (controller == null) return [];

//   final visibleRegion = await controller.getVisibleRegion();

//   final northeast = visibleRegion.northeast;
//   final southwest = visibleRegion.southwest;

//   final lat1 = southwest.latitude;
//   final lng1 = southwest.longitude;
//   final lat2 = northeast.latitude;
//   final lng2 = northeast.longitude;

//   final facade = ref.read(airQualityFacadeProvider);
//   final stationsOnMap = await facade.stationsOnMap('$lat1,$lng1,$lat2,$lng2');
//   final result = stationsOnMap.getOrElse(() => []);
//   return result;
// }

// @riverpod
// class MapNotifier extends _$MapNotifier {
//   @override
//   MapState build() {
//     final currentPosition = ref.watch(currentPositionProvider);
//     return state = currentPosition.when(
//       data: (position) => state.copyWith(position: position),
//       loading: () => state.copyWith(loading: true),
//       error: (_, __) => state,
//     );
//   }

//   void onMapCreated(GoogleMapController controller) {
//     ref.read(mapControllerProvider.notifier).state = controller;
//     ref.read(mapCompleterProvider).complete(controller);
//   }
// }
