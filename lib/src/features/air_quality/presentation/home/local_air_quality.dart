import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../common/common.dart';
import '../../../../router/router.dart';
import '../../application/air_quality_cubit/air_quality_cubit.dart';
import '../../domain/entities/entities.dart';
import '../../domain/errors/aq_failure.dart';
import 'air_quality_card.dart';

class LocalAirQuality extends HookWidget {
  const LocalAirQuality({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AirQualityCubit>();
    final airQuality = useState<AirQuality?>(null);

    return BlocConsumer<AirQualityCubit, AirQualityState>(
      bloc: bloc,
      buildWhen: (p, c) => p.localLoading != c.localLoading,
      listenWhen: (p, c) => p.localOption != c.localOption,
      listener: (context, state) {
        state.localOption.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureMessage(failure, context),
            (success) => airQuality.value = success,
          ),
        );
      },
      builder: (context, state) {
        if (bloc.state.localLoading || airQuality.value == null) {
          return const AirQualityCard(loading: true);
        }

        if (!bloc.state.localLoading && airQuality.value == null) {
          return const SizedBox();
        }

        return AirQualityCard(
          airQuality: airQuality.value,
          onTap: () => context.router.navigate(
            DetailsRoute(geo: airQuality.value?.city.geo, showActions: false),
          ),
        );
      },
    );
  }

  void _showFailureMessage(AQFailure failure, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(ErrorSnackbar(
      theme: Theme.of(context),
      content: SnackbarContent(failure.mapOrNull(message: (v) => v.message)),
    ));
  }
}
