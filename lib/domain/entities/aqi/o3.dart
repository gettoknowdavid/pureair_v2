import 'package:freezed_annotation/freezed_annotation.dart';

part 'o3.freezed.dart';

@freezed
class O3 with _$O3 {
  const factory O3({
    num? conc,
    num? aqius,
    num? aqicn,
  }) = _O3;
}
