// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:pureair_v2/src/core/core.dart';
// import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
// import 'package:skeletonizer/skeletonizer.dart';

// class RankingsList extends StatelessWidget {
//   const RankingsList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final stationsState = ref.watch(stationsProvider);
//     return stationsState.when(
//       data: (_) => _RankingsView(cities: ref.watch(rankingsProvider)),
//       error: (error, _) => Text(error.toString()),
//       loading: () => Skeletonizer(child: _RankingsView(cities: fakeStations)),
//     );
//   }
// }

// class _RankingsView extends StatelessWidget {
//   const _RankingsView({required this.cities});
//   final List<City> cities;

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       shrinkWrap: true,
//       primary: false,
//       itemCount: cities.length,
//       padding: const EdgeInsets.all(24),
//       separatorBuilder: (context, index) => const SizedBox(height: 24),
//       itemBuilder: (context, i) => RankingTile(city: cities[i]),
//     );
//   }
// }
