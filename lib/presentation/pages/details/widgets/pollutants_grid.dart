import 'package:flutter/material.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';
import 'package:pureair_v2/presentation/pages/details/widgets/index.dart';
import 'package:pureair_v2/presentation/widgets/widgets.dart';

class PollutantsGrid extends StatelessWidget {
  final Measurements measurements;
  const PollutantsGrid({super.key, required this.measurements});

  @override
  Widget build(BuildContext context) {
    final dictionary = {
      "pm25": measurements.pm25?.value,
      "pm10": measurements.pm10?.value,
      "so2": measurements.so2?.value,
      "no2": measurements.no2?.value,
      "o3": measurements.o3?.value,
      "co": measurements.co?.value,
    };

    return AppContainer(
      padding: const EdgeInsets.symmetric(vertical: kGlobalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const DetailsSectionTitle(title: 'Pollutants'),
          const AppDivider(height: 40, indent: 16, endIndent: 10),
          Wrap(
            runSpacing: 16,
            children: dictionary.entries.map((e) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  final halfWidth = (constraints.maxWidth / 2);
                  final colorWidth = halfWidth * 0.15;
                  final valueWidth = halfWidth * 0.2;

                  return AppContainer(
                    height: 46,
                    thickness: 1,
                    width: halfWidth - (12 * 2),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        _Name(name: e.key, width: valueWidth),
                        const Spacer(),
                        _Color(name: e.key, width: colorWidth, value: e.value),
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
    );
  }
}

class _Color extends StatelessWidget {
  const _Color({
    required this.name,
    this.value,
    required this.width,
  });

  final String name;
  final double? value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: getColorForParameter(name, value),
        border: Border.all(
          color: Theme.of(context).colorScheme.onBackground,
          width: 0.5,
        ),
      ),
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({
    required this.name,
    required this.width,
  });

  final String name;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        name.toUpperCase(),
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

class _Value extends StatelessWidget {
  const _Value({
    this.value,
    required this.width,
  });

  final double? value;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Text(
        "${value ?? '-'}",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
