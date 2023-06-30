import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_suggestion_dto.freezed.dart';
part 'place_suggestion_dto.g.dart';

@Freezed(toJson: true)
class PlaceSuggestionDto with _$PlaceSuggestionDto {
  factory PlaceSuggestionDto({
    required String placeId,
    required String description,
  }) = _PlaceSuggestionDto;

  factory PlaceSuggestionDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceSuggestionDtoFromJson(json);
}
