import 'package:freezed_annotation/freezed_annotation.dart';

part 'p1.freezed.dart';

@freezed
class P1 with _$P1 {
  const factory P1({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _P1;
}
