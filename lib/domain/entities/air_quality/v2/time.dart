import 'package:freezed_annotation/freezed_annotation.dart';

part 'time.freezed.dart';

@freezed
class Time with _$Time {
  const factory Time({
    DateTime? s,
    String? tz,
    int? v,
    DateTime? iso,
  }) = _Time;
}
