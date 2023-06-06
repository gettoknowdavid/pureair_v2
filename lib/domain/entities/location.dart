import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    String? type,
    List<double>? coordinates,
  }) = _Location;
}
