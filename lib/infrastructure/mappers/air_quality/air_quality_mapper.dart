import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

import 'air_quality_data_mapper.dart';
import 'coordinates_mapper.dart';

class AirQualityMapper {
  AirQualityDto? fromDomain(AirQuality? entity) {
    if (entity == null) {
      return null;
    }

    return AirQualityDto(
      coordinates: CoordinatesMapper().fromDomain(entity.coordinates)!,
      data: entity.data
          .map((e) => AirQualityDataMapper().fromDomain(e)!)
          .toList(),
    );
  }

  AirQuality? toDomain(AirQualityDto? dto) {
    if (dto == null) {
      return null;
    }

    return AirQuality(
      coordinates: CoordinatesMapper().toDomain(dto.coordinates)!,
      data: dto.data.map((e) => AirQualityDataMapper().toDomain(e)!).toList(),
    );
  }
}
