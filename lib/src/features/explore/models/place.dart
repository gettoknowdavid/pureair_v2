import 'package:equatable/equatable.dart';

final class Place with EquatableMixin {
  const Place({
    required this.placeId,
    required this.name,
    required this.lat,
    required this.lon,
    required this.types,
    this.country,
    this.state,
    this.city,
    this.countryISO,
  });

  final String placeId;
  final String name;
  final double lat;
  final double lon;
  final List<String> types;
  final String? country;
  final String? state;
  final String? city;
  final String? countryISO;

  @override
  List<Object?> get props => [
        placeId,
        name,
        lat,
        lon,
        types,
        country,
        state,
        city,
        countryISO,
      ];
}
