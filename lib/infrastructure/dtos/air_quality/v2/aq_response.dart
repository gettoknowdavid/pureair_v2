import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'aq_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  genericArgumentFactories: true,
)
class AQResponse<T> extends Equatable {
  final String? status;
  final T? data;
  final String? message;

  const AQResponse({this.status, this.data, this.message});

  factory AQResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$AQResponseFromJson<T>(json, fromJsonT);

  @override
  List<Object?> get props => [status, data, message];

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$AQResponseToJson<T>(this, toJsonT);
}
