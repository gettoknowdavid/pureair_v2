import 'package:flutter/material.dart';
import 'package:pureair_v2/config/helpers/air_quality_helper.dart';
import 'package:pureair_v2/domain/entities/air_quality/air_quality.dart';
import 'package:pureair_v2/presentation/widgets/app_container.dart';

class AqiWidget extends StatelessWidget {
  const AqiWidget({
    super.key,
    required this.airQuality,
    required this.height,
  });

  final AirQuality airQuality;
  final double height;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final color = getAirQualityColor(airQuality.aqi);

    final textColor = getTextColor(color);

    return AppContainer(
      height: height,
      width: height,
      backgroundColor: color,
      alignment: Alignment.center,
      child: Text(
        '${airQuality.aqi}',
        style: textTheme.titleLarge?.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
