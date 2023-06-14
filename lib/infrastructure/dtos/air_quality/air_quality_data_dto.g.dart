// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AirQualityDataDtoToJson(AirQualityDataDto instance) =>
    <String, dynamic>{
      'main': instance.main?.toJson(),
      'components': instance.pollutants?.toJson(),
      'dt': instance.dateTime,
    };

_$_AirQualityDataDto _$$_AirQualityDataDtoFromJson(Map<String, dynamic> json) =>
    _$_AirQualityDataDto(
      main: json['main'] == null
          ? null
          : MainDto.fromJson(json['main'] as Map<String, dynamic>),
      pollutants: json['components'] == null
          ? null
          : PollutantsDto.fromJson(json['components'] as Map<String, dynamic>),
      dateTime: json['dt'] as int?,
    );

Map<String, dynamic> _$$_AirQualityDataDtoToJson(
        _$_AirQualityDataDto instance) =>
    <String, dynamic>{
      'main': instance.main,
      'components': instance.pollutants,
      'dt': instance.dateTime,
    };
