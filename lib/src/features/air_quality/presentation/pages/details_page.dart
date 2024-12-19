import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({required this.showAddButton, super.key});
  final bool showAddButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const PBackButton(),
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          if (showAddButton) const DetailsAddCityButton(),
          const SizedBox(width: 18),
        ],
      ),
      body: const SingleChildScrollView(
        padding: kHorizontalPadding24,
        child: Column(
          children: [
            SizedBox(height: 10),
            DetailsTopSection(),
            SizedBox(height: 24),
            HealthRecommendationWidget(),
            SizedBox(height: 24),
            PollutantsGridWidget(),
            SizedBox(height: 24),
            ForecastWidget(),
            SizedBox(height: 24),
            DetailsChartWidget(),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class DetailsAddCityButton extends ConsumerWidget {
  const DetailsAddCityButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);
    return state.maybeWhen(
      orElse: () => const AddCityButton(onPressed: null),
      data: (data) => AddCityButton(
        onPressed: () {
          ref.read(citiesNotifierProvider.notifier).addCity(data!.city);
          context.go(R.home);
        },
      ),
    );
  }
}
