import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/application/rank_cubit/rank_cubit.dart';
import 'package:pureair_v2/constants/app_sizes.dart';

class RankFilterChipList extends StatelessWidget {
  const RankFilterChipList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final cubit = context.watch<RankCubit>();

    return BlocBuilder<RankCubit, RankState>(
      bloc: cubit,
      buildWhen: (p, c) => p.selectedFilter != c.selectedFilter,
      builder: (context, state) {
        return Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView.separated(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 8),
            itemCount: RankFilter.values.length,
            separatorBuilder: (context, i) => 14.horizontalSpace,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              final isSelected = state.selectedFilter == RankFilter.values[i];
              return OutlinedButton(
                onPressed: () => cubit.applyFilter(RankFilter.values[i]),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  backgroundColor: isSelected ? colorScheme.tertiary : null,
                  foregroundColor: isSelected ? colorScheme.onTertiary : null,
                  textStyle: textTheme.labelMedium,
                ),
                child: Text(RankFilter.values[i].toName()),
              );
            },
          ),
        );
      },
    );
  }
}
