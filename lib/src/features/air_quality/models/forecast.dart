import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/models/forecast_data.dart';

part 'forecast.g.dart';

@JsonSerializable()
final class Forecast with EquatableMixin {
  const Forecast({required this.data});

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  @JsonKey(name: 'daily')
  final ForecastData data;

  @override
  List<Object?> get props => [data];

  Forecast copyWith({ForecastData? data}) => Forecast(data: data ?? this.data);

  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
