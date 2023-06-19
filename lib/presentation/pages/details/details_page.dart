import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

import 'health_recommendation.dart';
import 'info_section.dart';
import 'pollutants_grid.dart';
import 'station_details.dart';
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
                  StationDetails(
                    airQuality: airQuality,
                    height: smallContainerHeight,
                  ),
                  const AppDivider(height: 40, indent: 16, endIndent: 16),
                  WeatherSection(airQuality.measurements),
                  20.verticalSpace,
                  InfoSection(airQuality: airQuality),
                ],
              ),
            ),
            20.verticalSpace,
            HealthRecommendation(aqi: airQuality.aqi),
            20.verticalSpace,
            PollutantsGrid(measurements: airQuality.measurements),
            20.verticalSpace,
            ForecastWidget(forecast: airQuality.forecast),
            20.verticalSpace,
            DetailsChartSection(airQuality: airQuality),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }
}
