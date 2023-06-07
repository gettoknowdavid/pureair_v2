import 'package:freezed_annotation/freezed_annotation.dart';

part 'p1_dto.freezed.dart';
part 'p1_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class P1Dto with _$P1Dto {
  factory P1Dto({
    num? conc,
    num? aqius,
    num? aqicn,
  }) = _P1Dto;

  factory P1Dto.fromJson(Map<String, dynamic> json) => _$P1DtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$P1DtoToJson(this);
}
