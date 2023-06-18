import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/air_quality_bloc/air_quality_bloc.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:pureair_v2/presentation/pages/home/widgets/air_quality_card.dart';
import 'package:pureair_v2/presentation/pages/loader.dart';

class AirQualityList extends StatelessWidget {
  const AirQualityList({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AirQualityBloc>();
    return BlocBuilder<AirQualityBloc, AirQualityState>(
      bloc: bloc,
      buildWhen: (p, c) => p.airQualityList != c.airQualityList,
      builder: (context, state) {
        if (bloc.state.currentAQIOption.isNone() && bloc.state.loading) {
          return const Loader();
        }

        if (bloc.state.airQualityList.isEmpty) {
          return const SizedBox();
        }

        final length = bloc.state.airQualityList.length;

        return ListView.separated(
          shrinkWrap: true,
          primary: false,
          itemCount: length,
          separatorBuilder: (context, index) => 20.verticalSpace,
          itemBuilder: (context, index) {
            final airQuality = bloc.state.airQualityList[index]!;
            return AirQualityCard(airQuality: airQuality);
          },
        );
      },
    );
  }
}
