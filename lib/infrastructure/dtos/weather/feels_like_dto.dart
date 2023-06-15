import 'package:freezed_annotation/freezed_annotation.dart';

part 'feels_like_dto.freezed.dart';
part 'feels_like_dto.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
)
class FeelsLikeDto with _$FeelsLikeDto {
  factory FeelsLikeDto({
    double? day,
    double? night,
    double? eve,
    double? morn,
  }) = _FeelsLikeDto;

  factory FeelsLikeDto.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FeelsLikeDtoToJson(this);
}
