import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/features/air_quality/domain/domain.dart';

abstract class IAirQualityFacade {
  /// Adds a [City] to the repository for saving
  void addCity(City city);

  /// Removes all saved cities of type [City] from the repository
  void clearSavedCities();

  /// Returns nearest city's current data from a given latitude and longitude.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AirQualityException].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: The latitude
  /// `lon`: The longitude
  Future<Either<AirQualityException, AirQuality?>> getByGeo({
    required double lat,
    required double lon,
  });

  /// Returns a list of [City] saved to the repository
  List<City?> getCities();

  /// Returns the [AirQuality] data of the list of [City] save in the
  /// repository
  Future<Either<AirQualityException, List<AirQuality?>>>
      getCitiesAirQualityData();

  /// Returns the air quality data for the city with the give city name.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AirQualityException].
  ///
  /// Accepts one parameters:
  ///
  /// `city`: The name of the city
  Future<Either<AirQualityException, AirQuality?>> getCity(String city);

  /// Returns nearest city's current data, using the IP address of the your
  /// device.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AirQualityException].
  Future<Either<AirQualityException, AirQuality>> getLocalized();

  /// Removes a [City] from the repository for saving
  Future<void> removeCity(City city);
}
