import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RankingsList extends ConsumerWidget {
  const RankingsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(rankingsNotifierProvider);
    return state.when(
      data: (stations) => _RankingsView(stations: stations),
      error: (error, _) => Text(error.toString()),
      loading: () => Skeletonizer(child: _RankingsView(stations: fakeStations)),
    );
  }
}

class _RankingsView extends StatelessWidget {
  const _RankingsView({required this.stations});
  final List<Station> stations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: stations.length,
      padding: kHorizontalPadding24,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, i) => RankingTile(station: stations[i]),
    );
  }
}
