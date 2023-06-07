import 'package:pureair_v2/domain/entities/aqi/location.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/location_dto.dart';

class LocationMapper {
  LocationDto? fromDomain(Location? entity) {
    if (entity == null) {
      return null;
    }

    return LocationDto(coordinates: entity.coordinates);
  }

  Location? toDomain(LocationDto? dto) {
    if (dto == null) {
      return null;
    }

    return Location(coordinates: dto.coordinates);
  }
}
