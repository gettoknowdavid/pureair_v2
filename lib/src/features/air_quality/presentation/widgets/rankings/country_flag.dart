import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/air_quality/application/rankings_notifier.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CountryFlag extends ConsumerWidget {
  const CountryFlag({required this.geo, super.key});
  final List<double>? geo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const icon = PContainer(
      height: 40,
      width: 50,
      child: Icon(PhosphorIconsRegular.flag),
    );

    final skeleton = Skeletonizer(
      child: Container(
        height: 40,
        width: 50,
        color: Theme.of(context).colorScheme.surface,
      ),
    );

    final stations = ref.watch(stationsProvider);
    return stations.maybeWhen(
      loading: () => skeleton,
      orElse: () => icon,
      data: (_) {
        final flag = ref.watch(countryFlagProvider(geo!));
        return flag.maybeWhen(
          data: (data) => PContainer(height: 40, width: 50, child: data),
          loading: () => skeleton,
          orElse: () => icon,
        );
      },
    );
  }
}
