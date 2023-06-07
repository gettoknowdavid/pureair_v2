import 'package:pureair_v2/domain/entities/aqi/weather.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/weather_dto.dart';

class WeatherMapper {
  WeatherDto? fromDomain(Weather? entity) {
    if (entity == null) {
      return null;
    }

    return WeatherDto(
      hu: entity.hu,
      ic: entity.ic,
      pr: entity.pr,
      tp: entity.tp,
      ts: entity.ts,
      wd: entity.wd,
      ws: entity.ws,
    );
  }

  Weather? toDomain(WeatherDto? dto) {
    if (dto == null) {
      return null;
    }

    return Weather(
      hu: dto.hu,
      ic: dto.ic,
      pr: dto.pr,
      tp: dto.tp,
      ts: dto.ts,
      wd: dto.wd,
      ws: dto.ws,
    );
  }
}
