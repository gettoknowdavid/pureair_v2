import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

class WeatherInfoWidget extends StatelessWidget {
  const WeatherInfoWidget(this.iaqi, {this.isLoading = false, super.key});
  final IAqi iaqi;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Row(
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
      ),
    );
  }
}
