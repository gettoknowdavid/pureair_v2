import 'package:dartz/dartz.dart' hide State;
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
  final _cityMapper = CityMapper();
  final _stateMapper = StateMapper();
  final _countryMapper = CountryMapper();

  AirQualityFacade(this._remoteDatasource);

  @override
  Future<Either<AqiError, AirQuality>> getByCity({
    required String city,
    required String state,
    required String country,
  }) async {
    try {
      final result = await _remoteDatasource.getByCity(
        city: city,
        country: country,
        state: state,
      );
      final airQuality = _airQualityMapper.toDomain(result.data);
      return right(airQuality!);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, AirQuality>> getByIPAddress() async {
    try {
      final result = await _remoteDatasource.getByIPAddress();
      final airQuality = _airQualityMapper.toDomain(result.data);
      return right(airQuality!);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, AirQuality>> getByLatLon(
    String lat,
    String lon,
  ) async {
    try {
      final result = await _remoteDatasource.getByLatLon(lat: lat, lon: lon);
      final airQuality = _airQualityMapper.toDomain(result.data);
      return right(airQuality!);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, List<City?>?>> getSupportedCities({
    required String state,
    required String country,
  }) async {
    try {
      final result = await _remoteDatasource.getSupportedCities(
        state: state,
        country: country,
      );
      final cities = result.data?.map((e) => _cityMapper.toDomain(e)).toList();
      return right(cities);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, List<Country?>?>> getSupportedCountries() async {
    try {
      final result = await _remoteDatasource.getSupportedCountries();
      final countries = result.data?.map((e) {
        return _countryMapper.toDomain(e);
      }).toList();
      return right(countries);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }

  @override
  Future<Either<AqiError, List<State?>?>> getSupportedStates(
    String country,
  ) async {
    try {
      final result = await _remoteDatasource.getSupportedStates(country);
      final states = result.data?.map((e) {
        return _stateMapper.toDomain(e);
      }).toList();
      return right(states);
    } on DioError catch (e) {
      return left(AqiError.message(e.message));
    }
  }
}
