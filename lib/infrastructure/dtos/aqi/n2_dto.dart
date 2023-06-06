import 'package:freezed_annotation/freezed_annotation.dart';

part 'n2_dto.freezed.dart';
part 'n2_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class N2Dto with _$N2Dto {
  factory N2Dto({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _N2Dto;

  factory N2Dto.fromJson(Map<String, dynamic> json) => _$N2DtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$N2DtoToJson(this);
}
