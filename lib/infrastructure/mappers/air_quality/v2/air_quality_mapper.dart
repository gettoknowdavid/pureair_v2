import 'package:pureair_v2/domain/entities/air_quality/v2/index.dart';
import 'package:pureair_v2/infrastructure/dtos/air_quality/v2/index.dart';

class AirQualityMapper {
  AirQualityDto? fromDomain(AirQuality? entity) {
    if (entity == null) {
      return null;
    }

    final attributions = entity.attributions;
    final city = entity.city;
    final debug = entity.debug;
    final daily = entity.forecast.daily;
    final measurements = entity.measurements;
    final time = entity.time;

    return AirQualityDto(
      aqi: entity.aqi,
      domPol: entity.domPol,
      idx: entity.idx,
      attributions: attributions
          .map((e) => AttributionDto(logo: e.logo, name: e.name, url: e.url))
          .toList(),
      city: CityDto(
        geo: city.geo.map((e) => e).toList(),
        name: city.name,
        location: city.location,
        url: city.url,
      ),
      debug: DebugDto(sync: debug.sync),
      forecast: ForecastDto(
        daily: DailyDto(
          co: daily.co
              ?.map((e) => ForecastDataDto(
                  avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          no2: daily.co
              ?.map((e) => ForecastDataDto(
                  avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          o3: daily.co
              ?.map((e) => ForecastDataDto(
                  avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          pm10: daily.co
              ?.map((e) => ForecastDataDto(
                  avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          pm25: daily.co
              ?.map((e) => ForecastDataDto(
                  avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          so2: daily.co
              ?.map((e) => ForecastDataDto(
                  avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
        ),
      ),
      measurements: MeasurementsDto(
        co: measurements.co == null
            ? null
            : ParameterDto(value: measurements.co!.value),
        o3: measurements.o3 == null
            ? null
            : ParameterDto(value: measurements.o3!.value),
        no2: measurements.no2 == null
            ? null
            : ParameterDto(value: measurements.no2!.value),
        pm10: measurements.pm10 == null
            ? null
            : ParameterDto(value: measurements.pm10!.value),
        pm25: measurements.pm25 == null
            ? null
            : ParameterDto(value: measurements.pm25!.value),
        so2: measurements.so2 == null
            ? null
            : ParameterDto(value: measurements.so2!.value),
        humidity: measurements.humidity == null
            ? null
            : ParameterDto(value: measurements.humidity!.value),
        wind: measurements.wind == null
            ? null
            : ParameterDto(value: measurements.wind!.value),
        pressure: measurements.pressure == null
            ? null
            : ParameterDto(value: measurements.pressure!.value),
        temperature: measurements.temperature == null
            ? null
            : ParameterDto(value: measurements.temperature!.value),
      ),
      time: TimeDto(
        iso: time.iso,
        s: time.s,
        sTime: time.sTime,
        tz: time.tz,
        v: time.v,
        vTime: time.vTime,
      ),
    );
  }

  AirQuality? toDomain(AirQualityDto? dto) {
    if (dto == null) {
      return null;
    }

    final attributions = dto.attributions;
    final city = dto.city;
    final debug = dto.debug;
    final daily = dto.forecast.daily;
    final measurements = dto.measurements;
    final time = dto.time;

    return AirQuality(
      aqi: dto.aqi,
      domPol: dto.domPol,
      idx: dto.idx,
      attributions: attributions
          .map((e) => Attribution(logo: e.logo, name: e.name, url: e.url))
          .toList(),
      city: City(
        geo: city.geo.map((e) => e).toList(),
        name: city.name,
        location: city.location,
        url: city.url,
      ),
      debug: Debug(sync: debug.sync),
      forecast: Forecast(
        daily: Daily(
          co: daily.co
              ?.map((e) =>
                  ForecastData(avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          no2: daily.co
              ?.map((e) =>
                  ForecastData(avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          o3: daily.co
              ?.map((e) =>
                  ForecastData(avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          pm10: daily.co
              ?.map((e) =>
                  ForecastData(avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          pm25: daily.co
              ?.map((e) =>
                  ForecastData(avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
          so2: daily.co
              ?.map((e) =>
                  ForecastData(avg: e.avg, day: e.day, max: e.max, min: e.min))
              .toList(),
        ),
      ),
      measurements: Measurements(
        co: measurements.co == null
            ? null
            : Parameter(value: measurements.co!.value),
        o3: measurements.o3 == null
            ? null
            : Parameter(value: measurements.o3!.value),
        no2: measurements.no2 == null
            ? null
            : Parameter(value: measurements.no2!.value),
        pm10: measurements.pm10 == null
            ? null
            : Parameter(value: measurements.pm10!.value),
        pm25: measurements.pm25 == null
            ? null
            : Parameter(value: measurements.pm25!.value),
        so2: measurements.so2 == null
            ? null
            : Parameter(value: measurements.so2!.value),
        humidity: measurements.humidity == null
            ? null
            : Parameter(value: measurements.humidity!.value),
        wind: measurements.wind == null
            ? null
            : Parameter(value: measurements.wind!.value),
        pressure: measurements.pressure == null
            ? null
            : Parameter(value: measurements.pressure!.value),
        temperature: measurements.temperature == null
            ? null
            : Parameter(value: measurements.temperature!.value),
      ),
      time: Time(
        iso: time.iso,
        s: time.s,
        sTime: time.sTime,
        tz: time.tz,
        v: time.v,
        vTime: time.vTime,
      ),
    );
  }
}
