// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CoordinatesDtoToJson(CoordinatesDto instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };

_$_CoordinatesDto _$$_CoordinatesDtoFromJson(Map<String, dynamic> json) =>
    _$_CoordinatesDto(
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_CoordinatesDtoToJson(_$_CoordinatesDto instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
    };
