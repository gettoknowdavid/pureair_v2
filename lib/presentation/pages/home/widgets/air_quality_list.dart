import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/pages/home/widgets/air_quality_card.dart';
import 'package:pureair_v2/presentation/pages/loader.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class AirQualityList extends HookWidget {
  const AirQualityList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AirQualityCubit>();
    final cities = useState<List<AirQuality?>>([]);

    return BlocConsumer<AirQualityCubit, AirQualityState>(
      bloc: bloc,
      buildWhen: (p, c) =>
          p.citiesOption != c.citiesOption || p.loading != c.loading,
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
        if (bloc.state.loading) {
          return const Loader();
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
          itemBuilder: (context, index) {
            final airQuality = cities.value[index]!;
            return AirQualityCard(airQuality: airQuality);
          },
        );
      },
    );
  }

  void _showFailureMessage(AQError failure, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(AppSnackbar(
      theme: Theme.of(context),
      content: SnackbarContent(failure.mapOrNull(message: (v) => v.message)),
    ));
  }
}
