import 'package:freezed_annotation/freezed_annotation.dart';

part 'n2.freezed.dart';

@freezed
class N2 with _$N2 {
  const factory N2({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _N2;
}
