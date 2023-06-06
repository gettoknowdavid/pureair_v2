// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$HistoryDtoToJson(HistoryDto instance) =>
    <String, dynamic>{
      'weather': instance.weather?.map((e) => e.toJson()).toList(),
      'pollution': instance.pollution?.map((e) => e.toJson()).toList(),
    };

_$_HistoryDto _$$_HistoryDtoFromJson(Map<String, dynamic> json) =>
    _$_HistoryDto(
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => WeatherDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      pollution: (json['pollution'] as List<dynamic>?)
          ?.map((e) => PollutionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_HistoryDtoToJson(_$_HistoryDto instance) =>
    <String, dynamic>{
      'weather': instance.weather,
      'pollution': instance.pollution,
    };
