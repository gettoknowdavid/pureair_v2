import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pureair_v2/config/config.dart';
import 'package:pureair_v2/domain/domain.dart';

import 'country_flag.dart';

class CityRankingTile extends StatelessWidget {
  final City city;
  const CityRankingTile({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final color = getAirQualityColor(city.aqi ?? 0);

    return ListTile(
      onTap: () => context.router.push(DetailsRoute(geo: city.geo)),
      leading: CountryFlag(city: city),
      title: Text(
        city.name,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: Container(
        height: 25,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1, color: colorScheme.onBackground),
        ),
        child: Text(
          city.aqi?.toString() ?? '-',
          textAlign: TextAlign.center,
          style: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: getTextColor(color),
          ),
        ),
      ),
      contentPadding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colorScheme.onBackground, width: 2),
      ),
    );
  }
}
