import 'package:freezed_annotation/freezed_annotation.dart';

import 'station_dto.dart';
import 'time_dto.dart';

part 'search_data_dto.freezed.dart';
part 'search_data_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, createFactory: false)
class SearchDataDto with _$SearchDataDto {
  factory SearchDataDto({
    required int uid,
    required String aqi,
    required TimeDto time,
    required StationDto station,
  }) = _SearchDataDto;

  factory SearchDataDto.fromJson(Map<String, dynamic> json) =>
      _$SearchDataDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SearchDataDtoToJson(this);
}
