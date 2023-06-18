// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AirQualityDtoToJson(AirQualityDto instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'idx': instance.idx,
      'attributions': instance.attributions.map((e) => e.toJson()).toList(),
      'city': instance.city.toJson(),
      'dominentpol': instance.domPol,
      'iaqi': instance.measurements.toJson(),
      'time': instance.time.toJson(),
      'forecast': instance.forecast.toJson(),
      'debug': instance.debug.toJson(),
    };

_$_AirQualityDto _$$_AirQualityDtoFromJson(Map<String, dynamic> json) =>
    _$_AirQualityDto(
      aqi: json['aqi'] as int,
      idx: json['idx'] as int,
      attributions: (json['attributions'] as List<dynamic>)
          .map((e) => AttributionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      city: CityDto.fromJson(json['city'] as Map<String, dynamic>),
      domPol: json['dominentpol'] as String,
      measurements:
          MeasurementsDto.fromJson(json['iaqi'] as Map<String, dynamic>),
      time: TimeDto.fromJson(json['time'] as Map<String, dynamic>),
      forecast: ForecastDto.fromJson(json['forecast'] as Map<String, dynamic>),
      debug: DebugDto.fromJson(json['debug'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AirQualityDtoToJson(_$_AirQualityDto instance) =>
    <String, dynamic>{
      'aqi': instance.aqi,
      'idx': instance.idx,
      'attributions': instance.attributions,
      'city': instance.city,
      'dominentpol': instance.domPol,
      'iaqi': instance.measurements,
      'time': instance.time,
      'forecast': instance.forecast,
      'debug': instance.debug,
    };
