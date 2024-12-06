import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class HealthMessageWidget extends StatelessWidget {
  const HealthMessageWidget({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final healthMessage = getHealthMessage(index);
    return Text(
      healthMessage,
      style: PureAirTextTheme.of(context)?.caption,
    );
  }
}
