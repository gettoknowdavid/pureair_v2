import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class DetailedMessageWidget extends StatelessWidget {
  const DetailedMessageWidget({required this.index, super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context);
    final color = getAirQualityColor(index);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const PDivider(indent: 24, endIndent: 24),
        Container(
          padding: kAllPadding24,
          color: color.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Important Information', style: textTheme?.bodyBold),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    PhosphorIconsFill.shieldWarning,
                    color: color,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '''Don't forget to always a nose mask when doing activities outside.''',
                      style: textTheme?.caption,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
