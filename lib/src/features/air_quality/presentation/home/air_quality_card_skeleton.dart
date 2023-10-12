import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../../../constants/constants.dart';

class AirQualityCardSkeleton extends StatelessWidget {
  const AirQualityCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = (size.height * 0.25) * 0.3;

    final colorScheme = Theme.of(context).colorScheme;
    const loading = true;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AppContainer(
          loading: loading,
          height: height,
          backgroundColor: colorScheme.background,
        ),
        AppContainer(
          loading: loading,
          height: 180,
          margin: const EdgeInsets.all(8),
          backgroundColor: colorScheme.background,
          alignment: Alignment.topLeft,
          child: AppContainer(
            height: height,
            width: height,
            loading: loading,
            margin: const EdgeInsets.all(kGlobalPadding),
          ),
        ),
      ],
    );
  }
}
