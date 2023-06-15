import 'package:pureair_v2/domain/domain.dart';

import '../../dtos/dtos.dart';

class WeatherMapper {
  WeatherDto? fromDomain(Weather? entity) {
    if (entity == null) {
      return null;
    }

    return WeatherDto(
      lat: entity.lat,
      lon: entity.lon,
      timezone: entity.timezone,
      timezoneOffset: entity.timezoneOffset,
      current: WeatherDataDto(
        dateTime: entity.current?.dateTime,
        sunrise: entity.current?.sunrise,
        sunset: entity.current?.sunset,
        temp: entity.current?.temp,
        feelsLike: entity.current?.feelsLike,
        pressure: entity.current?.pressure,
        humidity: entity.current?.humidity,
        dewPoint: entity.current?.dewPoint,
        uvi: entity.current?.uvi,
        clouds: entity.current?.clouds,
        visibility: entity.current?.visibility,
        windSpeed: entity.current?.windSpeed,
        windDeg: entity.current?.windDeg,
        windGust: entity.current?.windGust,
        pop: entity.current?.pop,
        rain: RainDto(the1H: entity.current?.rain?.the1H),
        weatherInfo: entity.current?.weatherInfo?.map(
          (e) {
            return WeatherInfoDto(
              id: e.id,
              main: e.main,
              description: e.description,
              icon: e.icon,
            );
          },
        ).toList(),
      ),
      daily: entity.daily?.map((e) {
        return WeatherForecastDto(
          dateTime: e?.dateTime,
          sunrise: e?.sunrise,
          sunset: e?.sunset,
          temp: TempDto(
            day: e?.temp?.day,
            eve: e?.temp?.eve,
            max: e?.temp?.max,
            min: e?.temp?.min,
            morn: e?.temp?.morn,
            night: e?.temp?.night,
          ),
          feelsLike: FeelsLikeDto(
            day: e?.temp?.day,
            eve: e?.temp?.eve,
            morn: e?.temp?.morn,
            night: e?.temp?.night,
          ),
          pressure: e?.pressure,
          humidity: e?.humidity,
          dewPoint: e?.dewPoint,
          uvi: e?.uvi,
          clouds: e?.clouds,
          windSpeed: e?.windSpeed,
          windDeg: e?.windDeg,
          windGust: e?.windGust,
          pop: e?.pop,
          rain: e?.rain,
          moonPhase: e?.moonPhase,
          moonrise: e?.moonrise,
          moonset: e?.moonset,
          summary: e?.summary,
          weatherInfo: entity.current?.weatherInfo?.map(
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
      }).toList(),
    );
  }

  Weather? toDomain(WeatherDto? dto) {
    if (dto == null) {
      return null;
    }

    return Weather(
      lat: dto.lat,
      lon: dto.lon,
      timezone: dto.timezone,
      timezoneOffset: dto.timezoneOffset,
      current: WeatherData(
        dateTime: dto.current?.dateTime,
        sunrise: dto.current?.sunrise,
        sunset: dto.current?.sunset,
        temp: dto.current?.temp,
        feelsLike: dto.current?.feelsLike,
        pressure: dto.current?.pressure,
        humidity: dto.current?.humidity,
        dewPoint: dto.current?.dewPoint,
        uvi: dto.current?.uvi,
        clouds: dto.current?.clouds,
        visibility: dto.current?.visibility,
        windSpeed: dto.current?.windSpeed,
        windDeg: dto.current?.windDeg,
        windGust: dto.current?.windGust,
        pop: dto.current?.pop,
        rain: Rain(the1H: dto.current?.rain?.the1H),
        weatherInfo: dto.current?.weatherInfo?.map(
          (e) {
            return WeatherInfo(
              id: e.id,
              main: e.main,
              description: e.description,
              icon: e.icon,
            );
          },
        ).toList(),
      ),
      daily: dto.daily?.map((e) {
        return WeatherForecast(
          dateTime: e?.dateTime,
          sunrise: e?.sunrise,
          sunset: e?.sunset,
          temp: Temp(
            day: e?.temp?.day,
            eve: e?.temp?.eve,
            max: e?.temp?.max,
            min: e?.temp?.min,
            morn: e?.temp?.morn,
            night: e?.temp?.night,
          ),
          feelsLike: FeelsLike(
            day: e?.temp?.day,
            eve: e?.temp?.eve,
            morn: e?.temp?.morn,
            night: e?.temp?.night,
          ),
          pressure: e?.pressure,
          humidity: e?.humidity,
          dewPoint: e?.dewPoint,
          uvi: e?.uvi,
          clouds: e?.clouds,
          windSpeed: e?.windSpeed,
          windDeg: e?.windDeg,
          windGust: e?.windGust,
          pop: e?.pop,
          rain: e?.rain,
          moonPhase: e?.moonPhase,
          moonrise: e?.moonrise,
          moonset: e?.moonset,
          summary: e?.summary,
          weatherInfo: dto.current?.weatherInfo?.map(
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
      }).toList(),
    );
  }
}
