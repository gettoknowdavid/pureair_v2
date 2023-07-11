import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/domain/entities/air_quality/air_quality.dart';
import 'package:pureair_v2/presentation/widgets/aqi_widget.dart';
import 'package:pureair_v2/presentation/widgets/city_name.dart';
import 'package:pureair_v2/presentation/widgets/health_message_widget.dart';

class StationDetails extends StatelessWidget {
  final AirQuality airQuality;
  final double height;

  const StationDetails({
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
