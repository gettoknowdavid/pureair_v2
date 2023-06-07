import 'package:dartz/dartz.dart' hide State;
import 'package:pureair_v2/domain/domain.dart';

abstract class IAirQualityFacade {
  /// Return specified city's data object.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AqiError].
  ///
  /// Accepts three parameters:
  ///
  /// `city`: The city's English name, can be found using the respective listing endpoint.
  ///
  /// `state`: The state's English name, can be found using the respective listing endpoint.
  ///
  /// `country`: The country's English name, can be found using the respective listing endpoint.
  Future<Either<AqiError, AirQuality>> getByCity({
    required String city,
    required String state,
    required String country,
  });

  /// Returns nearest city's data, using IP address geo location.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AqiError].
  Future<Either<AqiError, AirQuality>> getByIPAddress();

  /// Returns nearest city's data, using a specified set of GPS coordinates.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AqiError].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: Latitude numerical value, within range [-90, 90].
  ///
  /// `lon`: Longitude numerical value, within range [-180, 180].
  Future<Either<AqiError, AirQuality>> getByLatLon(String lat, String lon);

  /// Returns an array of all supported cities, inside a specified state
  /// if successful, and an error class [AqiError] containing the error message.
  ///
  /// City with no active stations will not be returned.
  /// Each [City] object contains its English name `city` or `name`
  /// (requested by other endpoints)
  ///
  /// Accepts two parameters:
  ///
  /// `state`: The state's English name, can be found using the respective listing endpoint.
  ///
  /// `country`: The country's English name, can be found using the respective listing endpoint.
  Future<Either<AqiError, List<City?>?>> getSupportedCities({
    required String state,
    required String country,
  });

  /// Returns an array of all supported countries if successful, and
  /// an error class [AqiError] containing the error message.
  ///
  /// Countries with no active stations will not be returned.
  /// Each [Country] object contains its English name `country` or `name`
  /// (requested by other endpoints)
  Future<Either<AqiError, List<Country?>?>> getSupportedCountries();

  /// Returns an array of all supported states, inside a specified country
  /// if successful, and an error class [AqiError] containing the error message.
  ///
  /// States with no active stations will not be returned.
  /// Each [State] object contains its English name `state` or `name`
  /// (requested by other endpoints)
  ///
  /// Accepts one parameter:
  ///
  /// `country`: The country's English name, which can be found using the respective listing endpoint.
  Future<Either<AqiError, List<State?>?>> getSupportedStates(String country);
}
