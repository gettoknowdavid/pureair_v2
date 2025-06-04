import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class CitiesWidget extends StatelessWidget {
  const CitiesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitiesBloc, CitiesState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        switch (state) {
          case CitiesInitial():
            return const SizedBox.shrink();
          case CitiesLoadInProgress():
            return _CitiesView(fakeCities, isLoading: true);
          case CitiesLoadFailure(:final exception):
            return Text(exception.message);
          case CitiesLoadSuccess(:final cities):
            return _CitiesView(cities);
        }
      },
    );
  }
}

class _CitiesView extends StatelessWidget {
  const _CitiesView(this.cities, {this.isLoading = false});
  final List<AirQuality?> cities;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) return AirQualityCard(fakeAirQuality, isLoading: true);

    if (cities.isEmpty) return const SizedBox();

    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemCount: cities.length,
      separatorBuilder: (context, index) => const SizedBox(height: 24),
      itemBuilder: (context, i) => AirQualityCard(cities[i]!),
    );
  }
}
