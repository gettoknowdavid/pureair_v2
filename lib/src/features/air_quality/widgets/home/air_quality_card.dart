import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/router/routing.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AirQualityCard extends HookWidget {
  const AirQualityCard(
    this.airQuality, {
    this.isLoading = false,
    super.key,
    this.onLongPress,
  });

  final AirQuality airQuality;
  final bool isLoading;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).colorScheme.surface;

    final size = MediaQuery.sizeOf(context);
    final smallHeight = (size.height * 0.25) * 0.3;

    final showActions = useState<bool>(false);

    final city = airQuality.city;

    void onShowActions() {
      if (city.isLocal) return;
      showActions.value = true;
    }

    void onDelete() {
      context.read<CitiesBloc>().add(CitiesRemoveCityPressed(city));
      showActions.value = false;
    }

    return InkWell(
      onTap: () {
        final geo = airQuality.city.geo;
        if (geo != null) DetailsRoute(geo[0], geo[1]).push(context);
      },
      onLongPress: onShowActions,
      onDoubleTap: onShowActions,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PContainer(height: smallHeight, backgroundColor: backgroundColor),
          Skeletonizer(
            enabled: isLoading,
            child: PContainer(
              margin: const EdgeInsets.all(8),
              padding: kAllPadding24,
              backgroundColor: backgroundColor,
              child: Column(
                children: [
                  StationInfoWidget(airQuality, height: smallHeight),
                  const PDivider(height: 50),
                  WeatherInfoWidget(airQuality.iaqi),
                ],
              ),
            ),
          ),
          if (showActions.value)
            AirQualityCardActions(
              onCancel: () => showActions.value = false,
              onDelete: onDelete,
            ),
        ],
      ),
    );
  }
}
