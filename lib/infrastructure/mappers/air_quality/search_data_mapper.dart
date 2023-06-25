import 'package:pureair_v2/domain/domain.dart';

import '../../dtos/dtos.dart';

class SearchDataMapper {
  SearchDataDto? fromDomain(SearchData? entity) {
    if (entity == null) {
      return null;
    }

    return SearchDataDto(
      aqi: entity.aqi,
      time: TimeDto(
        tz: entity.time.tz,
        sTime: entity.time.sTime,
        vTime: entity.time.vTime,
      ),
      station: CityDto(
        country: entity.station.country,
        geo: entity.station.geo,
        name: entity.station.name,
        url: entity.station.url,
      ),
      uid: entity.uid,
    );
  }

  SearchData? toDomain(SearchDataDto? dto) {
    if (dto == null) {
      return null;
    }

    return SearchData(
      aqi: dto.aqi,
      time: Time(
        tz: dto.time.tz,
        sTime: dto.time.sTime,
        vTime: dto.time.vTime,
      ),
      station: City(
        country: dto.station.country,
        geo: dto.station.geo,
        name: dto.station.name,
        time: dto.station.time,
        url: dto.station.url,
      ),
      uid: dto.uid,
    );
  }
}
