// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityResponse<T> _$AirQualityResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    AirQualityResponse<T>(
      status: json['status'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
    );

Map<String, dynamic> _$AirQualityResponseToJson<T>(
  AirQualityResponse<T> instance,
  Object? Function(T value) toJsonT,
) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('data', _$nullableGenericToJson(instance.data, toJsonT));
  return val;
}

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
