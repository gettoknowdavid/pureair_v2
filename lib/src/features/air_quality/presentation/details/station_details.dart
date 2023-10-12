import 'package:flutter/material.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';
import '../../domain/entities/entities.dart';

class StationDetails extends StatelessWidget {
  final AirQuality? airQuality;
  final double height;
  final bool loading;

  const StationDetails({
    super.key,
    required this.height,
    this.airQuality,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loading
              ? ShimmerWidget(height, width: height)
              : AqiWidget(height: height, airQuality: airQuality!),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                loading
                    ? const ShimmerWidget(16)
                    : CityName(city: airQuality!.city),
                4.verticalSpace,
                loading
                    ? const ShimmerWidget(13)
                    : HealthMessageWidget(aqi: airQuality!.aqi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
