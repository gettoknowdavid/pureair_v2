import 'package:freezed_annotation/freezed_annotation.dart';

import 'city_dto.dart';

part 'map_data_dto.freezed.dart';
part 'map_data_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class MapDataDto with _$MapDataDto {
  factory MapDataDto({
    required double lat,
    required double lon,
    required int uid,
    required String aqi,
    required CityDto station,
  }) = _MapDataDto;

  factory MapDataDto.fromJson(Map<String, dynamic> json) =>
      _$MapDataDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MapDataDtoToJson(this);
}
