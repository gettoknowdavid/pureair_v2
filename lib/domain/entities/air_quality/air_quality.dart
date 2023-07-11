import 'package:freezed_annotation/freezed_annotation.dart';

import 'attribution.dart';
import 'city.dart';
import 'debug.dart';
import 'forecast.dart';
import 'measurements.dart';
import 'time.dart';

part 'air_quality.freezed.dart';

@freezed
class AirQuality with _$AirQuality {
  factory AirQuality({
    required int aqi,
    required int idx,
    required List<Attribution> attributions,
    required City city,
    required String domPol,
    required Measurements measurements,
    required Time time,
    required Forecast forecast,
    required Debug debug,
  }) = _AirQuality;
}
