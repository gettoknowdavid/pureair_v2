import 'package:flutter/material.dart';

import '../utils/utils.dart';

class HealthMessageWidget extends StatelessWidget {
  const HealthMessageWidget({super.key, required this.aqi});

  final int aqi;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final healthMessage = getHealthMessage(aqi);

    return Text(
      healthMessage ?? '',
      style: textTheme.bodyMedium?.copyWith(height: 1.1),
    );
  }
}
