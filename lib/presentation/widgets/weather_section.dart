import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/domain/entities/air_quality/measurements.dart';
import 'package:pureair_v2/presentation/widgets/weather_widget.dart';

class WeatherSection extends StatelessWidget {
  final Measurements? measurements;
  final bool loading;
  const WeatherSection({super.key, this.measurements, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherWidget(
            icon: PhosphorIcons.regular.thermometerSimple,
            label: "${measurements?.temperature?.value}°C",
            loading: loading,
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.drop,
            label: "${measurements?.humidity?.value}%",
            loading: loading,
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.gauge,
            label: "${measurements?.pressure?.value}mb",
            loading: loading,
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.wind,
            label: "${measurements?.wind?.value}/s",
            loading: loading,
          ),
        ],
      ),
    );
  }
}
