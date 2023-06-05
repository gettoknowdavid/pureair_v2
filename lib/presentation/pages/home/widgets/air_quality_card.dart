import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/presentation/widgets/app_divider.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class AirQualityCard extends StatelessWidget {
  final void Function()? onTap;
  final bool showDetail;
  const AirQualityCard({super.key, this.onTap, this.showDetail = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightPercentage = showDetail ? 0.371 : 0.25;
    final outerContainerHeight = size.height * heightPercentage;
    final smallContainerHeight = (size.height * 0.25) * 0.3;

    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: outerContainerHeight,
        width: double.infinity,
        child: Stack(
          children: [
            if (!showDetail)
              _buildBackContainer(smallContainerHeight, colorScheme.background),
            Hero(
              tag: AppKeys.airQualityCard,
              child: AppContainer(
                height: outerContainerHeight,
                margin: showDetail ? EdgeInsets.zero : const EdgeInsets.all(8),
                backgroundColor: colorScheme.background,
                child: Column(
                  children: [
                    16.verticalSpace,
                    _TopSection(height: smallContainerHeight),
                    const AppDivider(height: 40, indent: 16, endIndent: 16),
                    const _BottomSection(),
                    if (showDetail) ...[
                      20.verticalSpace,
                      const AppDivider(indent: 16, endIndent: 16),
                      const Expanded(child: _InfoSection()),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _buildBackContainer(double height, Color backgroundColor) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AppContainer(height: height, backgroundColor: backgroundColor),
    );
  }
}

class WeatherWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const WeatherWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          10.verticalSpace,
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherWidget(
            icon: PhosphorIcons.regular.thermometerSimple,
            label: "24°C",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.drop,
            label: "57%",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.sun,
            label: "Light",
          ),
          WeatherWidget(
            icon: PhosphorIcons.regular.wind,
            label: "13km/h",
          ),
        ],
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  const _InfoSection();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelLarge;
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 25, 18, 18),
      color: const Color(0xffe0f5f5),
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
                color: Colors.green,
                size: 20,
              ),
              10.horizontalSpace,
              Expanded(
                child: Text(
                  "Don't forget to always wear a face mask when doing activities outside.",
                  style: style?.copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopSection extends StatelessWidget {
  final double height;
  const _TopSection({required this.height});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppContainer(
            height: height,
            width: height,
            backgroundColor: Colors.green,
            alignment: Alignment.center,
            child: Text(
              '500',
              style: textTheme.titleLarge?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          16.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Port Harcourt',
                style: textTheme.bodyLarge?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Today's air quality is good.",
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
