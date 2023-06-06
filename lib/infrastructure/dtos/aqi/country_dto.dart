// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_dto.freezed.dart';
part 'country_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class CountryDto with _$CountryDto {
  factory CountryDto({
    @JsonKey(name: 'country') required String name,
  }) = _CountryDto;

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CountryDtoToJson(this);
}
