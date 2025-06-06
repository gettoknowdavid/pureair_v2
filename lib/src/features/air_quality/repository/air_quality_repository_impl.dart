import 'dart:async' show TimeoutException;
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/src/exceptions/pure_air_exception.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/value_objects/single_line_string.dart';

const timeLimit = Duration(seconds: 30);

@Injectable(as: AirQualityRepository)
final class AirQualityRepositoryImpl implements AirQualityRepository {
  const AirQualityRepositoryImpl({
    required AirQualityLocalDatasource local,
    required AirQualityRemoteDatasource remote,
  })  : _local = local,
        _remote = remote;

  final AirQualityLocalDatasource _local;
  final AirQualityRemoteDatasource _remote;

  @override
  Either<PureAirException, Unit> addCity(City city) {
    try {
      _local.addCity(city.toDto);
      return const Right(unit);
    } on Exception catch (error) {
      final exception = PureAirException(error.toString());
      return Left(exception);
    }
  }

  @override
  void clearSavedCities() => _local.clearSavedCities();

  @override
  Future<Either<PureAirException, AirQuality>> getByGeo(Geo geo) async {
    try {
      final response = await _remote.getByGeo(lat: geo.lat, lon: geo.lon);
      final airQuality = response.data;
      if (airQuality == null) return const Left(PureAirQualityUnavailable());
      return Right(airQuality.toDomain);
    } on DioException catch (error) {
      final exception = _handleDioException(error);
      return Left(exception);
    } on TimeoutException {
      return const Left(PureAirTimeoutException());
    }
  }

  @override
  Future<List<City?>> getCities() async {
    try {
      final list = await _local.getCities();
      return list.map((l) => l?.toDomain).toList();
    } on Exception {
      return [];
    }
  }

  @override
  Future<Either<PureAirException, List<AirQuality?>>>
      getCitiesAirQualityData() async {
    final cities = await _local.getCities();
    log('CITIES FROM AIR_QUALITY_REPOSITORY ===> $cities');
    final futures = cities.map((city) async {
      final geo = city!.geo.v!;
      final response = await _remote.getByGeo(lat: geo.lat.v!, lon: geo.lon.v!);
      return response.data;
    }).toList();

    try {
      final response = await Future.wait<AirQualityDto?>(futures);
      final data = response.toLocalAirQualityData;
      return Right(data);
    } on DioException catch (error) {
      final exception = _handleDioException(error);
      return Left(exception);
    } on TimeoutException {
      return const Left(PureAirTimeoutException());
    }
  }

  @override
  Future<Either<PureAirException, AirQuality?>> getCity(String city) async {
    try {
      final response = await _remote.getCity(city);
      final airQuality = response.data;
      return Right(airQuality?.toDomain);
    } on DioException catch (error) {
      final exception = _handleDioException(error);
      return Left(exception);
    } on TimeoutException {
      return const Left(PureAirTimeoutException());
    }
  }

  @override
  Future<Either<PureAirException, AirQuality>> getLocalized() async {
    try {
      final response = await _remote.getLocalized().timeout(timeLimit);
      if (response.data == null) {
        return const Left(PureAirQualityUnavailable());
      }

      return Right(response.data!.toDomain);
    } on DioException catch (error) {
      final exception = _handleDioException(error);
      return Left(exception);
    } on TimeoutException {
      return const Left(PureAirTimeoutException());
    }
  }

  @override
  Either<PureAirException, Unit> removeCity(City city) {
    try {
      _local.removeCity(city.toDto);
      return const Right(unit);
    } on Exception catch (error) {
      final exception = PureAirException(error.toString());
      return Left(exception);
    }
  }

  @override
  Future<Either<PureAirException, List<SearchData?>>> search(
    SingleLineString keyword,
  ) async {
    try {
      final keywordString = keyword.getOrElse('');
      final response = await _remote.search(keywordString);
      return Right(response.data.map((s) => s?.toDomain).toList());
    } on DioException catch (error) {
      final exception = _handleDioException(error);
      return Left(exception);
    } on TimeoutException {
      return const Left(PureAirTimeoutException());
    }
  }

  @override
  Future<Either<PureAirException, List<Station>>> stationsOnMap(
    String latlng,
  ) async {
    try {
      final response = await _remote.stationsOnMap(latlng);
      return Right(response.data.map((s) => s.toDomain).toList());
    } on DioException catch (error) {
      final exception = _handleDioException(error);
      return Left(exception);
    } on TimeoutException {
      return const Left(PureAirTimeoutException());
    }
  }

  PureAirException _handleDioException(DioException error) {
    final message = error.message;
    if (message == null) return const PureAirUnknownException();
    return PureAirException(message);
  }
}

extension _AirQualityListX on List<AirQualityDto?> {
  List<AirQuality?> get toLocalAirQualityData {
    final list = map((airQualityDto) {
      final airQuality = airQualityDto?.toDomain;
      final uid = airQuality!.city.geo?.generateCityUid;
      final updatedCity = airQuality.city.copyWith(isLocal: false, uid: uid);
      final updatedAQ = airQuality.copyWith(city: updatedCity);
      return updatedAQ;
    }).toList();
    return list;
  }
}
