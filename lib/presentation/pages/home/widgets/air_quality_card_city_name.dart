import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class AirQualityCardCityName extends StatelessWidget {
  final AirQuality airQuality;
  final double height;

  const AirQualityCardCityName({
    super.key,
    required this.airQuality,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AqiWidget(height: height, airQuality: airQuality),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CityName(city: airQuality.city),
                4.verticalSpace,
                HealthMessageWidget(aqi: airQuality.aqi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
