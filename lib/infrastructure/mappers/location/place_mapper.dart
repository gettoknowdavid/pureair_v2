import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/infrastructure.dart';

class PlaceMapper {
  PlaceDto? fromDomain(Place? entity) {
    if (entity == null) {
      return null;
    }

    return PlaceDto(
      name: entity.name,
      placeId: entity.placeId,
      types: entity.types,
      countryISO: entity.countryISO,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      lat: entity.lat,
      lon: entity.lon,
    );
  }

  Place? toDomain(PlaceDto? dto) {
    if (dto == null) {
      return null;
    }

    return Place(
      name: dto.name,
      placeId: dto.placeId,
      types: dto.types,
      countryISO: dto.countryISO,
      city: dto.city,
      state: dto.state,
      country: dto.country,
      lat: dto.lat,
      lon: dto.lon,
    );
  }
}
