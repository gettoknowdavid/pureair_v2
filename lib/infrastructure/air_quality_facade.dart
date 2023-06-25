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
  final AQLocalDatasource _local;
  final AQRemoteDatasource _remote;

  final _airQualityMapper = AirQualityMapper();
  final _cityMapper = CityMapper();
  final _mapDataMapper = MapDataMapper();
  final _searchDataMapper = SearchDataMapper();

  AirQualityFacade(this._local, this._remote);

  @override
  Future<void> addCity(City city) async {
    final cities = await _local.loadCities();

    // Check if the object already exists in the list
    bool isDuplicate = cities.any((object) =>
        object?.geo[0] == city.geo[0] && object?.geo[1] == city.geo[1]);

    // If the object is not a duplicate, add it to the list
    if (!isDuplicate) {
      cities.add(_cityMapper.fromDomain(city));

      // Save the updated list back to SharedPreferences
      await _local.saveCities(cities);
    }
  }

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
  Future<Either<AQError, List<AirQuality?>>> getAllCityData() async {
    final cities = await _local.loadCities();

    final List<Future<AirQuality?>> futures = cities.map((e) async {
      final result = await _remote.getByGeo(e!.geo[0], e.geo[1]);
      final dto = result.data;
      return _airQualityMapper.toDomain(dto);
    }).toList();

    try {
      final List<AirQuality?> list = await Future.wait<AirQuality?>(futures);
      return right(list);
    } catch (e) {
      return left(const AQError.message("Oops. Let's try again."));
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

      await addCity(airQuality!.city);

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
  Future<void> removeCity(City city) async {
    final cities = await _local.loadCities();
    cities.removeWhere((element) => element?.geo == city.geo);
    await _local.saveCities(cities);
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

  @override
  Future<List<City?>> getCities() async {
    final list = await _local.loadCities();
    return list.map((e) => _cityMapper.toDomain(e)).toList();
  }

  @override
  Future<void> clearSavedCities() => _local.clearSavedCities();
}
