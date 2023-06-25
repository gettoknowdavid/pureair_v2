import 'package:dartz/dartz.dart';
import 'package:pureair_v2/domain/domain.dart';

abstract class IAirQualityFacade {
  /// Returns nearest city's current data from a given latitude and longitude.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AQError].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: The latitude
  /// `lon`: The longitude
  Future<Either<AQError, AirQuality?>> getByGeo(double lat, double lon);

  Future<void> addCity(City city);

  Future<void> removeCity(City city);

  Future<void> clearSavedCities();

  Future<List<City?>> getCities();

  Future<Either<AQError, List<AirQuality?>>> getAllCityData();

  /// Returns the air quality data for the city with the give city name.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AQError].
  ///
  /// Accepts one parameters:
  ///
  /// `city`: The name of the city
  Future<Either<AQError, AirQuality?>> getCity(String city);

  /// Returns nearest city's current data, using the IP address of the your
  /// device.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [AQError].
  Future<Either<AQError, AirQuality?>> getLocal();

  /// Returns an array of possible stations matching the keyword inputted
  /// for search by the user.
  ///
  /// If successful, the request returns an [List] of [SearchData] object and
  /// if unsuccessful, the request returns an [AQError].
  ///
  /// Accepts one parameters:
  ///
  /// `keyword`: The name of the station
  Future<Either<AQError, List<SearchData?>>> search(String keyword);

  /// Returns an array of possible stations on a map within the given
  /// geo boundary
  ///
  /// If successful, the request returns an [List] of [MapData] object and
  /// if unsuccessful, the request returns an [AQError].
  ///
  /// Accepts one parameters:
  ///
  /// `latlng`: Map bounds in the form lat1, lng1, lat2, lng2
  Future<Either<AQError, List<MapData?>>> stationsOnMap(String latlng);
}
