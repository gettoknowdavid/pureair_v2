import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HealthRecommendationWidget extends ConsumerWidget {
  const HealthRecommendationWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);

    return state.when(
      data: (airQuality) => _HealthRecommendationView(index: airQuality!.value),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const _HealthRecommendationView(loading: true),
    );
  }
}

class _HealthRecommendationView extends StatelessWidget {
  const _HealthRecommendationView({this.index = 0, this.loading = false});
  final int index;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final details = getLongHealthMessage(index);

    return Skeletonizer(
      enabled: loading,
      child: PContainer(
        padding: kAllPadding24,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DetailsSectionTitle(title: 'Health Recommendations'),
            const PDivider(height: 40),
            Text(details, style: PureAirTextTheme.of(context)!.body),
          ],
        ),
      ),
    );
  }
}
