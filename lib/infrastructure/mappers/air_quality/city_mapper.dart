import 'package:pureair_v2/domain/domain.dart';

import '../../dtos/dtos.dart';

class CityMapper {
  CityDto? fromDomain(City? entity) {
    if (entity == null) {
      return null;
    }

    return CityDto(
      id: entity.id,
      uid: entity.uid,
      isLocal: entity.isLocal,
      geo: entity.geo?.map((e) => e).toList(),
      name: entity.name,
      location: entity.location,
      url: entity.url,
      addedTime: entity.addedTime,
      time: entity.time,
      aqi: entity.aqi,
      flagUrl: entity.flagUrl,
      localeName: entity.localeName,
    );
  }

  City? toDomain(CityDto? dto) {
    if (dto == null) {
      return null;
    }

    return City(
      id: dto.id,
      uid: dto.uid,
      isLocal: dto.isLocal,
      geo: dto.geo?.map((e) => e).toList(),
      name: dto.name,
      location: dto.location,
      url: dto.url,
      addedTime: dto.addedTime,
      time: dto.time,
      aqi: dto.aqi,
      flagUrl: dto.flagUrl,
      localeName: dto.localeName,
    );
  }
}
