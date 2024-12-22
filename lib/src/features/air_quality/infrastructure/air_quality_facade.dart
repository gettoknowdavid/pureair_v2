import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/domain/domain.dart';
import 'package:pureair_v2/src/features/air_quality/infrastructure/datasources/datasources.dart';

const timeLimit = Duration(seconds: 30);

class AQIFacade implements IAirQualityFacade {
  const AQIFacade({
    required AirQualityRemoteDatasource remote,
    required AirQualityLocalDatasource local,
  })  : _remote = remote,
        _local = local;

  final AirQualityRemoteDatasource _remote;
  final AirQualityLocalDatasource _local;

  @override
  void addCity(City city) => _local.addCity(city);

  @override
  void clearSavedCities() {
    // TODO: implement clearSavedCities
  }

  @override
  Future<Either<AirQualityException, AirQuality?>> getByGeo(
    List<double> geo,
  ) async {
    try {
      final result = await _remote.getByGeo(lat: geo[0], lon: geo[1]);
      return right(result.data);
    } on DioException catch (e) {
      final message = e.message;
      if (message == null) return left(const AQUnknownException());
      return left(AQMessageException(message));
    } on TimeoutException catch (e) {
      return left(AQMessageException(e.message ?? 'Operation timed out'));
    }
  }

  @override
  List<City?> getCities() => _local.getCities();

  @override
  Future<Either<AirQualityException, List<AirQuality?>>>
      getCitiesAirQualityData() async {
    final cities = _local.getCities();
    final futures = cities.map((city) async {
      final geo = city!.geo!;
      final result = await _remote.getByGeo(lat: geo[0], lon: geo[1]);
      return result.data;
    }).toList();

    try {
      final result = await Future.wait<AirQuality?>(futures);
      final data = result.toLocalAirQualityData;
      return right(data);
    } on DioException catch (e) {
      final message = e.message;
      if (message == null) return left(const AQUnknownException());
      return left(AQMessageException(message));
    } on TimeoutException catch (e) {
      return left(AQMessageException(e.message ?? 'Operation timed out'));
    }
  }

  @override
  Future<Either<AirQualityException, AirQuality?>> getCity(String city) async {
    try {
      final result = await _remote.getCity(city);
      final airQuality = result.data;
      return right(airQuality);
    } on DioException catch (e) {
      final message = e.message;
      if (message == null) return left(const AQUnknownException());
      return left(AQMessageException(message));
    } on TimeoutException catch (e) {
      return left(AQMessageException(e.message ?? 'Operation timed out'));
    }
  }

  @override
  Future<Either<AirQualityException, AirQuality>> getLocalized() async {
    try {
      final result = await _remote.getLocalized().timeout(timeLimit);
      if (result.data == null) return left(const AQUnavailable());
      return right(result.data!);
    } on DioException catch (e) {
      final message = e.message;
      if (message == null) return left(const AQUnknownException());
      return left(AQMessageException(message));
    } on TimeoutException catch (e) {
      return left(AQMessageException(e.message ?? 'Operation timed out'));
    }
  }

  @override
  void removeCity(City city) => _local.removeCity(city);

  @override
  Future<Either<AirQualityException, List<SearchData?>>> search(
    SingleLineString keyword,
  ) async {
    try {
      final keywordString = keyword.getOrElse('');
      final result = await _remote.search(keywordString);
      return right(result.data);
    } on DioException catch (e) {
      final message = e.message;
      if (message == null) return left(const AQUnknownException());
      return left(AQMessageException(message));
    } on TimeoutException catch (e) {
      return left(AQMessageException(e.message ?? 'Operation timed out'));
    }
  }

  @override
  Future<Either<AirQualityException, List<Station>>> stationsOnMap(
    String latlng,
  ) async {
    try {
      final result = await _remote.stationsOnMap(latlng);
      return right(result.data);
    } on DioException catch (e) {
      final message = e.message;
      if (message == null) return left(const AQUnknownException());
      return left(AQMessageException(message));
    } on TimeoutException catch (e) {
      return left(AQMessageException(e.message ?? 'Operation timed out'));
    }
  }
}

extension _AirQualityListX on List<AirQuality?> {
  List<AirQuality?> get toLocalAirQualityData {
    final list = map((a) {
      final uid = a!.city.geo!.generateCityUid;
      final updatedCity = a.city.copyWith(isLocal: false, uid: uid);
      final updatedAQ = a.copyWith(city: updatedCity);
      return updatedAQ;
    }).toList();
    return list;
  }
}
