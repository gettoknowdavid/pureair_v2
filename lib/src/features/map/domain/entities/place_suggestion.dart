import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_suggestion.freezed.dart';

@freezed
class PlaceSuggestion with _$PlaceSuggestion {
  factory PlaceSuggestion({
    required String placeId,
    required String description,
  }) = _PlaceSuggestion;
}
