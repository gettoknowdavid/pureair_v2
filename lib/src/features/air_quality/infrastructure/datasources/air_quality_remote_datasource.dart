import 'package:dio/dio.dart';
import 'package:pureair_v2/src/features/air_quality/domain/domain.dart';
import 'package:pureair_v2/src/features/air_quality/infrastructure/datasources/datasources.dart';
import 'package:retrofit/retrofit.dart';

part 'air_quality_remote_datasource.g.dart';

@RestApi()
abstract class AirQualityRemoteDatasource {
  factory AirQualityRemoteDatasource(Dio dio, {String baseUrl}) =
      _AirQualityRemoteDatasource;

  /// This API can be used to retrieve the air quality data for the nearest
  /// station from a given latitude/longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/feed/geo:{lat};{lon}/')
  Future<AirQualityResponse<AirQuality?>> getByGeo({
    @Path('lat') required num lat,
    @Path('lon') required num lon,
  });

  /// This API can be used to get for the real-time Air Quality index for a
  /// given station.
  ///
  /// `city`: The name of the city to be retrieved.
  @GET('/feed/{city}/')
  Future<AirQualityResponse<AirQuality?>> getCity(@Path('city') String city);

  /// This API can be used to retrieve the air quality data for the nearest
  /// station close to the user's location, based on the IP address information
  /// from the user's device.
  @GET('/feed/here/')
  Future<AirQualityResponse<AirQuality?>> getLocalized();

  /// This API can be used to search stations by name.
  ///
  /// `keyword`: The name of the city, station you want to search
  @GET('/search/?')
  Future<AirQualityResponse<List<SearchData?>>> search(
    @Query('keyword') String keyword,
  );
}
