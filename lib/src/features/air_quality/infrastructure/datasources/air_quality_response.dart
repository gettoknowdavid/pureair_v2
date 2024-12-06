import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_response.freezed.dart';
part 'air_quality_response.g.dart';

@Freezed(genericArgumentFactories: true)
class AirQualityResponse<T> with _$AirQualityResponse<T> {
  const factory AirQualityResponse({
    required String status,
    required T data,
  }) = _AirQualityResponse;

  factory AirQualityResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$AirQualityResponseFromJson(json, fromJsonT);
}
