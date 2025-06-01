import 'package:dartz/dartz.dart';
import 'package:pureair_v2/src/core/core.dart' show  SingleLineString;
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/models/models.dart';

abstract class AirQualityRepository {
  /// Adds a [City] to the repository for saving
  Either<PureAirException, Unit> addCity(City city);

  /// Removes all saved cities of type [City] from the repository
  void clearSavedCities();

  /// Returns nearest city's current data from a given latitude and longitude.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [PureAirException].
  ///
  /// Accepts two parameters:
  ///
  /// `lat`: The latitude
  /// `lon`: The longitude
  Future<Either<PureAirException, AirQuality>> getByGeo(List<double> geo);

  /// Returns a list of [City] saved to the repository
  List<City?> getCities();

  /// Returns the [AirQuality] data of the list of [City] save in the
  /// repository
  Future<Either<PureAirException, List<AirQuality?>>> getCitiesAirQualityData();

  /// Returns the air quality data for the city with the give city name.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [PureAirException].
  ///
  /// Accepts one parameters:
  ///
  /// `city`: The name of the city
  Future<Either<PureAirException, AirQuality?>> getCity(String city);

  /// Returns nearest city's current data, using the IP address of the your
  /// device.
  ///
  /// If successful, the request returns an [AirQuality] object and if
  /// unsuccessful, the request returns an [PureAirException].
  Future<Either<PureAirException, AirQuality>> getLocalized();

  /// Removes a [City] from the repository for saving
  Either<PureAirException, Unit> removeCity(City city);

  /// Returns an array of possible stations matching the keyword inputted
  /// for search by the user.
  ///
  /// If successful, the request returns an [List] of [SearchData] object and
  /// if unsuccessful, the request returns an [PureAirException].
  ///
  /// Accepts one parameters:
  ///
  /// `keyword`: The name of the station
  Future<Either<PureAirException, List<SearchData?>>> search(
    SingleLineString keyword,
  );

  /// Returns an array of possible stations on a map within the given
  /// geo boundary
  ///
  /// If successful, the request returns an [List] of [Station] object and
  /// if unsuccessful, the request returns an [PureAirException].
  ///
  /// Accepts one parameters:
  ///
  /// `latlng`: Map bounds in the form lat1, lng1, lat2, lng2
  Future<Either<PureAirException, List<Station>>> stationsOnMap(
    String latlng,
  );
}
