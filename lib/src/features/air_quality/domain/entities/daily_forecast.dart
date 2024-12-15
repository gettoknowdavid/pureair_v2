import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast.freezed.dart';
part 'daily_forecast.g.dart';

@freezed
class DailyForecast with _$DailyForecast {
  const factory DailyForecast({
    @Default(0) num avg,
    @Default(0) int max,
    @Default(0) int min,
    DateTime? day,
  }) = _DailyForecast;

  factory DailyForecast.empty() => DailyForecast(day: DateTime.now());

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);
}

extension DailyForecastExtensions on DailyForecast {
  DateTime? get dateOnly =>
      day != null ? DateTime(day!.year, day!.month, day!.day) : null;
}
