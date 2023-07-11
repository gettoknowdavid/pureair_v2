import 'package:freezed_annotation/freezed_annotation.dart';

part 'attribution_dto.freezed.dart';
part 'attribution_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class AttributionDto with _$AttributionDto {
  factory AttributionDto({
    String? url,
    String? name,
    String? logo,
  }) = _AttributionDto;

  factory AttributionDto.fromJson(Map<String, dynamic> json) =>
      _$AttributionDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AttributionDtoToJson(this);
}
