import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/infrastructure/responses/aq_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../dtos/dtos.dart';

part 'aq_remote_datasource.g.dart';

/// Remote data source for retrieving air quality information from a REST API.
@RestApi()
abstract class AQRemoteDatasource {
  /// Constructs an instance of [AQRemoteDatasource].
  @factoryMethod
  factory AQRemoteDatasource(Dio dio, {String baseUrl}) = _AQRemoteDatasource;

  /// This API can be used to retrieve the air quality data for the nearest
  /// station from a given latitude/longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/feed/geo:{lat};{lon}/')
  Future<AQResponse<AirQualityDto?>> getByGeo(
    @Path('lat') num lat,
    @Path('lon') num lon,
  );

  /// This API can be used to get for the real-time Air Quality index for a
  /// given station.
  ///
  /// `city`: The name of the city to be retrieved.
  @GET('/feed/{city}/')
  Future<AQResponse<AirQualityDto?>> getCity(@Path("city") city);

  /// This API can be used to retrieve the air quality data for the nearest
  /// station close to the user's location, based on the IP address information
  /// from the user's device.
  @GET('/feed/here/')
  Future<AQResponse<AirQualityDto?>> getLocalized();

  /// This API can be used to search stations by name.
  ///
  /// `keyword`: The name of the city, station you want to search
  @GET('/search/?')
  Future<AQResponse<List<SearchDataDto?>>> search(
    @Query('keyword') String keyword,
  );

  /// This API can be used to get all the stations within a given lat/lng
  /// bounds.
  @GET('/map/bounds/?')
  Future<AQResponse<List<MapDataDto?>>> stationsOnMap(
    /// Map bounds in the form lat1, lng1, lat2, lng2
    @Query('latlng') String latlng,
  );
}
