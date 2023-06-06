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
      aqius: json['aqius'] as int?,
      aqicn: json['aqicn'] as int?,
      tp: json['tp'] as int?,
      tpMin: json['tpMin'] as int?,
      pr: json['pr'] as int?,
      hu: json['hu'] as int?,
      ws: json['ws'] as int?,
      wd: json['wd'] as int?,
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
