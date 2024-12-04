import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast.freezed.dart';

@freezed
class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    @Default(0) num avg,
    @Default(0) int max,
    @Default(0) int min,
    DateTime? day,
  }) = _DailyForecast;

  factory DailyForecast.empty() => DailyForecast(day: DateTime.now());
}
