import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  const factory Place({
    required String placeId,
    String? country,
    String? state,
    String? city,
    String? countryISO,
    required String name,
    required double lat,
    required double lon,
    required List<String> types,
  }) = _Place;
}
