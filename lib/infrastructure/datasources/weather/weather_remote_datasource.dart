import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../infrastructure.dart';

part 'weather_remote_datasource.g.dart';

/// Remote data source for retrieving weather information from a REST API.

@RestApi()
abstract class WeatherRemoteDatasource {
  /// Constructs an instance of [WeatherRemoteDatasource].
  @factoryMethod
  factory WeatherRemoteDatasource(Dio dio, {String baseUrl}) =
      _WeatherRemoteDatasource;

  /// Retrieves the current weather information by latitude and longitude.
  ///
  /// `lat`: The latitude.
  ///
  /// `lon`: The longitude.
  ///
  /// `exclude`: By using this parameter you can exclude some parts of the
  /// weather data from the API response. It should be a comma-delimited
  /// list (without spaces). Available values:
  ///  *  current
  ///  *  minutely
  ///  *  hourly
  ///  *  daily
  ///  *  alerts
  @GET('/data/3.0/onecall')
  Future<WeatherDto> getWeather({
    @Query('lat') required double lat,
    @Query('lon') required double lon,
    @Query('exclude') String? exclude,
    @Query('units') String? units,
  });
}
