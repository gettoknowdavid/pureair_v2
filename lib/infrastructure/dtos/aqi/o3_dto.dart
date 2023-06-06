import 'package:freezed_annotation/freezed_annotation.dart';

part 'o3_dto.freezed.dart';
part 'o3_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class O3Dto with _$O3Dto {
  factory O3Dto({
    double? conc,
    int? aqius,
    int? aqicn,
  }) = _O3Dto;

  factory O3Dto.fromJson(Map<String, dynamic> json) => _$O3DtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$O3DtoToJson(this);
}
