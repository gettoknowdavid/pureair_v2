import 'package:freezed_annotation/freezed_annotation.dart';

part 's2_dto.freezed.dart';
part 's2_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class S2Dto with _$S2Dto {
  factory S2Dto({
    num? conc,
    num? aqius,
    num? aqicn,
  }) = _S2Dto;

  factory S2Dto.fromJson(Map<String, dynamic> json) => _$S2DtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$S2DtoToJson(this);
}
