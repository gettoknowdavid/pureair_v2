import 'package:freezed_annotation/freezed_annotation.dart';

part 'o3.freezed.dart';

@freezed
class O3 with _$O3 {
  const factory O3({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _O3;
}
