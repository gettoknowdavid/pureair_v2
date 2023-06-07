// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'tp': instance.tp,
      'pr': instance.pr,
      'hu': instance.hu,
      'ws': instance.ws,
      'wd': instance.wd,
      'ic': instance.ic,
    };

_$_WeatherDto _$$_WeatherDtoFromJson(Map<String, dynamic> json) =>
    _$_WeatherDto(
      ts: json['ts'] == null ? null : DateTime.parse(json['ts'] as String),
      tp: json['tp'] as num?,
      pr: json['pr'] as num?,
      hu: json['hu'] as num?,
      ws: json['ws'] as num?,
      wd: json['wd'] as num?,
      ic: json['ic'] as String?,
    );

Map<String, dynamic> _$$_WeatherDtoToJson(_$_WeatherDto instance) =>
    <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'tp': instance.tp,
      'pr': instance.pr,
      'hu': instance.hu,
      'ws': instance.ws,
      'wd': instance.wd,
      'ic': instance.ic,
    };
