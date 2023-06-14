import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_dto.freezed.dart';
part 'main_dto.g.dart';

@freezed
@JsonSerializable(createFactory: false, explicitToJson: true)
class MainDto with _$MainDto {
  factory MainDto({
    int? aqi,
  }) = _MainDto;

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      _$MainDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MainDtoToJson(this);
}
