import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/models/forecast_data.dart';

final class Forecast with EquatableMixin {
  const Forecast({required this.data});

  final ForecastData data;

  @override
  List<Object?> get props => [data];

  Forecast copyWith({ForecastData? data}) => Forecast(data: data ?? this.data);
}
