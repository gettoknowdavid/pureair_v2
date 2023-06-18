import 'package:freezed_annotation/freezed_annotation.dart';

part 'station_dto.freezed.dart';
part 'station_dto.g.dart';

@freezed
@JsonSerializable(
  explicitToJson: true,
  createFactory: false,
  includeIfNull: false,
)
class StationDto with _$StationDto {
  factory StationDto({
    String? name,
    String? country,
    List<double>? geo,
    String? url,
    DateTime? time,
  }) = _StationDto;

  factory StationDto.fromJson(Map<String, dynamic> json) =>
      _$StationDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StationDtoToJson(this);
}
