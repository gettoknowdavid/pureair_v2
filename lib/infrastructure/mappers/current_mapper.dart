import 'package:pureair_v2/domain/entities/aqi/current.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/current_dto.dart';

import 'pollution_mapper.dart';
import 'weather_mapper.dart';

class CurrentMapper {
  CurrentDto? fromDomain(Current? entity) {
    if (entity == null) {
      return null;
    }

    return CurrentDto(
      pollution: PollutionMapper().fromDomain(entity.pollution),
      weather: WeatherMapper().fromDomain(entity.weather),
    );
  }

  Current? toDomain(CurrentDto? dto) {
    if (dto == null) {
      return null;
    }

    return Current(
      pollution: PollutionMapper().toDomain(dto.pollution),
      weather: WeatherMapper().toDomain(dto.weather),
    );
  }
}
