import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';

part 'air_quality_exception.freezed.dart';

@freezed
class AirQualityException with _$AirQualityException implements Exception {
  const factory AirQualityException.message(String error) = AQMessageException;
  const factory AirQualityException.serverError() = AQServerException;
  const factory AirQualityException.unknown() = AQUnknownException;
  const factory AirQualityException.unavailable() = AQUnavailable;
}

extension AirQualityExceptionX on AirQualityException {
  String get value {
    return when(
      message: (error) => error,
      serverError: () => ErMsg.server,
      unknown: () => ErMsg.unknown,
      unavailable: () => ErMsg.unavailable,
    );
  }
}
