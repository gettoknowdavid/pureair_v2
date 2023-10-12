import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';
import '../../../../router/router.dart';
import '../../application/air_quality_cubit/air_quality_cubit.dart';
import '../../domain/entities/entities.dart';
import '../../domain/errors/aq_failure.dart';
import 'air_quality_card.dart';
import 'air_quality_card_skeleton.dart';

class AirQualityList extends HookWidget {
  const AirQualityList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AirQualityCubit>();
    final cities = useState<List<AirQuality?>>([]);

    return BlocConsumer<AirQualityCubit, AirQualityState>(
      bloc: bloc,
      buildWhen: (p, c) => p.citiesLoading != c.citiesLoading,
      listenWhen: (p, c) => p.citiesOption != c.citiesOption,
      listener: (context, state) {
        state.citiesOption.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureMessage(failure, context),
            (success) => cities.value = success,
          ),
        );
      },
      builder: (context, state) {
        if (bloc.state.citiesLoading) {
          return const _Skeleton();
        }

        if (cities.value.isEmpty) {
          return const SizedBox();
        }

        final length = cities.value.length;

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: length,
          separatorBuilder: (context, index) => 20.verticalSpace,
          itemBuilder: (context, i) => AirQualityCard(
            airQuality: cities.value[i]!,
            onTap: () => context.router.navigate(
              DetailsRoute(geo: cities.value[i]!.city.geo, showActions: false),
            ),
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

class _Skeleton extends StatelessWidget {
  const _Skeleton();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: 2,
      separatorBuilder: (context, index) => 20.verticalSpace,
      itemBuilder: (context, index) => const AirQualityCardSkeleton(),
    );
  }
}
