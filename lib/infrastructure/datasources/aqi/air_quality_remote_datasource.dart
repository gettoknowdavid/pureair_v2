import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../infrastructure.dart';

part 'air_quality_remote_datasource.g.dart';

/// Remote data source for retrieving air quality information from a REST API.

@RestApi()
abstract class AirQualityRemoteDatasource {
  /// Constructs an instance of [AirQualityRemoteDatasource].
  @factoryMethod
  factory AirQualityRemoteDatasource(Dio dio, {String baseUrl}) =
      _AirQualityRemoteDatasource;

  /// Retrieves air quality information by city.
  ///
  /// `city`: The name of the city.
  /// `state`: The name of the state.
  /// `country`: The name of the country.
  @GET('/v2/city')
  Future<AirQualityResponse<AirQualityDto>> getByCity({
    @Query('city') required String city,
    @Query('state') required String state,
    @Query('country') required String country,
  });

  /// Retrieves air quality information by IP address.
  @GET('/v2/nearest_city')
  Future<AirQualityResponse<AirQualityDto>> getByIPAddress();

  /// Retrieves air quality information by latitude and longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/v2/nearest_city')
  Future<AirQualityResponse<AirQualityDto>> getByLatLon({
    @Query('lat') required String lat,
    @Query('lon') required String lon,
  });

  /// Retrieves the list of cities supported by the API within a specific state and country.
  ///
  /// `state`: The name of the state.
  /// `country`: The name of the country.
  @GET('/v2/cities/')
  Future<AirQualityResponse<List<CityDto>>> getSupportedCities({
    @Query('state') required String state,
    @Query('country') required String country,
  });

  /// Retrieves the list of countries supported by the API.
  @GET('/v2/countries')
  Future<AirQualityResponse<List<CountryDto>>> getSupportedCountries();

  /// Retrieves the list of states supported by the API within a specific country.
  ///
  /// `country`: The name of the country.
  @GET('/v2/states/')
  Future<AirQualityResponse<List<StateDto>>> getSupportedStates(
    @Query('country') String country,
  );
}
