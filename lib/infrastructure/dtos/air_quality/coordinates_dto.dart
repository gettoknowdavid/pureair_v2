import 'package:freezed_annotation/freezed_annotation.dart';

part 'coordinates_dto.freezed.dart';
part 'coordinates_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class CoordinatesDto with _$CoordinatesDto {
  factory CoordinatesDto({
    double? lat,
    double? lon,
  }) = _CoordinatesDto;

  factory CoordinatesDto.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CoordinatesDtoToJson(this);
}
