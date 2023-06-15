import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_error.freezed.dart';

@freezed
class WeatherError with _$WeatherError {
  const factory WeatherError.message([String? message]) = _Message;
  const factory WeatherError.serverError() = _ServerError;
}
