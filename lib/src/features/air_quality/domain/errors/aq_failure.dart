import 'package:freezed_annotation/freezed_annotation.dart';

part 'aq_failure.freezed.dart';

@freezed
class AQFailure with _$AQFailure {
  const factory AQFailure.message([String? message]) = _Message;
  const factory AQFailure.serverError() = _ServerError;
}
