import 'package:flutter/material.dart';
import 'package:pureair_v2/config/helpers/air_quality_helper.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/presentation/pages/details/widgets/details_section_title.dart';
import 'package:pureair_v2/presentation/widgets/app_container.dart';
import 'package:pureair_v2/presentation/widgets/app_divider.dart';

class HealthRecommendation extends StatelessWidget {
  final int aqi;
  const HealthRecommendation({super.key, required this.aqi});

  @override
  Widget build(BuildContext context) {
    final details = getDetailedHealthMessage(aqi);

    return AppContainer(
      padding: const EdgeInsets.symmetric(vertical: kGlobalPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DetailsSectionTitle(title: 'Health Recommendations'),
          const AppDivider(height: 40, indent: 16, endIndent: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
            child: Text(details, style: Theme.of(context).textTheme.labelLarge),
          ),
        ],
      ),
    );
  }
}
