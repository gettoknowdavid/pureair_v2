import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/infrastructure/dtos/dtos.dart';

import 'main_mapper.dart';
import 'pollutants_mapper.dart';

class AirQualityDataMapper {
  AirQualityDataDto? fromDomain(AirQualityData? entity) {
    if (entity == null) {
      return null;
    }

    return AirQualityDataDto(
      main: MainMapper().fromDomain(entity.main),
      pollutants: PollutantsMapper().fromDomain(entity.pollutants),
      dateTime: entity.dateTime?.millisecondsSinceEpoch,
    );
  }

  AirQualityData? toDomain(AirQualityDataDto? dto) {
    if (dto == null) {
      return null;
    }

    return AirQualityData(
      main: MainMapper().toDomain(dto.main),
      pollutants: PollutantsMapper().toDomain(dto.pollutants),
      dateTime: dto.dateTime == null
          ? DateTime.now()
          : DateTime.fromMillisecondsSinceEpoch(dto.dateTime!),
    );
  }
}
