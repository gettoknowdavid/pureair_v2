import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_dto.freezed.dart';
part 'location_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class LocationDto with _$LocationDto {
  factory LocationDto({
    String? type,
    List<double>? coordinates,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}
