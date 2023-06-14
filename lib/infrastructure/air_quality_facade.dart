import 'package:dartz/dartz.dart' ;
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/datasources/datasources.dart';

import 'mappers/mappers.dart';

@LazySingleton(as: IAirQualityFacade)
class AirQualityFacade implements IAirQualityFacade {
  // final AirQualityLocalDatasource _localDatasource;
  final AirQualityRemoteDatasource _remoteDatasource;

  final _airQualityMapper = AirQualityMapper();

  AirQualityFacade(this._remoteDatasource);

  @override
  Future<Either<AqiError, AirQuality>> getCurrent(
    double lat,
    double lon,
  ) async {
    try {
      final result = await _remoteDatasource.getCurrent(lat, lon);
      final airQuality = _airQualityMapper.toDomain(result);
      return right(airQuality!);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, AirQuality>> getForecast(
    double lat,
    double lon,
  ) async {
    try {
      final result = await _remoteDatasource.getForecast(lat, lon);
      final airQuality = _airQualityMapper.toDomain(result);
      return right(airQuality!);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, AirQuality>> getHistorical({
    required double lat,
    required double lon,
    required int start,
    required int end,
  }) async {
    try {
      final result = await _remoteDatasource.getHistory(
        lat: lat,
        lon: lon,
        start: start,
        end: end,
      );
      final airQuality = _airQualityMapper.toDomain(result);
      return right(airQuality!);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }
}
