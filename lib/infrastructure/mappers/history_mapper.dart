import 'package:pureair_v2/domain/entities/aqi/history.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/history_dto.dart';

import 'pollution_mapper.dart';
import 'weather_mapper.dart';

class HistoryMapper {
  HistoryDto? fromDomain(History? entity) {
    if (entity == null) {
      return null;
    }

    return HistoryDto(
      pollution: entity.pollution?.map((e) {
        return PollutionMapper().fromDomain(e)!;
      }).toList(),
      weather: entity.weather?.map((e) {
        return WeatherMapper().fromDomain(e)!;
      }).toList(),
    );
  }

  History? toDomain(HistoryDto? dto) {
    if (dto == null) {
      return null;
    }

    return History(
      pollution: dto.pollution?.map((e) {
        return PollutionMapper().toDomain(e)!;
      }).toList(),
      weather: dto.weather?.map((e) {
        return WeatherMapper().toDomain(e)!;
      }).toList(),
    );
  }
}
