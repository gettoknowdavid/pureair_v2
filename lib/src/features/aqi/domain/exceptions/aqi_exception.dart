import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_exception.freezed.dart';

@freezed
class AQIException with _$AQIException {
  const factory AQIException.message(String error) = AQIMessageException;
  const factory AQIException.serverError() = AQIServerException;
}
