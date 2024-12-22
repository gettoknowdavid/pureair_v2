import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class RankChips extends ConsumerWidget {
  const RankChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = PureAirTextTheme.of(context)!;

    final selectedRank = ref.watch(rankNotifierProvider);
    final notifier = ref.watch(rankNotifierProvider.notifier);
    const ranks = Rank.values;

    return ColoredBox(
      color: colors.surface,
      child: ListView.separated(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
        itemCount: Rank.values.length,
        separatorBuilder: (context, i) => const SizedBox(width: 14),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          final currentRank = ranks[i];
          final selected = selectedRank == currentRank;
          return FilterChip(
            selected: selected,
            onSelected: (_) => notifier.onChange(currentRank),
            selectedColor: colors.tertiary,
            label: Text(
              currentRank.name,
              style: textTheme.captionBold?.copyWith(
                color: selected ? colors.onTertiary : colors.onSurface,
              ),
            ),
          );
        },
      ),
    );
  }
}
