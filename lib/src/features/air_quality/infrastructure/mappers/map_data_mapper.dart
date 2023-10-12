import '../../domain/entities/entities.dart';
import '../dtos/dtos.dart';
import 'city_mapper.dart';

class MapDataMapper {
  MapDataDto? fromDomain(MapData? entity) {
    if (entity == null) {
      return null;
    }

    return MapDataDto(
      aqi: entity.aqi,
      lat: entity.lat,
      lon: entity.lon,
      station: CityMapper().fromDomain(entity.station)!,
      uid: entity.uid,
      markerIcon: entity.markerIcon,
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
      station: CityMapper().toDomain(dto.station)!,
      uid: dto.uid,
      markerIcon: dto.markerIcon,
    );
  }
}
