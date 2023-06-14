import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class PollutantsMapper {
  PollutantsDto? fromDomain(Pollutants? entity) {
    if (entity == null) {
      return null;
    }

    return PollutantsDto(components: entity.components);
  }

  Pollutants? toDomain(PollutantsDto? dto) {
    if (dto == null) {
      return null;
    }

    return Pollutants(components: dto.components);
  }
}
