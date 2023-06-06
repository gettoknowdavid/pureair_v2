import 'package:freezed_annotation/freezed_annotation.dart';

part 'aqi_error.freezed.dart';

@freezed
class AqiError with _$AqiError {
  const factory AqiError.message([String? message]) = _Message;
  const factory AqiError.serverError() = _ServerError;
}
