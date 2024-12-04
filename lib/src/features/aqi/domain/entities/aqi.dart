import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/aqi/domain/entities/entities.dart';

part 'aqi.freezed.dart';

@freezed
class AQI with _$AQI {
  const factory AQI({
    required int value,
    required int idx,
    required List<Attribution> attributions,
    required City city,
    required String dominantPol,
    required IAQI iaqi,
    required Forecast forecast,
  }) = _AQI;
}
