import 'package:freezed_annotation/freezed_annotation.dart';

import 'air_quality_data.dart';
import 'coordinates.dart';

part 'air_quality.freezed.dart';

@freezed
class AirQuality with _$AirQuality {
  const factory AirQuality({
    required Coordinates coordinates,
    required List<AirQualityData?> data,
  }) = _AirQuality;

  factory AirQuality.empty() {
    return const AirQuality(
      coordinates: Coordinates(),
      data: [],
    );
  }
}
