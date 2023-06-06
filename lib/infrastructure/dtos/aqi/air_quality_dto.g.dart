// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AirQualityDtoToJson(AirQualityDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'location': instance.location?.toJson(),
      'forecasts': instance.forecasts?.map((e) => e.toJson()).toList(),
      'current': instance.current?.toJson(),
      'history': instance.history?.toJson(),
    };

_$_AirQualityDto _$$_AirQualityDtoFromJson(Map<String, dynamic> json) =>
    _$_AirQualityDto(
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      forecasts: (json['forecasts'] as List<dynamic>?)
          ?.map((e) => ForecastDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      current: json['current'] == null
          ? null
          : CurrentDto.fromJson(json['current'] as Map<String, dynamic>),
      history: json['history'] == null
          ? null
          : HistoryDto.fromJson(json['history'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AirQualityDtoToJson(_$_AirQualityDto instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'location': instance.location,
      'forecasts': instance.forecasts,
      'current': instance.current,
      'history': instance.history,
    };
