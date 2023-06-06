import 'package:freezed_annotation/freezed_annotation.dart';

part 'p2_dto.freezed.dart';
part 'p2_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class P2Dto with _$P2Dto {
  factory P2Dto({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _P2Dto;

  factory P2Dto.fromJson(Map<String, dynamic> json) => _$P2DtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$P2DtoToJson(this);
}
