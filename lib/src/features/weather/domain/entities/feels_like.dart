import 'package:freezed_annotation/freezed_annotation.dart';

part 'feels_like.freezed.dart';

@freezed
class FeelsLike with _$FeelsLike {
  const factory FeelsLike({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) = _FeelsLike;
}
