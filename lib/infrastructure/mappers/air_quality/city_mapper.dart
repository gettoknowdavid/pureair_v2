import 'package:pureair_v2/domain/domain.dart';

import '../../dtos/dtos.dart';

class CityMapper {
  CityDto? fromDomain(City? entity) {
    if (entity == null) {
      return null;
    }

    return CityDto(
      geo: entity.geo.map((e) => e).toList(),
      name: entity.name,
      location: entity.location,
      url: entity.url,
    );
  }

  City? toDomain(CityDto? dto) {
    if (dto == null) {
      return null;
    }

    return City(
      geo: dto.geo.map((e) => e).toList(),
      name: dto.name,
      location: dto.location,
      url: dto.url,
    );
  }
}
