import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pureair_v2/src/features/air_quality/models/city.dart';

part 'station.g.dart';

@JsonSerializable()
final class Station with EquatableMixin {
  const Station({
    required this.lat,
    required this.lon,
    required this.uid,
    required this.aqi,
    required this.city,
  });

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);

  final double lat;
  final double lon;
  final num uid;
  final String aqi;
  @JsonKey(name: 'station')
  final City city;

  Map<String, dynamic> toJson() => _$StationToJson(this);

  @override
  List<Object?> get props => [lat, lon, uid, aqi, city];
}
