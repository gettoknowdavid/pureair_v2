import 'package:dartz/dartz.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/domain/errors/weather_error.dart';

abstract class IWeatherFacade {
  /// Returns nearest city's current weather data, using a specified set of
  /// GPS coordinates.
  ///
  /// If successful, the request returns an [Weather] object and if
  /// unsuccessful, the request returns an [WeatherError].
  ///
  /// Accepts three parameters:
  ///
  /// `lat`: Latitude numerical value, within range [-90, 90].
  ///
  /// `lon`: Longitude numerical value, within range [-180, 180].
  ///
  /// `units`: Units of measurement. standard, metric and imperial units are
  /// available. If you do not use the units parameter, standard units will be
  /// applied by default.
  Future<Either<WeatherError, Weather>> getCurrent({
    required double lat,
    required double lon,
    String? units,
  });

  /// Returns nearest city's current weather data, using a specified set of
  /// GPS coordinates.
  ///
  /// If successful, the request returns an [Weather] object and if
  /// unsuccessful, the request returns an [WeatherError].
  ///
  /// Accepts three parameters:
  ///
  /// `lat`: Latitude numerical value, within range [-90, 90].
  ///
  /// `lon`: Longitude numerical value, within range [-180, 180].
  ///
  /// `units`: Units of measurement. standard, metric and imperial units are
  /// available. If you do not use the units parameter, standard units will be
  /// applied by default.
  Future<Either<WeatherError, Weather>> getForecast({
    required double lat,
    required double lon,
    String? units,
  });
}
