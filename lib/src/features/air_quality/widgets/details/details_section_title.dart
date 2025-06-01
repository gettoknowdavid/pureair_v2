import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';

class DetailsSectionTitle extends StatelessWidget {
  const DetailsSectionTitle({required this.title, super.key, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textTheme.bodyBold),
        if (subtitle != null) ...[
          const Spacer(),
          Text(subtitle!, style: textTheme.caption),
        ],
      ],
    );
  }
}
