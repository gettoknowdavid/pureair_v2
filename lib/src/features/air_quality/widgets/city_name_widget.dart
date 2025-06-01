import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart' show City;

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({required this.city, super.key});
  final City city;

  @override
  Widget build(BuildContext context) {
    return Text(
      city.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: PureAirTextTheme.of(context)?.bodyBold,
    );
  }
}
