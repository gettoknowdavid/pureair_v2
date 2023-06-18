import 'package:freezed_annotation/freezed_annotation.dart';

import 'parameter.dart';

part 'measurements.freezed.dart';

@freezed
class Measurements with _$Measurements {
  factory Measurements({
    Parameter? co,
    Parameter? no2,
    Parameter? o3,
    Parameter? pm10,
    Parameter? pm25,
    Parameter? so2,
    /// p
    Parameter? pressure,
    /// t
    Parameter? temperature,
    /// w
    Parameter? wind,
    /// h
    Parameter? humidity,
  }) = _Measurements;
}
