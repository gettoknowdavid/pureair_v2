import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/app_sizes.dart';

class DetailsSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const DetailsSectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const Spacer(),
            Text(subtitle!, style: textTheme.bodySmall),
          ]
        ],
      ),
    );
  }
}
