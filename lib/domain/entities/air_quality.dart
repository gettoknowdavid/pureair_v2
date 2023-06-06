import 'package:freezed_annotation/freezed_annotation.dart';

import 'current.dart';
import 'forecast.dart';
import 'history.dart';
import 'location.dart';

part 'air_quality.freezed.dart';

@freezed
class AirQuality with _$AirQuality {
  const factory AirQuality({
    String? city,
    String? state,
    String? country,
    Location? location,
    List<Forecast>? forecasts,
    Current? current,
    History? history,
  }) = _AirQuality;
}
