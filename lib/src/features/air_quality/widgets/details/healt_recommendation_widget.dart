import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HealthRecommendationWidget extends StatelessWidget {
  const HealthRecommendationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        switch (state) {
          case DetailsLoadInProgress():
            return const _Content(0, isLoading: true);
          case DetailsLoadFailure():
            return const SizedBox.shrink();
          case DetailsLoadSuccess(:final airQuality):
            return _Content(airQuality.value);
        }
      },
    );
  }
}

class _Content extends StatelessWidget {
  const _Content(this.index, {this.isLoading = false});
  final int index;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final details = getLongHealthMessage(index);

    return Skeletonizer(
      enabled: isLoading,
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
