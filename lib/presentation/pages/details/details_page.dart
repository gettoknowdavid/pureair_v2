import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'widgets/details_chart_section.dart';
import 'widgets/forecast_widget.dart';

@RoutePage(deferredLoading: true)
class DetailsPage extends StatelessWidget {
  final AirQuality airQuality;
  const DetailsPage({super.key, required this.airQuality});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final size = MediaQuery.of(context).size;
    final smallContainerHeight = (size.height * 0.25) * 0.3;

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text('Detail'),
      ),
      body: SingleChildScrollView(
        padding: kHorizontalPadding18,
        child: Column(
          children: [
            10.verticalSpace,
            AppContainer(
              backgroundColor: colorScheme.background,
              child: Column(
                children: [
                  18.verticalSpace,
                  _TopSection(
                    airQuality: airQuality,
                    height: smallContainerHeight,
                  ),
                  const AppDivider(height: 40, indent: 16, endIndent: 16),
                  WeatherSection(airQuality.measurements),
                  20.verticalSpace,
                  _InfoSection(airQuality: airQuality),
                ],
              ),
            ),
            20.verticalSpace,
            ForecastWidget(forecast: airQuality.forecast),
            20.verticalSpace,
            const DetailsChartSection(),
            50.verticalSpace,
          ],
        ),
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

class _InfoSection extends StatelessWidget {
  final AirQuality airQuality;
  const _InfoSection({required this.airQuality});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge;

    final color = getAirQualityColor(airQuality.aqi);
    final details = getDetailedHealthMessage(airQuality.aqi);

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
                    child: Text(details, style: style?.copyWith(fontSize: 13)),
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
