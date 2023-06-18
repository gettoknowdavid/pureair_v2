import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phosphor_flutter/src/phosphor_icons.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/domain/entities/air_quality/measurements.dart';
import 'package:pureair_v2/presentation/widgets/weather_widget.dart';

class WeatherSection extends StatelessWidget {
  final Measurements measurements;
  const WeatherSection(this.measurements, {super.key});

  @override
  Widget build(BuildContext context) {
    final humidity = measurements.humidity;
    final pressure = measurements.pressure;
    final temperature = measurements.temperature;
    final wind = measurements.wind;
    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherWidget(
            icon: PhosphorIcons.regular.thermometerSimple,
            label: "${temperature?.value}°C",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.drop,
            label: "${humidity?.value}%",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.gauge,
            label: "${pressure?.value}mb",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.wind,
            label: "${wind?.value}/s",
          ),
        ],
      ),
    );
  }
}
