import 'package:freezed_annotation/freezed_annotation.dart';

import 'p2.dart';

part 'pollution.freezed.dart';

@freezed
class Pollution with _$Pollution {
  const factory Pollution({
    DateTime? ts,
    int? aqius,
    String? mainus,
    int? aqicn,
    String? maincn,
    P2? p2,
  }) = _Pollution;
}
