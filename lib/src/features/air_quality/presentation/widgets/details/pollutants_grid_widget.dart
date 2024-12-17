import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PollutantsGridWidget extends ConsumerWidget {
  const PollutantsGridWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(detailsNotifierProvider);
    return state.when(
      data: (airQuality) => _PollutantsGridView(iaqi: airQuality!.iaqi),
      error: (error, stackTrace) => const SizedBox(),
      loading: () => const _PollutantsGridView(iaqi: fakeIAQI, loading: true),
    );
  }
}

class _PollutantsGridView extends StatelessWidget {
  const _PollutantsGridView({required this.iaqi, this.loading = false});
  final IAQI iaqi;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final dictionary = {
      'pm25': iaqi.pm25?.value,
      'pm10': iaqi.pm10?.value,
      'so2': iaqi.so2?.value,
      'no2': iaqi.no2?.value,
      'o3': iaqi.o3?.value,
      'co': iaqi.co?.value,
    };
    final pollutants = dictionary.entries
        .where((pollutant) => pollutant.value != null)
        .toList();

    return Skeletonizer(
      enabled: loading,
      child: PContainer(
        padding: const EdgeInsets.all(kGlobalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const DetailsSectionTitle(title: 'Pollutants'),
            const PDivider(height: 50),
            Wrap(
              runSpacing: 16,
              spacing: 24,
              children: pollutants.map((e) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    final halfWidth = constraints.maxWidth / 2;
                    final colorWidth = halfWidth * 0.15;
                    final valueWidth = halfWidth * 0.2;

                    return PContainer(
                      height: 46,
                      width: halfWidth - 12,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Spacer(),
                          _Name(name: e.key, width: valueWidth),
                          const Spacer(),
                          _Color(
                            name: e.key,
                            width: colorWidth,
                            value: e.value,
                          ),
                          const Spacer(),
                          _Value(value: e.value, width: valueWidth),
                          const Spacer(),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _Color extends StatelessWidget {
  const _Color({required this.name, required this.width, this.value});
  final String name;
  final num? value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: getParameterColor(name, value),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: 0.5,
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({required this.name, required this.width});
  final String name;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: PureAirTextTheme.of(context)?.caption,
      ),
    );
  }
}

class _Value extends StatelessWidget {
  const _Value({required this.width, this.value});
  final num? value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        "${value ?? '-'}",
        textAlign: TextAlign.center,
        style: PureAirTextTheme.of(context)?.caption,
      ),
    );
  }
}
