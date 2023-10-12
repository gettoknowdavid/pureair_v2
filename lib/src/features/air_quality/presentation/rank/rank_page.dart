import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

import '../../application/rank_cubit/rank_cubit.dart';
import 'rank_filter_chip_list.dart';
import 'ranked_cities_list.dart';

@RoutePage()
class RankPage extends StatelessWidget {
  const RankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: context.read<RankCubit>().reload,
      child: const Column(
        children: [
          LimitedBox(maxHeight: 38, child: RankFilterChipList()),
          Expanded(child: RankedCitiesList()),
        ],
      ),
    );
  }
}
