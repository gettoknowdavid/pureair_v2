import 'package:equatable/equatable.dart';

final class PlaceSuggestion with EquatableMixin {
  const PlaceSuggestion({
    required this.placeId,
    required this.description,
  });

  final String placeId;
  final String description;

  @override
  List<Object?> get props => [placeId, description];
}
