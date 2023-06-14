import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class MainMapper {
  MainDto? fromDomain(Main? entity) {
    if (entity == null) {
      return null;
    }

    return MainDto(aqi: entity.aqi);
  }

  Main? toDomain(MainDto? dto) {
    if (dto == null) {
      return null;
    }

    return Main(aqi: dto.aqi);
  }
}
