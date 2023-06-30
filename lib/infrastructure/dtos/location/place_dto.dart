import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_dto.freezed.dart';
part 'place_dto.g.dart';

@Freezed(toJson: true)
class PlaceDto with _$PlaceDto {
  factory PlaceDto({
    required String placeId,
    String? country,
    String? state,
    String? city,
    String? countryISO,
    required String name,
    required double lat,
    required double lon,
    required List<String> types,
  }) = _PlaceDto;

  factory PlaceDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDtoFromJson(json);
}
