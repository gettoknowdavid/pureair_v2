import 'package:flutter/material.dart';
import 'package:pureair_v2/domain/entities/air_quality/city.dart';

class CityName extends StatelessWidget {
  const CityName({super.key, required this.city});

  final City city;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      city.name,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: textTheme.bodyLarge?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        height: 1.1,
      ),
    );
  }
}
