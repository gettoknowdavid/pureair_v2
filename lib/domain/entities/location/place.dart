import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String city,
    required String state,
    required String country,
    String? address,
    required double lat,
    required double lon,
  }) = _Place;
}
