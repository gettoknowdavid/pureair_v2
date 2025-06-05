import 'package:equatable/equatable.dart';
import 'package:pureair_v2/src/features/air_quality/models/models.dart';

final class AirQuality with EquatableMixin {
  const AirQuality({
    required this.value,
    required this.dominantPol,
    required this.idx,
    required this.attributions,
    required this.city,
    required this.iaqi,
    required this.forecast,
  });

  final int value;
  final String dominantPol;
  final int idx;
  final List<Attribution> attributions;
  final City city;
  final IAqi iaqi;
  final Forecast forecast;

  @override
  List<Object?> get props => [
        value,
        dominantPol,
        idx,
        attributions,
        city,
        iaqi,
        forecast,
      ];

  AirQuality copyWith({
    int? value,
    String? dominantPol,
    int? idx,
    List<Attribution>? attributions,
    City? city,
    IAqi? iaqi,
    Forecast? forecast,
  }) {
    return AirQuality(
      value: value ?? this.value,
      dominantPol: dominantPol ?? this.dominantPol,
      idx: idx ?? this.idx,
      attributions: attributions ?? this.attributions,
      city: city ?? this.city,
      iaqi: iaqi ?? this.iaqi,
      forecast: forecast ?? this.forecast,
    );
  }
}
