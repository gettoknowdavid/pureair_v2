import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/shared/shared.dart';
import 'package:skeletonizer/skeletonizer.dart';

/// Widget that displays the air quality index (AQI) value
class IndexWidget extends StatelessWidget {
  const IndexWidget({
    required this.index,
    required this.height,
    super.key,
  });

  final int index;
  final double height;

  @override
  Widget build(BuildContext context) {
    final indexColor = getAirQualityColor(index);

    final textTheme = PureAirTextTheme.of(context)!;
    final style = textTheme.titleBold?.copyWith(color: indexColor.textColor);

    return Skeleton.leaf(
      child: PContainer(
        height: height,
        width: height,
        backgroundColor: indexColor,
        alignment: Alignment.center,
        child: Text('$index', style: style),
      ),
    );
  }
}
