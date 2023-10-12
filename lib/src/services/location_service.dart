import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';

import '../features/map/domain/entities/entities.dart';
import '../utils/utils.dart';

@singleton
class LocationService {
  LatLng _currentGeo = const LatLng(0.0, 0.0);

  LatLng get currentGeo => _currentGeo;

  final locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  Future<List<PlaceSuggestion?>> autoComplete(String input) async {
    final request = '/place/autocomplete/json?input=$input&types=address';

    try {
      final response = await googleDioClient().get(request);
      final result = response.data;

      return result['predictions']
          .map<PlaceSuggestion>((p) => PlaceSuggestion(
              placeId: p['place_id'], description: p['description']))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch suggestion: $e');
    }
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final location = await Geolocator.getCurrentPosition();

    _currentGeo = LatLng(location.latitude, location.longitude);

    return location;
  }

  Stream<Position> getPositionStream() {
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
  

  Future<List<double>> geoFromAddress(String name) async {
    final location = await locationFromAddress(name);
    final geo = [location[0].latitude, location[0].longitude];
    return geo;
  }

  Future<Flag> getFlag(List<double> geo) async {
    try {
      final placemarks = await placemarkFromCoordinates(geo[0], geo[1]);
      return Flag.fromString(placemarks[0].isoCountryCode!, fit: BoxFit.fill);
    } catch (e) {
      return Future.error('No placemark found for set geo points.');
    }
  }

  Future<Place> getPlace(String placeId) async {
    final request = "/place/details/json?place_id=$placeId";
    try {
      final response = await googleDioClient().get(request);
      final result = response.data['result'];

      final place = Place(
        placeId: result['place_id'],
        name: result['formatted_address'],
        lat: result['geometry']['location']['lat'],
        lon: result['geometry']['location']['lng'],
        types: (result['types'] as List<dynamic>).map((e) => '$e').toList(),
      );

      return place;
    } catch (e) {
      throw Exception('Failed to fetch suggestion: $e');
    }
  }

  Future<Placemark> getPlacemark(double lat, double lon) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, lon);
      return placemarks[0];
    } catch (e) {
      return Future.error('No placemark found for set geo points.');
    }
  }
}
