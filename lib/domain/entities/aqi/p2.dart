import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2.freezed.dart';

@freezed
class P2 with _$P2 {
  const factory P2({
    num? conc,
    num? aqius,
    num? aqicn,
  }) = _P2;
}
