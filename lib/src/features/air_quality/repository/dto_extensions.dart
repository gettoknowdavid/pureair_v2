import 'package:pureair_v2/src/features/air_quality/models/models.dart';
import 'package:pureair_v2/src/features/air_quality/repository/datasources/dtos/dtos.dart';

extension AirQualityToDtoX on AirQuality {
  AirQualityDto get toDto {
    return AirQualityDto()
      ..value.v = value
      ..dominantPol.v = dominantPol
      ..idx.v = idx
      ..attributions.v = attributions.map((a) => a.toDto).toList()
      ..city.v = city.toDto
      ..iaqi.v = iaqi.toDto
      ..forecast.v = forecast.toDto;
  }
}

extension AirQualityToDomainX on AirQualityDto {
  AirQuality get toDomain {
    return AirQuality(
      value: value.v!,
      dominantPol: dominantPol.v!,
      idx: idx.v!,
      attributions: attributions.v!.map((a) => a.toDomain).toList(),
      city: city.v!.toDomain,
      iaqi: iaqi.v!.toDomain,
      forecast: forecast.v!.toDomain,
    );
  }
}

extension AttributionToDtoX on Attribution {
  AttributionDto get toDto {
    return AttributionDto()
      ..logo.v = logo
      ..name.v = name
      ..url.v = url;
  }
}

extension AttributionToDomainX on AttributionDto {
  Attribution get toDomain {
    return Attribution(
      logo: logo.v,
      name: name.v,
      url: url.v,
    );
  }
}

extension CityToDtoX on City {
  CityDto get toDto {
    return CityDto()
      ..name.v = name
      ..uid.v = uid
      ..geo.v = geo?.toDto
      ..url.v = url
      ..location.v = location
      ..country.v = country
      ..isLocal.v = isLocal ? 1 : 0
      ..aqi.v = aqi
      ..flagUrl.v = flagUrl
      ..localeName.v = localeName
      ..time.v = time?.millisecondsSinceEpoch
      ..addedTime.v = addedTime?.millisecondsSinceEpoch;
  }
}

extension CityToDomainX on CityDto {
  City get toDomain {
    return City(
      name: name.v!,
      uid: uid.v,
      geo: geo.v?.toDomain,
      url: url.v,
      location: location.v,
      country: country.v,
      isLocal: isLocal.v == 1,
      aqi: aqi.v,
      flagUrl: flagUrl.v,
      localeName: localeName.v,
      time:
          time.v != null ? DateTime.fromMillisecondsSinceEpoch(time.v!) : null,
      addedTime: addedTime.v != null
          ? DateTime.fromMillisecondsSinceEpoch(addedTime.v!)
          : null,
    );
  }
}

extension DailyForecastToDtoX on DailyForecast {
  DailyForecastDto get toDto {
    return DailyForecastDto()
      ..avg.v = avg
      ..max.v = max
      ..min.v = min
      ..day.v = day ?? DateTime.now();
  }
}

extension DailyForecastToDomainX on DailyForecastDto {
  DailyForecast get toDomain {
    return DailyForecast(
      avg: avg.v ?? 0,
      max: max.v ?? 0,
      min: min.v ?? 0,
      day: day.v ?? DateTime.now(),
    );
  }
}

extension ForecastDataToDtoX on ForecastData {
  ForecastDataDto get toDto {
    return ForecastDataDto()
      ..o3.v = o3?.map((d) => d.toDto).toList()
      ..pm10.v = pm10?.map((d) => d.toDto).toList()
      ..pm25.v = pm25?.map((d) => d.toDto).toList()
      ..uvi.v = uvi?.map((d) => d.toDto).toList()
      ..co.v = co?.map((d) => d.toDto).toList()
      ..no2.v = no2?.map((d) => d.toDto).toList()
      ..so2.v = so2?.map((d) => d.toDto).toList();
  }
}

extension ForecastDataToDomainX on ForecastDataDto {
  ForecastData get toDomain {
    return ForecastData(
      o3: o3.v?.map((d) => d.toDomain).toList(),
      pm10: pm10.v?.map((d) => d.toDomain).toList(),
      pm25: pm25.v?.map((d) => d.toDomain).toList(),
      uvi: uvi.v?.map((d) => d.toDomain).toList(),
      co: co.v?.map((d) => d.toDomain).toList(),
      no2: no2.v?.map((d) => d.toDomain).toList(),
      so2: so2.v?.map((d) => d.toDomain).toList(),
    );
  }
}

extension ForecastToDtoX on Forecast {
  ForecastDto get toDto => ForecastDto()..data.v = data.toDto;
}

extension ForecastToDomainX on ForecastDto {
  Forecast get toDomain => Forecast(data: data.v!.toDomain);
}

extension GeoToDtoX on Geo {
  GeoDto get toDto {
    return GeoDto()
      ..lat.v = lat
      ..lon.v = lon;
  }
}

extension GeoToDomainX on GeoDto {
  Geo get toDomain => Geo(lat.v!, lon.v!);
}

extension IAqiToDtoX on IAqi {
  IAqiDto get toDto {
    return IAqiDto()
      ..co.value = co?.toDto
      ..no2.value = no2?.toDto
      ..o3.value = o3?.toDto
      ..pm10.value = pm10?.toDto
      ..so2.value = so2?.toDto
      ..pm25.value = pm25?.toDto
      ..pressure.value = pressure?.toDto
      ..temperature.value = temperature?.toDto
      ..wind.value = wind?.toDto
      ..humidity.value = humidity?.toDto
      ..dew.value = dew?.toDto
      ..wg.value = wg?.toDto;
  }
}

extension IAqiToDomainX on IAqiDto {
  IAqi get toDomain {
    return IAqi(
      co: co.v?.toDomain,
      no2: no2.v?.toDomain,
      o3: o3.v?.toDomain,
      pm10: pm10.v?.toDomain,
      so2: so2.v?.toDomain,
      pm25: pm25.v?.toDomain,
      pressure: pressure.v?.toDomain,
      temperature: temperature.v?.toDomain,
      wind: wind.v?.toDomain,
      humidity: humidity.v?.toDomain,
      dew: dew.v?.toDomain,
      wg: wg.v?.toDomain,
    );
  }
}

extension ParameterToDtoX on Parameter {
  ParameterDto get toDto => ParameterDto()..value.v = value;
}

extension ParameterToDomainX on ParameterDto {
  Parameter get toDomain => Parameter(value: value.v ?? 0);
}

extension SearchDataToDtoX on SearchData {
  SearchDataDto get toDto {
    return SearchDataDto()
      ..uid.v = uid
      ..aqi.v = aqi
      ..station.v = station.toDto;
  }
}

extension SearchDataToDomainX on SearchDataDto {
  SearchData get toDomain {
    return SearchData(
      uid: uid.v!,
      aqi: aqi.v!,
      station: station.v!.toDomain,
    );
  }
}

extension StationToDtoX on Station {
  StationDto get toDto {
    return StationDto()
      ..lat.v = lat
      ..lon.v = lon
      ..uid.v = uid
      ..aqi.v = aqi
      ..city.v = city.toDto;
  }
}

extension StationToDomainX on StationDto {
  Station get toDomain {
    return Station(
      lat: lat.v!,
      lon: lon.v!,
      uid: uid.v!,
      aqi: aqi.v!,
      city: city.v!.toDomain,
    );
  }
}
