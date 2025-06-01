import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/models/daily_forecast.dart';

part 'forecast_data.g.dart';

@JsonSerializable()
final class ForecastData with EquatableMixin {
  const ForecastData({
    this.o3,
    this.pm10,
    this.pm25,
    this.uvi,
    this.co,
    this.no2,
    this.so2,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDataFromJson(json);

  final List<DailyForecast>? o3;
  final List<DailyForecast>? pm10;
  final List<DailyForecast>? pm25;
  final List<DailyForecast>? uvi;
  final List<DailyForecast>? co;
  final List<DailyForecast>? no2;
  final List<DailyForecast>? so2;

  @override
  List<Object?> get props => [o3, pm10, pm25, uvi, co, no2, so2];

  ForecastData copyWith({
    List<DailyForecast>? o3,
    List<DailyForecast>? pm10,
    List<DailyForecast>? pm25,
    List<DailyForecast>? uvi,
    List<DailyForecast>? co,
    List<DailyForecast>? no2,
    List<DailyForecast>? so2,
  }) {
    return ForecastData(
      o3: o3 ?? this.o3,
      pm10: pm10 ?? this.pm10,
      pm25: pm25 ?? this.pm25,
      uvi: uvi ?? this.uvi,
      co: co ?? this.co,
      no2: no2 ?? this.no2,
      so2: so2 ?? this.so2,
    );
  }

  Map<String, dynamic> toJson() => _$ForecastDataToJson(this);
}
