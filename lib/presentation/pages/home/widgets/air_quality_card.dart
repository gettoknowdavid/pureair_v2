import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'weather_widget.dart';

class AirQualityCard extends StatelessWidget {
  final AirQuality airQuality;
  final void Function()? onTap;
  final bool showDetail;

  const AirQualityCard({
    super.key,
    required this.airQuality,
    this.onTap,
    this.showDetail = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final smallContainerHeight = (size.height * 0.25) * 0.3;

    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (!showDetail)
            AppContainer(
              height: smallContainerHeight,
              backgroundColor: colorScheme.background,
            ),
          AppContainer(
            margin: showDetail ? EdgeInsets.zero : const EdgeInsets.all(8),
            backgroundColor: colorScheme.background,
            child: Column(
              children: [
                18.verticalSpace,
                _TopSection(
                  airQuality: airQuality,
                  height: smallContainerHeight,
                ),
                const AppDivider(height: 40, indent: 16, endIndent: 16),
                _BottomSection(airQuality: airQuality),
                20.verticalSpace,
                if (showDetail) _buildInfoSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppDivider(indent: 16, endIndent: 16),
        _InfoSection(airQuality: airQuality),
      ],
    );
  }
}

class _BottomSection extends StatelessWidget {
  final AirQuality airQuality;
  const _BottomSection({required this.airQuality});

  @override
  Widget build(BuildContext context) {
    const weather = '20';

    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherWidget(
            icon: PhosphorIcons.regular.thermometerSimple,
            label: "$weather°C",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.drop,
            label: "$weather%",
          ),
          WeatherWidget(
            icon: isDayLight
                ? PhosphorIcons.regular.sun
                : PhosphorIcons.regular.moon,
            label: isDayLight ? "Light" : "Dark",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.wind,
            label: "$weather/s",
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final AirQuality airQuality;
  const _InfoSection({required this.airQuality});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge;

    final aqi = airQuality.data[0]!.main!.aqi!;
    final color = getAirQualityColor(aqi);
    final details = getDetailedHealthMessage(aqi);

    return Container(
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
                color: airQualityColor[aqi],
                size: 20,
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(details, style: style?.copyWith(fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  final AirQuality airQuality;
  final double height;
  const _TopSection({required this.airQuality, required this.height});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final aqi = airQuality.data[0]!.main!.aqi!;
    final color = getAirQualityColor(aqi);
    final textColor = getTextColor(color);
    final healthMessage = getHealthMessage(aqi);

    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer(
            height: height,
            width: height,
            backgroundColor: color,
            alignment: Alignment.center,
            child: Text(
              '$aqi',
              style: textTheme.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ),
          16.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'City',
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                ),
                Text(
                  'State, Country',
                  style: textTheme.bodySmall,
                ),
                4.verticalSpace,
                Text(
                  healthMessage ?? '',
                  style: textTheme.bodyMedium?.copyWith(height: 1.1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
