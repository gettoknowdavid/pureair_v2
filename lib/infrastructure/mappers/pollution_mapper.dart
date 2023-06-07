import 'package:pureair_v2/domain/entities/aqi/pollution.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/pollution_dto.dart';

import 'p2_mapper.dart';

class PollutionMapper {
  PollutionDto? fromDomain(Pollution? entity) {
    if (entity == null) {
      return null;
    }

    return PollutionDto(
      aqicn: entity.aqicn,
      aqius: entity.aqius,
      maincn: entity.maincn,
      mainus: entity.mainus,
      p2: P2Mapper().fromDomain(entity.p2),
      ts: entity.ts,
    );
  }

  Pollution? toDomain(PollutionDto? dto) {
    if (dto == null) {
      return null;
    }

    return Pollution(
      aqicn: dto.aqicn,
      aqius: dto.aqius,
      maincn: dto.maincn,
      mainus: dto.mainus,
      p2: P2Mapper().toDomain(dto.p2),
      ts: dto.ts,
    );
  }
}
