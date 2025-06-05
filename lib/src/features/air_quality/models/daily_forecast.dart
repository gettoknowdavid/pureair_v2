import 'package:equatable/equatable.dart';

final class DailyForecast with EquatableMixin {
  const DailyForecast({this.avg = 0, this.max = 0, this.min = 0, this.day});

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
}
