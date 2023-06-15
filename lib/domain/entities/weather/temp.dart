import 'package:freezed_annotation/freezed_annotation.dart';

part 'temp.freezed.dart';

@freezed
class Temp with _$Temp {
  const factory Temp({
    double? day,
    double? min,
    double? max,
    double? night,
    double? eve,
    double? morn,
  }) = _Temp;
}
