import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    DateTime? ts,
    num? aqius,
    num? aqicn,
    num? tp,
    num? tpMin,
    num? pr,
    num? hu,
    num? ws,
    num? wd,
    String? ic,
  }) = _Forecast;
}
