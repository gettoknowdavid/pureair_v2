import 'package:flutter/material.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class StationInfoWidget extends StatelessWidget {
  const StationInfoWidget({
    required this.airQuality,
    required this.height,
    super.key,
  });
  final AirQuality airQuality;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IndexWidget(index: airQuality.value, height: height),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CityNameWidget(city: airQuality.city),
              const SizedBox(height: 4),
              HealthMessageWidget(index: airQuality.value),
            ],
          ),
        ),
      ],
    );
  }
}
