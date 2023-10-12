import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  final double? width;
  final EdgeInsetsGeometry? margin;

  const ShimmerWidget(
    this.height, {
    super.key,
    this.width,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      child: Container(
        height: height,
        width: width,
        margin: margin,
        color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
      ),
    );
  }
}
