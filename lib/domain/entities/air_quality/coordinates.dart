import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates.freezed.dart';

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    double? lat,
    double? lon,
  }) = _Coordinates;
}
