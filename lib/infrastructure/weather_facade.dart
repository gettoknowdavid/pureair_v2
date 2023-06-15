import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pureair_v2/domain/errors/weather_error.dart';

import '../domain/domain.dart';
import 'datasources/datasources.dart';
import 'mappers/mappers.dart';

@Injectable(as: IWeatherFacade)
class WeatherFacade implements IWeatherFacade {
  final WeatherRemoteDatasource _remoteDatasource;

  final _mapper = WeatherMapper();

  WeatherFacade(this._remoteDatasource);

  @override
  Future<Either<WeatherError, Weather>> getCurrent({
    required double lat,
    required double lon,
    String? units,
  }) async {
    try {
      final result = await _remoteDatasource.getWeather(
        lat: lat,
        lon: lon,
        exclude: "hourly,daily",
      );
      final weather = _mapper.toDomain(result);
      return right(weather!);
    } on DioError catch (e) {
      return left(WeatherError.message(e.message));
    }
  }

  @override
  Future<Either<WeatherError, Weather>> getForecast({
    required double lat,
    required double lon,
    String? units,
  }) async {
    try {
      final result = await _remoteDatasource.getWeather(
        lat: lat,
        lon: lon,
        exclude: "current",
      );
      final weather = _mapper.toDomain(result);
      return right(weather!);
    } on DioError catch (e) {
      return left(WeatherError.message(e.message));
    }
  }
}
