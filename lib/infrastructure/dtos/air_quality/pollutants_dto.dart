import 'package:freezed_annotation/freezed_annotation.dart';

part 'pollutants_dto.freezed.dart';
part 'pollutants_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class PollutantsDto with _$PollutantsDto {
  factory PollutantsDto({
    Map<String, num>? components,
  }) = _PollutantsDto;

  factory PollutantsDto.fromJson(Map<String, dynamic> json) =>
      _$PollutantsDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PollutantsDtoToJson(this);
}
