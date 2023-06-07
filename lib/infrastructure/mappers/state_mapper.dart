import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

class StateMapper {
  StateDto? fromDomain(State? entity) {
    if (entity == null) {
      return null;
    }

    return StateDto(name: entity.name);
  }

  State? toDomain(StateDto? dto) {
    if (dto == null) {
      return null;
    }

    return State(name: dto.name);
  }
}
