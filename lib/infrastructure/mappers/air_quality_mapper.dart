import 'package:pureair_v2/domain/domain.dart';

import '../dtos/dtos.dart';
import 'current_mapper.dart';
import 'forecast_mapper.dart';
import 'history_mapper.dart';
import 'location_mapper.dart';

class AirQualityMapper {
  AirQualityDto? fromDomain(AirQuality? entity) {
    if (entity == null) {
      return null;
    }

    return AirQualityDto(
      city: entity.city,
      country: entity.city,
      state: entity.state,
      location: LocationMapper().fromDomain(entity.location),
      history: HistoryMapper().fromDomain(entity.history),
      current: CurrentMapper().fromDomain(entity.current),
      forecasts: entity.forecasts?.map((e) {
        return ForecastMapper().fromDomain(e)!;
      }).toList(),
    );
  }

  AirQuality? toDomain(AirQualityDto? dto) {
    if (dto == null) {
      return null;
    }

    return AirQuality(
      city: dto.city,
      country: dto.city,
      state: dto.state,
      location: LocationMapper().toDomain(dto.location),
      history: HistoryMapper().toDomain(dto.history),
      current: CurrentMapper().toDomain(dto.current),
      forecasts: dto.forecasts?.map((e) {
        return ForecastMapper().toDomain(e)!;
      }).toList(),
    );
  }
}
