import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DetailsTopSection extends StatelessWidget {
  const DetailsTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PContainer(
      child: Column(
        children: [
          SizedBox(height: 24),
          Padding(padding: kHorizontalPadding24, child: _StationInfoWidget()),
          PDivider(height: 50, indent: 24, endIndent: 24),
          Padding(padding: kHorizontalPadding24, child: _WeatherInfoWidget()),
          SizedBox(height: 24),
          _DetailedMessageWidget(),
        ],
      ),
    );
  }
}

class _StationInfoWidget extends ConsumerWidget {
  const _StationInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);
    final size = MediaQuery.sizeOf(context);
    final height = (size.height * 0.25) * 0.3;
    return state.when(
      data: (data) => StationInfoWidget(airQuality: data!, height: height),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => Skeletonizer(
        child: StationInfoWidget(airQuality: fakeAirQuality, height: height),
      ),
    );
  }
}

class _WeatherInfoWidget extends ConsumerWidget {
  const _WeatherInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);
    return state.when(
      data: (data) => WeatherInfoWidget(iaqi: data!.iaqi),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const Skeletonizer(
        child: WeatherInfoWidget(iaqi: fakeIAQI),
      ),
    );
  }
}

class _DetailedMessageWidget extends ConsumerWidget {
  const _DetailedMessageWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);
    return state.when(
      data: (data) => DetailedMessageWidget(index: data!.value),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const Skeletonizer(child: DetailedMessageWidget(index: 0)),
    );
  }
}
