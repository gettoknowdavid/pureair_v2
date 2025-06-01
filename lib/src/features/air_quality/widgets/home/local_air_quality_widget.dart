import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureair_v2/src/core/constants/constants.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';

class LocalAirQualityWidget extends StatelessWidget {
  const LocalAirQualityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizedBloc, LocalizedState>(
      builder: (context, state) {
        switch (state) {
          case LocalizedInitial():
            return const SizedBox.shrink();
          case LocalizedLoadInProgress():
            return AirQualityCard(fakeAirQuality, isLoading: true);
          case LocalizedLoadSuccess(:final airQuality):
            return AirQualityCard(airQuality);
          case LocalizedLoadFailure(:final exception):
            return Center(child: Text(exception.message));
        }
      },
    );
  }
}
