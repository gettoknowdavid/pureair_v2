// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ForecastDtoToJson(ForecastDto instance) =>
    <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'aqius': instance.aqius,
      'aqicn': instance.aqicn,
      'tp': instance.tp,
      'tpMin': instance.tpMin,
      'pr': instance.pr,
      'hu': instance.hu,
      'ws': instance.ws,
      'wd': instance.wd,
      'ic': instance.ic,
    };

_$_ForecastDto _$$_ForecastDtoFromJson(Map<String, dynamic> json) =>
    _$_ForecastDto(
      ts: json['ts'] == null ? null : DateTime.parse(json['ts'] as String),
      aqius: json['aqius'] as num?,
      aqicn: json['aqicn'] as num?,
      tp: json['tp'] as num?,
      tpMin: json['tpMin'] as num?,
      pr: json['pr'] as num?,
      hu: json['hu'] as num?,
      ws: json['ws'] as num?,
      wd: json['wd'] as num?,
      ic: json['ic'] as String?,
    );

Map<String, dynamic> _$$_ForecastDtoToJson(_$_ForecastDto instance) =>
    <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'aqius': instance.aqius,
      'aqicn': instance.aqicn,
      'tp': instance.tp,
      'tpMin': instance.tpMin,
      'pr': instance.pr,
      'hu': instance.hu,
      'ws': instance.ws,
      'wd': instance.wd,
      'ic': instance.ic,
    };
