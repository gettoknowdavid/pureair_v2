import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/models/city.dart';

final class Station with EquatableMixin {
  const Station({
    required this.lat,
    required this.lon,
    required this.uid,
    required this.aqi,
    required this.city,
  });

  final double lat;
  final double lon;
  final num uid;
  final String aqi;
  final City city;

  @override
  List<Object?> get props => [lat, lon, uid, aqi, city];
}
