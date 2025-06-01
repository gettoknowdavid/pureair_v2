import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({required this.showAddButton, super.key});
  final bool showAddButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const PBackButton(),
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          if (showAddButton) const DetailsAddCityButton(),
          const SizedBox(width: 18),
        ],
      ),
      body: const SingleChildScrollView(
        padding: kHorizontalPadding24,
        child: Column(
          children: [
            SizedBox(height: 10),
            DetailsTopSection(),
            SizedBox(height: 24),
            HealthRecommendationWidget(),
            SizedBox(height: 24),
            PollutantsGridWidget(),
            SizedBox(height: 24),
            ForecastWidget(),
            SizedBox(height: 24),
            DetailsChartWidget(),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class DetailsAddCityButton extends StatelessWidget {
  const DetailsAddCityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        switch (state) {
          case DetailsLoadFailure():
          case DetailsLoadInProgress():
            return const AddCityButton(onPressed: null);
          case DetailsLoadSuccess(:final airQuality):
            return AddCityButton(
              onPressed: () {
                final city = airQuality.city;
                context.read<CitiesBloc>().add(CitiesAddCityPressed(city));
                context.go(R.home);
              },
            );
        }
      },
    );
  }
}
