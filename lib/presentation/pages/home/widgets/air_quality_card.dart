import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class AirQualityCard extends StatelessWidget {
  final AirQuality airQuality;
  final bool loading;

  const AirQualityCard({
    super.key,
    required this.airQuality,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final smallContainerHeight = (size.height * 0.25) * 0.3;

    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => context.router.push(DetailsRoute(airQuality: airQuality)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppContainer(
            loading: loading,
            height: smallContainerHeight,
            backgroundColor: colorScheme.background,
          ),
          AppContainer(
            loading: loading,
            margin: const EdgeInsets.all(8),
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
              ],
            ),
          ),
          if (airQuality.city.isLocal == false)
            Positioned(
              top: 8,
              right: 8,
              child: InkWell(
                onTap: () {
                  context.read<AirQualityCubit>().removeCity(airQuality.city);
                },
                child: AppContainer(
                  height: 30,
                  width: 30,
                  backgroundColor: Colors.red,
                  child: Icon(PhosphorIcons.bold.trash, size: 20),
                ),
              ),
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
