import 'package:flutter/material.dart';
import 'package:pureair_v2/src/constants/constants.dart'; 

import 'shimmer_widget.dart';

class WeatherWidget extends StatelessWidget {
  final IconData icon;
  final String? label;
  final bool loading;

  const WeatherWidget({
    super.key,
    required this.icon,
    this.label,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.bold,
        );

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          loading ? const ShimmerWidget(24, width: 22) : Icon(icon),
          10.verticalSpace,
          loading
              ? const ShimmerWidget(14, width: 40)
              : Text(label!, style: style)
        ],
      ),
    );
  }
}
