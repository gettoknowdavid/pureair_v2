import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AirQualityCard extends ConsumerWidget {
  const AirQualityCard({
    required this.airQuality,
    this.loading = false,
    super.key,
  });

  final AirQuality airQuality;
  final bool loading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor = Theme.of(context).colorScheme.surface;

    final size = MediaQuery.sizeOf(context);
    final smallHeight = (size.height * 0.25) * 0.3;

    return InkWell(
      onTap: () {
        ref.read(detailsNotifierProvider.notifier).initWithValue(airQuality);
        context.push(R.details);
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PContainer(height: smallHeight, backgroundColor: backgroundColor),
          Skeletonizer(
            enabled: loading,
            effect: const PulseEffect(),
            child: PContainer(
              margin: const EdgeInsets.all(8),
              padding: kAllPadding24,
              backgroundColor: backgroundColor,
              child: Column(
                children: [
                  StationInfoWidget(
                    airQuality: airQuality,
                    height: smallHeight,
                  ),
                  const PDivider(height: 50),
                  WeatherInfoWidget(iaqi: airQuality.iaqi),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
