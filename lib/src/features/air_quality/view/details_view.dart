import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/router/routing.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({required this.geo, super.key});
  final Geo geo;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DetailsCubit(
        repository: ctx.read<AirQualityRepository>(),
        geo: geo,
      ),
      child: const DetailsViewWidget(),
    );
  }
}

class DetailsViewWidget extends HookWidget {
  const DetailsViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read<DetailsCubit>().initialize();
      return null;
    }, const []);

    final localizedCity = context.select(
      (LocalizedBloc b) => switch (b.state) {
        LocalizedLoadSuccess(:final airQuality) => airQuality.city,
        _ => null,
      },
    );

    final city = context.select(
      (DetailsCubit b) => switch (b.state) {
        DetailsLoadSuccess(:final airQuality) => airQuality.city,
        _ => null,
      },
    );

    final isLocalized = localizedCity?.geo == city?.geo;
    final isAlreadySaved = context.watch<CitiesBloc>().isAlreadySaved(city);
    final shouldShowAddButton = !isAlreadySaved && !isLocalized;

    return Scaffold(
      appBar: AppBar(
        leading: const PBackButton(),
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          if (shouldShowAddButton) const DetailsAddCityButton(),
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
      builder: (ctx, state) {
        switch (state) {
          case DetailsLoadFailure():
          case DetailsLoadInProgress():
            return const AddCityButton(onPressed: null);
          case DetailsLoadSuccess(:final airQuality):
            return AddCityButton(
              onPressed: () {
                ctx.read<CitiesBloc>().add(CitiesAddCityPressed(airQuality));
                const HomeRoute().go(ctx);
              },
            );
        }
      },
    );
  }
}
