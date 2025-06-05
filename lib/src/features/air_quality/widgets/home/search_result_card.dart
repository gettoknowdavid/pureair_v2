import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/router/routing.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({required this.data, super.key});
  final SearchData data;

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;
    final aqi = int.tryParse(data.aqi) ?? 0;
    final station = data.station;
    final backgroundColor = getAirQualityColor(aqi);
    final foregroundColor = backgroundColor.textColor;
    return InkWell(
      onTap: () {
        final geo = station.geo;
        if (geo != null) DetailsRoute(geo.lat, geo.lon).push(context);
      },
      child: PContainer(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: Row(
          children: [
            Skeleton.leaf(
              child: PContainer(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                backgroundColor: backgroundColor,
                child: Text(
                  data.aqi,
                  style: textTheme.titleBold?.copyWith(color: foregroundColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                spacing: 4,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    station.name,
                    style: textTheme.bodyBold,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    station.country ?? '',
                    style: textTheme.caption,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            const Icon(PhosphorIconsBold.caretRight, size: 18),
          ],
        ),
      ),
    );
  }
}
