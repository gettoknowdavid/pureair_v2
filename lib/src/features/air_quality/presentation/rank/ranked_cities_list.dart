import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/constants/constants.dart'; 

import '../../../../common/common.dart';
import '../../application/rank_cubit/rank_cubit.dart';
import 'city_ranking_tile.dart';

class RankedCitiesList extends StatelessWidget {
  const RankedCitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankCubit, RankState>(
      bloc: context.watch<RankCubit>(),
      buildWhen: (p, c) => p.cities != c.cities,
      builder: (context, state) {
        if (state.loading) {
          return const Scaffold(body: Loading());
        }

        return ListView.separated(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (context, i) => 20.verticalSpace,
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
          itemCount: state.cities.length,
          itemBuilder: (context, i) {
            final city = state.cities[i]!;
            return CityRankingTile(city: city);
          },
        );
      },
    );
  }
}
