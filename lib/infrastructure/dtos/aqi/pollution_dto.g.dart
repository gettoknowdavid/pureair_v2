// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$PollutionDtoToJson(PollutionDto instance) =>
    <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'aqius': instance.aqius,
      'mainus': instance.mainus,
      'aqicn': instance.aqicn,
      'maincn': instance.maincn,
      'p2': instance.p2?.toJson(),
    };

_$_PollutionDto _$$_PollutionDtoFromJson(Map<String, dynamic> json) =>
    _$_PollutionDto(
      ts: json['ts'] == null ? null : DateTime.parse(json['ts'] as String),
      aqius: json['aqius'] as num?,
      mainus: json['mainus'] as String?,
      aqicn: json['aqicn'] as num?,
      maincn: json['maincn'] as String?,
      p2: json['p2'] == null
          ? null
          : P2Dto.fromJson(json['p2'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_PollutionDtoToJson(_$_PollutionDto instance) =>
    <String, dynamic>{
      'ts': instance.ts?.toIso8601String(),
      'aqius': instance.aqius,
      'mainus': instance.mainus,
      'aqicn': instance.aqicn,
      'maincn': instance.maincn,
      'p2': instance.p2,
    };
