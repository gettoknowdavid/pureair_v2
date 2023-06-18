import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class PlaceMapper {
  PlaceDto? fromDomain(Place? entity) {
    if (entity == null) {
      return null;
    }

    return PlaceDto(
      city: entity.city,
      state: entity.state,
      country: entity.country,
      address: entity.address,
      lat: entity.lat,
      lon: entity.lon,
    );
  }

  Place? toDomain(PlaceDto? dto) {
    if (dto == null) {
      return null;
    }

    return Place(
      city: dto.city,
      state: dto.state,
      country: dto.country,
      address: dto.address,
      lat: dto.lat,
      lon: dto.lon,
    );
  }
}
