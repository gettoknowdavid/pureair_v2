import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class LocalAirQualityWidget extends ConsumerWidget {
  const LocalAirQualityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final airQuality = ref.watch(localAirQualityProvider);
    return airQuality.when(
      loading: () => AirQualityCard(airQuality: fakeAirQuality, loading: true),
      data: (airQuality) => AirQualityCard(airQuality: airQuality),
      error: (e, _) => Center(child: Text((e as AirQualityException).value)),
    );
  }
}
