import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/constants.dart';
import '../domain/entities/entities.dart';
import '../domain/errors/aq_failure.dart';
import '../domain/i_air_quality_facade.dart';
import 'datasources/datasources.dart';
import 'mappers/mappers.dart';

@LazySingleton(as: IAirQualityFacade)
class AirQualityFacade implements IAirQualityFacade {
  final AQLocalDatasource _local;
  final AQRemoteDatasource _remote;

  final _airQualityMapper = AirQualityMapper();
  final _cityMapper = CityMapper();
  final _mapDataMapper = MapDataMapper();
  final _searchDataMapper = SearchDataMapper();

  AirQualityFacade(this._local, this._remote);

  @override
  Future<void> addCity(City city) async {
    final cities = _local.getCities();

    // Check if the object already exists in the list
    bool isDuplicate = cities.any((object) => object?.uid == city.uid);

    // If the object is not a duplicate, add it to the list
    if (!isDuplicate) {
      _local.addCity(_cityMapper.fromDomain(city)!);
    }
  }

  @override
  void clearSavedCities() => _local.clearSavedCities();

  @override
  Future<Either<AQFailure, List<AirQuality?>>> getAllCityData() async {
    final cities = _local.getCities();

    final List<Future<AirQuality?>> futures = cities.map((e) async {
      final result = await _remote.getByGeo(e!.geo![0], e.geo![1]);
      final dto = result.data?.copyWith(city: e);
      return _airQualityMapper.toDomain(dto);
    }).toList();

    try {
      final List<AirQuality?> list = await Future.wait<AirQuality?>(futures);
      return right(list);
    } catch (e) {
      return left(const AQFailure.message("Oops. Let's try again."));
    }
  }

  @override
  Future<Either<AQFailure, AirQuality?>> getByGeo(
      double lat, double lon) async {
    try {
      final result = await _remote.getByGeo(lat, lon);
      final dto = result.data;
      final airQuality = _airQualityMapper.toDomain(dto);
      return right(airQuality);
    } on DioError catch (e) {
      return left(AQFailure.message(e.message));
    }
  }

  @override
  Future<List<City?>> getCities() async {
    return _local.getCities().map((e) => _cityMapper.toDomain(e)).toList();
  }

  @override
  Future<Either<AQFailure, AirQuality?>> getCity(String city) async {
    try {
      final result = await _remote.getCity(city);
      final dto = result.data;
      final airQuality = _airQualityMapper.toDomain(dto);
      return right(airQuality);
    } on DioError catch (e) {
      return left(AQFailure.message(e.message));
    }
  }

  @override
  Future<Either<AQFailure, AirQuality?>> getLocal() async {
    try {
      final result = await _remote.getLocalized().timeout(timeLimit);
      final dto = result.data;
      final airQuality = _airQualityMapper.toDomain(dto);

      // final uid = generateUUIDFromGeo(airQuality!.city.geo);
      // final updatedCity = airQuality.city.copyWith(uid: uid, isLocal: true);
      // _local.addLocal(_cityMapper.fromDomain(updatedCity)!);

      return right(airQuality);
    } on DioError catch (e) {
      return left(AQFailure.message(e.message));
    } on TimeoutException {
      return left(const AQFailure.message(kTimeout));
    }
  }

  @override
  Future<void> removeCity(City city) async {
    return _local.removeCity(_cityMapper.fromDomain(city)!);
  }

  @override
  Future<Either<AQFailure, List<SearchData?>>> search(String keyword) async {
    try {
      final result = await _remote.search(keyword);
      final dto = result.data;
      final list = dto?.map((e) => _searchDataMapper.toDomain(e)).toList();
      return right(list ?? []);
    } on DioError catch (e) {
      return left(AQFailure.message(e.message));
    }
  }

  @override
  Future<Either<AQFailure, List<MapData?>>> stationsOnMap(String latlng) async {
    try {
      final result = await _remote.stationsOnMap(latlng);
      final dto = result.data;
      final list = dto?.map((e) => _mapDataMapper.toDomain(e)).toList();
      return right(list ?? []);
    } on DioError catch (e) {
      return left(AQFailure.message(e.message));
    }
  }
}
