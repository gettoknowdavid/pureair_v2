import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast.freezed.dart';

@freezed
class Forecast with _$Forecast {
  const factory Forecast({
    DateTime? ts,
    int? aqius,
    int? aqicn,
    int? tp,
    int? tpMin,
    int? pr,
    int? hu,
    int? ws,
    int? wd,
    String? ic,
  }) = _Forecast;
}
