import 'package:dio/dio.dart';
import 'package:pureair_v2/src/features/aqi/domain/domain.dart';
import 'package:pureair_v2/src/features/aqi/infrastructure/datasources/datasources.dart';
import 'package:retrofit/retrofit.dart';

part 'aqi_remote_datasource.g.dart';

@RestApi()
abstract class AQIRemoteDatasource {
  factory AQIRemoteDatasource(Dio dio, {String baseUrl}) = _AQIRemoteDatasource;

  /// This API can be used to retrieve the air quality data for the nearest
  /// station from a given latitude/longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/feed/geo:{lat};{lon}/')
  Future<AQIResponse<AQI?>> getByGeo({
    @Path('lat') required num lat,
    @Path('lon') required num lon,
  });

  /// This API can be used to get for the real-time Air Quality index for a
  /// given station.
  ///
  /// `city`: The name of the city to be retrieved.
  @GET('/feed/{city}/')
  Future<AQIResponse<AQI?>> getCity(@Path('city') String city);

  /// This API can be used to retrieve the air quality data for the nearest
  /// station close to the user's location, based on the IP address information
  /// from the user's device.
  @GET('/feed/here/')
  Future<AQIResponse<AQI?>> getLocalized();
}
