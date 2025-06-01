import 'package:flutter/material.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StationInfoWidget extends StatelessWidget {
  const StationInfoWidget(
    this.airQuality, {
    this.isLoading = false,
    this.height,
    super.key,
  });

  final AirQuality airQuality;
  final bool isLoading;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final effectiveHeight = height ?? (size.height * 0.25) * 0.3;

    return Skeletonizer(
      enabled: isLoading,
      child: Row(
        children: [
          IndexWidget(index: airQuality.value, height: effectiveHeight),
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
      ),
    );
  }
}
