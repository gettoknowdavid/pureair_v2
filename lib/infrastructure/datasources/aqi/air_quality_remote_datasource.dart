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

  /// Retrieves the current air quality information by latitude and longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/data/2.5/air_pollution')
  Future<AirQualityDto> getCurrent(
    @Query('lat') double lat,
    @Query('lon') double lon,
  );

  /// Retrieves the forecast air quality information by latitude and longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/data/2.5/air_pollution/forecast')
  Future<AirQualityDto> getForecast(
    @Query('lat') double lat,
    @Query('lon') double lon,
  );

  /// Retrieves the historical air quality information by latitude and longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/data/2.5/air_pollution/history')
  Future<AirQualityDto> getHistory({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('start') required int start,
    @Query('end') required int end,
  });
}
