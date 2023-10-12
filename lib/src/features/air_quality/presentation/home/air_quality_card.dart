import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';
import '../../application/air_quality_cubit/air_quality_cubit.dart';
import '../../domain/entities/entities.dart';
import 'air_quality_card_actions.dart';
import 'air_quality_card_city_name.dart';
import 'air_quality_card_skeleton.dart';

class AirQualityCard extends HookWidget {
  final AirQuality? airQuality;
  final bool loading;
  final void Function()? onTap;

  const AirQualityCard({
    super.key,
    this.airQuality,
    this.loading = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final size = MediaQuery.sizeOf(context);
    final smallContainerHeight = (size.height * 0.25) * 0.3;

    final showActions = useState<bool>(false);

    if (airQuality == null || loading) {
      return const AirQualityCardSkeleton();
    }

    void onShowActions() {
      if (airQuality?.city.isLocal == false) {
        showActions.value = true;
      }
    }

    void onCancel() => showActions.value = false;

    void onDelete() {
      context.read<AirQualityCubit>().removeCity(airQuality!.city);
    }

    return InkWell(
      onTap: onTap,
      onLongPress: onShowActions,
      onDoubleTap: onShowActions,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppContainer(
            height: smallContainerHeight,
            backgroundColor: colorScheme.background,
          ),
          AppContainer(
            margin: const EdgeInsets.all(8),
            backgroundColor: colorScheme.background,
            child: Column(
              children: [
                18.verticalSpace,
                AirQualityCardCityName(
                  airQuality: airQuality!,
                  height: smallContainerHeight,
                ),
                const AppDivider(height: 40, indent: 16, endIndent: 16),
                WeatherSection(measurements: airQuality?.measurements),
                20.verticalSpace,
              ],
            ),
          ),
          if (showActions.value)
            AirQualityCardActions(onCancel: onCancel, onDelete: onDelete),
        ],
      ),
    );
  }
}
