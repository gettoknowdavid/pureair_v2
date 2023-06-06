// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CurrentDtoToJson(CurrentDto instance) =>
    <String, dynamic>{
      'weather': instance.weather?.toJson(),
      'pollution': instance.pollution?.toJson(),
    };

_$_CurrentDto _$$_CurrentDtoFromJson(Map<String, dynamic> json) =>
    _$_CurrentDto(
      weather: json['weather'] == null
          ? null
          : WeatherDto.fromJson(json['weather'] as Map<String, dynamic>),
      pollution: json['pollution'] == null
          ? null
          : PollutionDto.fromJson(json['pollution'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CurrentDtoToJson(_$_CurrentDto instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'pollution': instance.pollution,
    };
