import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget({required this.iaqi, super.key});
  final IAQI iaqi;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ParameterWidget(
          icon: PhosphorIconsRegular.thermometerSimple,
          label: '${iaqi.temperature?.value}°C',
        ),
        ParameterWidget(
          icon: PhosphorIconsRegular.drop,
          label: '${iaqi.humidity?.value}%',
        ),
        ParameterWidget(
          icon: PhosphorIconsRegular.gauge,
          label: '${iaqi.pressure?.value}mb',
        ),
        ParameterWidget(
          icon: PhosphorIconsRegular.wind,
          label: '${iaqi.wind?.value}/s',
        ),
      ],
    );
  }
}
