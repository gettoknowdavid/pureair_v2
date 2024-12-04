import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_response.freezed.dart';
part 'aqi_response.g.dart';

@Freezed(genericArgumentFactories: true)
class AQIResponse<T> with _$AQIResponse<T> {
  const factory AQIResponse({
    required String status,
    required T data,
  }) = _AQIResponse;

  factory AQIResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$AQIResponseFromJson(json, fromJsonT);
}
