import 'package:pureair_v2/domain/entities/aqi/forecast.dart';
import 'package:pureair_v2/infrastructure/dtos/aqi/forecast_dto.dart';

class ForecastMapper {
  ForecastDto? fromDomain(Forecast? entity) {
    if (entity == null) {
      return null;
    }

    return ForecastDto(
      aqicn: entity.aqicn,
      aqius: entity.aqius,
      hu: entity.hu,
      ic: entity.ic,
      pr: entity.pr,
      tp: entity.tp,
      tpMin: entity.tpMin,
      ts: entity.ts,
      wd: entity.wd,
      ws: entity.ws,
    );
  }

  Forecast? toDomain(ForecastDto? dto) {
    if (dto == null) {
      return null;
    }

    return Forecast(
      aqicn: dto.aqicn,
      aqius: dto.aqius,
      hu: dto.hu,
      ic: dto.ic,
      pr: dto.pr,
      tp: dto.tp,
      tpMin: dto.tpMin,
      ts: dto.ts,
      wd: dto.wd,
      ws: dto.ws,
    );
  }
}
