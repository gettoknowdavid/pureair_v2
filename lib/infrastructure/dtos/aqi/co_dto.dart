import 'package:freezed_annotation/freezed_annotation.dart';

part 'co_dto.freezed.dart';
part 'co_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class CODto with _$CODto {
  factory CODto({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _CODto;

  factory CODto.fromJson(Map<String, dynamic> json) => _$CODtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CODtoToJson(this);
}
