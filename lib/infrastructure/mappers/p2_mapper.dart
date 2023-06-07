import 'package:pureair_v2/domain/entities/aqi/p2.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/p2_dto.dart';

class P2Mapper {
  P2Dto? fromDomain(P2? entity) {
    if (entity == null) {
      return null;
    }

    return P2Dto(
      aqicn: entity.aqicn,
      aqius: entity.aqius,
      conc: entity.conc,
    );
  }

  P2? toDomain(P2Dto? dto) {
    if (dto == null) {
      return null;
    }

    return P2(
      aqicn: dto.aqicn,
      aqius: dto.aqius,
      conc: dto.conc,
    );
  }
}
