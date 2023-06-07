import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class CountryMapper {
  CountryDto? fromDomain(Country? entity) {
    if (entity == null) {
      return null;
    }

    return CountryDto(name: entity.name);
  }

  Country? toDomain(CountryDto? dto) {
    if (dto == null) {
      return null;
    }

    return Country(name: dto.name);
  }
}
