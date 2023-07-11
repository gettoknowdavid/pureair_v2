import 'package:freezed_annotation/freezed_annotation.dart';

import 'daily.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  factory Forecast({
    required Daily daily,
  }) = _Forecast;
}
