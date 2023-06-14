import 'package:freezed_annotation/freezed_annotation.dart';

import 'main.dart';
import 'pollutants.dart';

part 'air_quality_data.freezed.dart';

@freezed
class AirQualityData with _$AirQualityData {
  const factory AirQualityData({
    Main? main,
    Pollutants? pollutants,
    DateTime? dateTime,
  }) = _AirQualityData;
}
