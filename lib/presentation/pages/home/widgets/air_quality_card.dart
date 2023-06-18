import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../widgets/weather_widget.dart';

class AirQualityCard extends StatelessWidget {
  final AirQuality airQuality;
  final bool showDetail;
  final bool loading;

  const AirQualityCard({
    super.key,
    required this.airQuality,
    this.showDetail = false,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final smallContainerHeight = (size.height * 0.25) * 0.3;

    final colorScheme = Theme.of(context).colorScheme;

    final lat = airQuality.coordinates.lat!;
    final lon = airQuality.coordinates.lon!;

    return InkWell(
      onTap: showDetail
          ? null
          : () => context.router.push(DetailsRoute(airQuality: airQuality)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (!showDetail)
            AppContainer(
              loading: loading,
              height: smallContainerHeight,
              backgroundColor: colorScheme.background,
            ),
          AppContainer(
            loading: loading,
            margin: showDetail ? EdgeInsets.zero : const EdgeInsets.all(8),
            backgroundColor: colorScheme.background,
            child: Column(
              children: [
                18.verticalSpace,
                _TopSection(
                  loading: loading,
                  airQuality: airQuality,
                  height: smallContainerHeight,
                ),
                const AppDivider(height: 40, indent: 16, endIndent: 16),
                _BottomSection(lat, lon),
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
  final double lat;
  final double lon;
  const _BottomSection(this.lat, this.lon);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Weather>(
      future: context.read<WeatherCubit>().getWeather(lat: lat, lon: lon),
      builder: (context, snapshot) {
        final loading = !snapshot.hasData;
        final weather = snapshot.data?.current;
        return Padding(
          padding: kHorizontalPadding18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherWidget(
                loading: loading,
                icon: PhosphorIcons.regular.thermometerSimple,
                label: weather?.temp == null ? '' : "${weather?.temp}°C",
              ),
              WeatherWidget(
                loading: loading,
                icon: PhosphorIcons.regular.drop,
                label: "${weather?.pressure}%",
              ),
              WeatherWidget(
                loading: loading,
                icon: isDayLight
                    ? PhosphorIcons.regular.sun
                    : PhosphorIcons.regular.moon,
                label: isDayLight ? "Light" : "Dark",
              ),
              WeatherWidget(
                loading: loading,
                icon: PhosphorIcons.regular.wind,
                label: "${weather?.windSpeed}/s",
              ),
            ],
          ),
        );
      },
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
  final bool loading;
  const _TopSection({
    required this.airQuality,
    required this.height,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final aqi = airQuality.data[0]!.main!.aqi!;
    final color = getAirQualityColor(aqi);
    final textColor = getTextColor(color);
    final healthMessage = getHealthMessage(aqi);

    final lat = airQuality.coordinates.lat!;
    final lon = airQuality.coordinates.lon!;

    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer(
            loading: loading,
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
            child: FutureBuilder<Place>(
              future: context.read<LocationCubit>().getLocation(lat, lon),
              builder: (context, snapshot) {
                final loading =
                    snapshot.connectionState == ConnectionState.waiting;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer(
                      enabled: loading,
                      child: Text(
                        snapshot.data?.city ?? '',
                        style: textTheme.bodyLarge?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                    Shimmer(
                      enabled: loading,
                      child: Text(
                        '${snapshot.data?.state}, ${snapshot.data?.country}',
                        style: textTheme.bodySmall,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      healthMessage ?? '',
                      style: textTheme.bodyMedium?.copyWith(height: 1.1),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
