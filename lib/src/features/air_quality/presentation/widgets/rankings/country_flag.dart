import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/air_quality/air_quality.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class CountryFlag extends StatelessWidget {
  const CountryFlag({required this.city, super.key});
  final City city;

  @override
  Widget build(BuildContext context) {
    return const PContainer(
      height: 40,
      width: 50,
      child: Icon(PhosphorIconsRegular.flag),
    );
  }
}
