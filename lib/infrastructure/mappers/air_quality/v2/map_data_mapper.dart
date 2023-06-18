import 'package:pureair_v2/domain/entities/air_quality/v2/index.dart';
import 'package:pureair_v2/infrastructure/dtos/air_quality/v2/index.dart';

class MapDataMapper {
  MapDataDto? fromDomain(MapData? entity) {
    if (entity == null) {
      return null;
    }

    return MapDataDto(
      aqi: entity.aqi,
      lat: entity.lat,
      lon: entity.lon,
      station: StationDto(
        name: entity.station.name,
        time: entity.station.time,
      ),
      uid: entity.uid,
    );
  }

  MapData? toDomain(MapDataDto? dto) {
    if (dto == null) {
      return null;
    }

    return MapData(
      aqi: dto.aqi,
      lat: dto.lat,
      lon: dto.lon,
      station: Station(
        name: dto.station.name,
        time: dto.station.time,
      ),
      uid: dto.uid,
    );
  }
}