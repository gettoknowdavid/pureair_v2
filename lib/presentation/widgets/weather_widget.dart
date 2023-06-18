import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/app_sizes.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

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
    final textTheme = Theme.of(context).textTheme;

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer(enabled: loading, colorOpacity: 1, child: Icon(icon)),
          10.verticalSpace,
          Shimmer(
            enabled: loading,
            colorOpacity: 1,
            child: loading
                ? SizedBox(height: textTheme.labelMedium?.height)
                : Text(
                    label!,
                    style: textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
