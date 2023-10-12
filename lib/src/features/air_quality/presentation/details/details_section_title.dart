import 'package:flutter/material.dart';
import 'package:pureair_v2/src/constants/constants.dart';

import '../../../../common/common.dart';


class DetailsSectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool loading;
  const DetailsSectionTitle({
    super.key,
    required this.title,
    this.subtitle,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kHorizontalPadding18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          loading
              ? const ShimmerWidget(16, width: 150)
              : Text(
                  title,
                  style: textTheme.bodyLarge?.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          if (subtitle != null) ...[
            const Spacer(),
            loading
                ? const ShimmerWidget(13, width: 60)
                : Text(subtitle!, style: textTheme.bodySmall),
          ]
        ],
      ),
    );
  }
}
