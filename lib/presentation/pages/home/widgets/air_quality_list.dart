import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/application.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/presentation/pages/home/widgets/air_quality_card.dart';
import 'package:pureair_v2/presentation/pages/loader.dart';

class AirQualityList extends StatelessWidget {
  const AirQualityList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AirQualityCubit>();
    return BlocBuilder<AirQualityCubit, AirQualityState>(
      bloc: bloc,
      buildWhen: (p, c) => p.cities != c.cities,
      builder: (context, state) {
        if (bloc.state.cities.isEmpty && bloc.state.loading) {
          return const Loader();
        }

        if (bloc.state.cities.isEmpty) {
          return const SizedBox();
        }

        final length = bloc.state.cities.length;

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: length,
          separatorBuilder: (context, index) => 20.verticalSpace,
          itemBuilder: (context, index) {
            final airQuality = bloc.state.cities[index]!;
            return AirQualityCard(airQuality: airQuality);
          },
        );
      },
    );
  }
}
