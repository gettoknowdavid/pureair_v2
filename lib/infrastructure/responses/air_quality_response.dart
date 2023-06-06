import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'air_quality_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  genericArgumentFactories: true,
)
class AirQualityResponse<T> extends Equatable {
  final String? status;
  final T? data;

  const AirQualityResponse({this.status, this.data});

  factory AirQualityResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$AirQualityResponseFromJson<T>(json, fromJsonT);

  @override
  List<Object?> get props => [status, data];

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$AirQualityResponseToJson<T>(this, toJsonT);
}
