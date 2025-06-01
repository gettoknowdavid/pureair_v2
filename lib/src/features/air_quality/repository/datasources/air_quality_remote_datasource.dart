import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/core/core.dart' show BaseResponse;
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:retrofit/retrofit.dart';

part 'air_quality_remote_datasource.g.dart';

@Injectable()
@RestApi()
abstract class AirQualityRemoteDatasource {
  @factoryMethod
  factory AirQualityRemoteDatasource(
    Dio dio, {
    @Named('baseUrl') String baseUrl,
  }) = _AirQualityRemoteDatasource;

  /// This API can be used to retrieve the air quality data for the nearest
  /// station from a given latitude/longitude.
  ///
  /// `lat`: The latitude.
  /// `lon`: The longitude.
  @GET('/feed/geo:{lat};{lon}/')
  Future<BaseResponse<AirQuality?>> getByGeo({
    @Path('lat') required num lat,
    @Path('lon') required num lon,
  });

  /// This API can be used to get for the real-time Air Quality index for a
  /// given station.
  ///
  /// `city`: The name of the city to be retrieved.
  @GET('/feed/{city}/')
  Future<BaseResponse<AirQuality?>> getCity(@Path('city') String city);

  /// This API can be used to retrieve the air quality data for the nearest
  /// station close to the user's location, based on the IP address information
  /// from the user's device.
  @GET('/feed/here/')
  Future<BaseResponse<AirQuality?>> getLocalized();

  /// This API can be used to search stations by name.
  ///
  /// `keyword`: The name of the city, station you want to search
  @GET('/search/?')
  Future<BaseResponse<List<SearchData?>>> search(
    @Query('keyword') String keyword,
  );

  /// This API can be used to get all the stations within a given lat/lng
  /// bounds.
  @GET('/map/bounds/?')
  Future<BaseResponse<List<Station>>> stationsOnMap(
    /// Map bounds in the form lat1, lng1, lat2, lng2
    @Query('latlng') String latlng,
  );
}
