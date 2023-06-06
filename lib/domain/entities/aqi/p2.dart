import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2.freezed.dart';

@freezed
class P2 with _$P2 {
  const factory P2({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _P2;
}
