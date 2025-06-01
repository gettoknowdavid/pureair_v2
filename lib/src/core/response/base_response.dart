import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
final class BaseResponse<T> with EquatableMixin {
  const BaseResponse({required this.status, required this.data});

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$BaseResponseFromJson(json, fromJsonT);

  final String status;
  final T data;

  @override
  List<Object?> get props => [status, data];

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) =>
      _$BaseResponseToJson(this, toJsonT);
}
