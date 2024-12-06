import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AirQualityCard extends StatelessWidget {
  const AirQualityCard({
    required this.airQuality,
    this.loading = false,
    super.key,
  });

  final AirQuality airQuality;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;

    final size = MediaQuery.sizeOf(context);
    final smallHeight = (size.height * 0.25) * 0.3;

    return InkWell(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PContainer(height: smallHeight, backgroundColor: backgroundColor),
          Skeletonizer(
            enabled: loading,
            effect: const PulseEffect(),
            child: PContainer(
              margin: const EdgeInsets.all(8),
              backgroundColor: backgroundColor,
              child: Column(
                children: [
                  const SizedBox(height: 18),
                  _TopSection(airQuality: airQuality, height: smallHeight),
                  const PDivider(height: 40, indent: 16, endIndent: 16),
                  _BottomSection(iaqi: airQuality.iaqi),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  const _TopSection({required this.airQuality, required this.height});
  final AirQuality airQuality;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding24,
      child: Row(
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
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection({required this.iaqi});
  final IAQI iaqi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ParameterWidget(
            icon: PhosphorIconsRegular.thermometerSimple,
            label: '${iaqi.temperature?.value}°C',
          ),
          ParameterWidget(
            icon: PhosphorIconsRegular.drop,
            label: '${iaqi.humidity?.value}%',
          ),
          ParameterWidget(
            icon: PhosphorIconsRegular.gauge,
            label: '${iaqi.pressure?.value}mb',
          ),
          ParameterWidget(
            icon: PhosphorIconsRegular.wind,
            label: '${iaqi.wind?.value}/s',
          ),
        ],
      ),
    );
  }
}
