import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RankingTile extends ConsumerWidget {
  const RankingTile({required this.station, super.key});
  final Station station;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = PureAirTextTheme.of(context)!;

    final aqi = int.tryParse(station.aqi) ?? 0;
    final color = getAirQualityColor(aqi);
    final city = station.city;
    final geo = [station.lat, station.lon];

    return ListTile(
      onTap: () {
        ref.read(detailsNotifierProvider.notifier).initWithGeo(geo);
        context.push(R.details, extra: true);
      },
      leading: CountryFlag(city: city),
      title: Text(
        city.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyBold,
      ),
      trailing: Skeleton.leaf(
        child: Container(
          height: 25,
          width: 45,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(width: 2, color: colors.onSurface),
          ),
          child: Text(
            station.aqi,
            textAlign: TextAlign.center,
            style: textTheme.captionBold?.copyWith(color: color.textColor),
          ),
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors.onSurface, width: 2),
      ),
    );
  }
}
