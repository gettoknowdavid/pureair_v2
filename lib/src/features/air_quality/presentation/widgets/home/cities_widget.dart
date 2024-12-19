import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class CitiesWidget extends ConsumerWidget {
  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(citiesNotifierProvider);
    return state.when(
      data: (cities) => _CitiesView(cities: cities),
      error: (error, _) => Text(error.toString()),
      loading: () => _CitiesView(cities: fakeCities, loading: true),
    );
  }
}

class _CitiesView extends StatelessWidget {
  const _CitiesView({required this.cities, this.loading = false});
  final List<AirQuality?> cities;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return AirQualityCard(airQuality: fakeAirQuality, loading: true);
    }

    if (cities.isEmpty) return const SizedBox();

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: cities.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, i) => AirQualityCard(airQuality: cities[i]!),
    );
  }
}
