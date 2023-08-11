import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/constants/constants.dart';
import 'package:pureair_v2/domain/domain.dart';

import 'app_container.dart';

class SearchResultCard extends StatelessWidget {
  final SearchData data;
  const SearchResultCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final aqi = int.tryParse(data.aqi) ?? 0;

    final backgroundColor = getAirQualityColor(aqi);
    final foregroundColor = getTextColor(backgroundColor);

    return InkWell(
      onTap: () => context.router.push(DetailsRoute(geo: data.station.geo)),
      child: AppContainer(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
        child: Row(
          children: [
            AppContainer(
              height: 50,
              width: 50,
              thickness: 2,
              alignment: Alignment.center,
              backgroundColor: backgroundColor,
              child: Text(
                data.aqi,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: foregroundColor,
                ),
              ),
            ),
            10.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.station.name,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  4.verticalSpace,
                  Text(data.station.country ?? '', style: textTheme.bodySmall),
                ],
              ),
            ),
            PhosphorIcon(PhosphorIcons.regular.caretRight, size: 18),
          ],
        ),
      ),
    );
  }
}
