import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';

@LazySingleton(as: IAirQualityFacade)
class AirQualityFacade implements IAirQualityFacade {
  // final AirQualityLocalDatasource _localDatasource;
  final AQRemoteDatasource _remote;

  final _airQualityMapper = AirQualityMapper();
  final _mapDataMapper = MapDataMapper();
  final _searchDataMapper = SearchDataMapper();

  AirQualityFacade(this._remote);

  @override
  Future<Either<AQError, AirQuality?>> getByGeo(double lat, double lon) async {
    try {
      final result = await _remote.getByGeo(lat, lon);
      final dto = result.data;
      final airQuality = _airQualityMapper.toDomain(dto);
      return right(airQuality);
    } on DioError catch (e) {
      return left(AQError.message(e.message));
    }
  }

  @override
  Future<Either<AQError, AirQuality?>> getCity(String city) async {
    try {
      final result = await _remote.getCity(city);
      final dto = result.data;
      final airQuality = _airQualityMapper.toDomain(dto);
      return right(airQuality);
    } on DioError catch (e) {
      return left(AQError.message(e.message));
    }
  }

  @override
  Future<Either<AQError, AirQuality?>> getLocal() async {
    try {
      final result = await _remote.getLocalized().timeout(timeLimit);
      final dto = result.data;
      final airQuality = _airQualityMapper.toDomain(dto);
      return right(airQuality);
    } on DioError catch (e) {
      Logger().wtf(e);
      Logger().wtf(e.response);
      Logger().wtf(e.response?.data);
      return left(AQError.message(e.message));
    } on TimeoutException {
      return left(const AQError.message(kTimeout));
    }
  }

  @override
  Future<Either<AQError, List<SearchData?>>> search(String keyword) async {
    try {
      final result = await _remote.search(keyword);
      final dto = result.data;
      final list = dto?.map((e) => _searchDataMapper.toDomain(e)).toList();
      return right(list ?? []);
    } on DioError catch (e) {
      return left(AQError.message(e.message));
    }
  }

  @override
  Future<Either<AQError, List<MapData?>>> stationsOnMap(String latlng) async {
    try {
      final result = await _remote.stationsOnMap(latlng);
      final dto = result.data;
      final list = dto?.map((e) => _mapDataMapper.toDomain(e)).toList();
      return right(list ?? []);
    } on DioError catch (e) {
      return left(AQError.message(e.message));
    }
  }
}
