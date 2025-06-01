import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'daily_forecast.g.dart';

@JsonSerializable()
final class DailyForecast with EquatableMixin {
  const DailyForecast({this.avg = 0, this.max = 0, this.min = 0, this.day});

  factory DailyForecast.fromJson(Map<String, dynamic> json) =>
      _$DailyForecastFromJson(json);

  final num avg;
  final int max;
  final int min;

  final DateTime? day;

  @override
  List<Object?> get props => [avg, max, min, day];
  DailyForecast copyWith({
    num? avg,
    int? max,
    int? min,
    DateTime? day,
  }) {
    return DailyForecast(
      avg: avg ?? this.avg,
      max: max ?? this.max,
      min: min ?? this.min,
      day: day ?? this.day,
    );
  }

  Map<String, dynamic> toJson() => _$DailyForecastToJson(this);
}
