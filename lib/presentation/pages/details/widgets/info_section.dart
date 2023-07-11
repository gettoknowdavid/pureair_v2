import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/config/helpers/air_quality_helper.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/domain/entities/air_quality/air_quality.dart';
import 'package:pureair_v2/presentation/widgets/app_divider.dart';

class InfoSection extends StatelessWidget {
  final AirQuality airQuality;
  const InfoSection({super.key, required this.airQuality});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge;

    final color = getAirQualityColor(airQuality.aqi);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppDivider(indent: 16, endIndent: 16),
        Container(
          padding: const EdgeInsets.fromLTRB(18, 25, 18, 18),
          color: color.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Important Information',
                style: style?.copyWith(fontWeight: FontWeight.bold),
              ),
              10.verticalSpace,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PhosphorIcon(
                    PhosphorIcons.fill.shieldWarning,
                    color: airQualityColor[airQuality.aqi],
                    size: 20,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Text(
                      "Don't forget to always a nose mask when doing activities outside.",
                      style: style?.copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
