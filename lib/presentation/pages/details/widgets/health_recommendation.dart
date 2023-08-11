import 'package:flutter/material.dart';
import 'package:pureair_v2/config/helpers/air_quality_helper.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/presentation/pages/details/widgets/details_section_title.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class HealthRecommendation extends StatelessWidget {
  final int? aqi;
  final bool loading;
  const HealthRecommendation({super.key, this.aqi, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      loading: loading,
      padding: const EdgeInsets.symmetric(vertical: kGlobalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DetailsSectionTitle(
            title: 'Health Recommendations',
            loading: loading,
          ),
          const AppDivider(height: 40, indent: 16, endIndent: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
            child: loading
                ? const ShimmerWidget(20)
                : Text(
                    getDetailedHealthMessage(aqi!),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
          ),
        ],
      ),
    );
  }
}
