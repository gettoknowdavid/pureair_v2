import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DetailsPage extends HookConsumerWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const PBackButton(),
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          IconButton(
            icon: const Icon(PhosphorIconsBold.dotsThree),
            onPressed: () {},
          ),
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
          ],
        ),
      ),
    );
  }
}
