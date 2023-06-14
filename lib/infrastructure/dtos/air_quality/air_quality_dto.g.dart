// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AirQualityDtoToJson(AirQualityDto instance) =>
    <String, dynamic>{
      'coord': instance.coordinates.toJson(),
      'list': instance.data.map((e) => e?.toJson()).toList(),
    };

_$_AirQualityDto _$$_AirQualityDtoFromJson(Map<String, dynamic> json) =>
    _$_AirQualityDto(
      coordinates:
          CoordinatesDto.fromJson(json['coord'] as Map<String, dynamic>),
      data: (json['list'] as List<dynamic>)
          .map((e) => e == null
              ? null
              : AirQualityDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AirQualityDtoToJson(_$_AirQualityDto instance) =>
    <String, dynamic>{
      'coord': instance.coordinates,
      'list': instance.data,
    };
