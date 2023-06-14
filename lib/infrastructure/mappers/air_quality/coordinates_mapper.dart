import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class CoordinatesMapper {
  CoordinatesDto? fromDomain(Coordinates? entity) {
    if (entity == null) {
      return null;
    }

    return CoordinatesDto(
      lat: entity.lat,
      lon: entity.lon,
    );
  }

  Coordinates? toDomain(CoordinatesDto? dto) {
    if (dto == null) {
      return null;
    }

    return Coordinates(
      lat: dto.lat,
      lon: dto.lon,
    );
  }
}
