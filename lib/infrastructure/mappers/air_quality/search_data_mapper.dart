import 'package:pureair_v2/domain/domain.dart';

import '../../dtos/dtos.dart';
import 'city_mapper.dart';

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
      station: CityMapper().fromDomain(entity.station)!,
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
      station: CityMapper().toDomain(dto.station)!,
      uid: dto.uid,
    );
  }
}
