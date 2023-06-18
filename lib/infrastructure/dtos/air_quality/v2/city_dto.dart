import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_dto.freezed.dart';
part 'city_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class CityDto with _$CityDto {
  factory CityDto({
    required List<double> geo,
    required String name,
    String? url,
    String? location,
  }) = _CityDto;

  factory CityDto.fromJson(Map<String, dynamic> json) =>
      _$CityDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityDtoToJson(this);
}
