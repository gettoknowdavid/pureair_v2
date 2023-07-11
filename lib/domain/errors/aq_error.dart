import 'package:freezed_annotation/freezed_annotation.dart';

part 'aq_error.freezed.dart';

@freezed
class AQError with _$AQError {
  const factory AQError.message([String? message]) = _Message;
  const factory AQError.serverError() = _ServerError;
}
