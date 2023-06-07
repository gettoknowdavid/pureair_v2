import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class CityMapper {
  CityDto? fromDomain(City? entity) {
    if (entity == null) {
      return null;
    }

    return CityDto(name: entity.name);
  }

  City? toDomain(CityDto? dto) {
    if (dto == null) {
      return null;
    }

    return City(name: dto.name);
  }
}
