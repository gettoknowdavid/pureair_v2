// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_dto.freezed.dart';
part 'city_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class CityDto with _$CityDto {
  factory CityDto({
    @JsonKey(name: 'city') required String name,
  }) = _CityDto;

  factory CityDto.fromJson(Map<String, dynamic> json) =>
      _$CityDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CityDtoToJson(this);
}
