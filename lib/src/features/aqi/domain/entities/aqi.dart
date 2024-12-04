import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pureair_v2/src/features/aqi/domain/entities/entities.dart';

part 'aqi.freezed.dart';
part 'aqi.g.dart';

@freezed
class AQI with _$AQI {
  const factory AQI({
    @JsonKey(name: 'aqi') required int value,
    @JsonKey(name: 'dominentpol') required String dominantPol,
    required int idx,
    required List<Attribution> attributions,
    required City city,
    required IAQI iaqi,
    required Forecast forecast,
  }) = _AQI;

  factory AQI.fromJson(Map<String, dynamic> json) => _$AQIFromJson(json);
}
