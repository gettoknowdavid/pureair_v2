import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DetailsTopSection extends StatelessWidget {
  const DetailsTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const PContainer(
      child: Column(
        children: [
          SizedBox(height: 24),
          Padding(padding: kHorizontalPadding24, child: _StationInfoWidget()),
          PDivider(height: 50, indent: 24, endIndent: 24),
          Padding(padding: kHorizontalPadding24, child: _WeatherInfoWidget()),
          SizedBox(height: 24),
          _DetailedMessageWidget(),
        ],
      ),
    );
  }
}

class _StationInfoWidget extends StatelessWidget {
  const _StationInfoWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        switch (state) {
          case DetailsLoadInProgress():
            return StationInfoWidget(fakeAirQuality, isLoading: true);
          case DetailsLoadFailure():
            return const SizedBox.shrink();
          case DetailsLoadSuccess(:final airQuality):
            return StationInfoWidget(airQuality);
        }
      },
    );
  }
}

class _WeatherInfoWidget extends StatelessWidget {
  const _WeatherInfoWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        switch (state) {
          case DetailsLoadInProgress():
            return const WeatherInfoWidget(fakeIAQI, isLoading: true);
          case DetailsLoadFailure():
            return const SizedBox.shrink();
          case DetailsLoadSuccess(:final airQuality):
            return WeatherInfoWidget(airQuality.iaqi);
        }
      },
    );
  }
}

class _DetailedMessageWidget extends StatelessWidget {
  const _DetailedMessageWidget();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        switch (state) {
          case DetailsLoadInProgress():
            return const DetailedMessageWidget(0, isLoading: true);
          case DetailsLoadFailure():
            return const SizedBox.shrink();
          case DetailsLoadSuccess(:final airQuality):
            return DetailedMessageWidget(airQuality.value);
        }
      },
    );
  }
}
