import 'package:dartz/dartz.dart' hide State;
import 'package:pureair_v2/domain/domain.dart';

abstract class IAirQualityFacade {
  /// Returns nearest city's current data, using a specified set of GPS coordinates.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AqiError].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: Latitude numerical value, within range [-90, 90].
  ///
  /// `lon`: Longitude numerical value, within range [-180, 180].
  Future<Either<AqiError, AirQuality>> getCurrent(double lat, double lon);

  /// Returns forecast air quality data, using a specified set of GPS coordinates.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AqiError].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: Latitude numerical value, within range [-90, 90].
  ///
  /// `lon`: Longitude numerical value, within range [-180, 180].
  Future<Either<AqiError, AirQuality>> getForecast(double lat, double lon);

  /// Returns historical air quality data, using a specified set of GPS coordinates.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AqiError].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: Latitude numerical value, within range [-90, 90].
  ///
  /// `lon`: Longitude numerical value, within range [-180, 180].
  Future<Either<AqiError, AirQuality>> getHistorical({
    required double lat,
    required double lon,
    required int start,
    required int end,
  });
}
