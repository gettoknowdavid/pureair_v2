import 'package:pureair_v2/domain/domain.dart';

import '../../dtos/dtos.dart';

class WeatherDataMapper {
  WeatherDataDto? fromDomain(WeatherData? entity) {
    if (entity == null) {
      return null;
    }

    return WeatherDataDto(
      dateTime: entity.dateTime,
      sunrise: entity.sunrise,
      sunset: entity.sunset,
      temp: entity.temp,
      feelsLike: entity.feelsLike,
      pressure: entity.pressure,
      humidity: entity.humidity,
      dewPoint: entity.dewPoint,
      uvi: entity.uvi,
      clouds: entity.clouds,
      visibility: entity.visibility,
      windSpeed: entity.windSpeed,
      windDeg: entity.windDeg,
      windGust: entity.windGust,
      pop: entity.pop,
      rain: RainDto(the1H: entity.rain?.the1H),
      snow: SnowDto(the1H: entity.snow?.the1H),
      weatherInfo: entity.weatherInfo?.map(
        (e) {
          return WeatherInfoDto(
            id: e.id,
            main: e.main,
            description: e.description,
            icon: e.icon,
          );
        },
      ).toList(),
    );
  }

  WeatherData? toDomain(WeatherDataDto? dto) {
    if (dto == null) {
      return null;
    }

    return WeatherData(
      dateTime: dto.dateTime,
      sunrise: dto.sunrise,
      sunset: dto.sunset,
      temp: dto.temp,
      feelsLike: dto.feelsLike,
      pressure: dto.pressure,
      humidity: dto.humidity,
      dewPoint: dto.dewPoint,
      uvi: dto.uvi,
      clouds: dto.clouds,
      visibility: dto.visibility,
      windSpeed: dto.windSpeed,
      windDeg: dto.windDeg,
      windGust: dto.windGust,
      pop: dto.pop,
      rain: Rain(the1H: dto.rain?.the1H),
      snow: Snow(the1H: dto.snow?.the1H),
      weatherInfo: dto.weatherInfo?.map(
        (e) {
          return WeatherInfo(
            id: e.id,
            main: e.main,
            description: e.description,
            icon: e.icon,
          );
        },
      ).toList(),
    );
  }
}
