import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_dto.freezed.dart';
part 'place_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)
class PlaceDto with _$PlaceDto {
  factory PlaceDto({
    required String city,
    required String state,
    required String country,
    String? address,
    required double lat,
    required double lon,
  }) = _PlaceDto;

  factory PlaceDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlaceDtoToJson(this);
}
