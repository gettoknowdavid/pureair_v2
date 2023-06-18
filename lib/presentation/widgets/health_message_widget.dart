import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:pureair_v2/config/helpers/air_quality_helper.dart';

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
