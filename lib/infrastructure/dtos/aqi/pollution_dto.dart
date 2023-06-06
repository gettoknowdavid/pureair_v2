import 'package:freezed_annotation/freezed_annotation.dart';

import 'p2_dto.dart';

part 'pollution_dto.freezed.dart';
part 'pollution_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class PollutionDto with _$PollutionDto {
  factory PollutionDto({
    DateTime? ts,
    int? aqius,
    String? mainus,
    int? aqicn,
    String? maincn,
    P2Dto? p2,
  }) = _PollutionDto;

  factory PollutionDto.fromJson(Map<String, dynamic> json) =>
      _$PollutionDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PollutionDtoToJson(this);
}
