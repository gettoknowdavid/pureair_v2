// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o3_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$O3DtoToJson(O3Dto instance) => <String, dynamic>{
      'conc': instance.conc,
      'aqius': instance.aqius,
      'aqicn': instance.aqicn,
    };

_$_O3Dto _$$_O3DtoFromJson(Map<String, dynamic> json) => _$_O3Dto(
      conc: (json['conc'] as num?)?.toDouble(),
      aqius: json['aqius'] as int?,
      aqicn: json['aqicn'] as int?,
    );

Map<String, dynamic> _$$_O3DtoToJson(_$_O3Dto instance) => <String, dynamic>{
      'conc': instance.conc,
      'aqius': instance.aqius,
      'aqicn': instance.aqicn,
    };