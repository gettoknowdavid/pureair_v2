import 'dart:ui';
import 'package:flutter/src/material/theme.dart';
import 'package:flutter/src/rendering/box.dart';
import 'package:flutter/src/rendering/flex.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/icon.dart';
import 'package:flutter/src/widgets/icon_data.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:pureair_v2/constants/app_sizes.dart';

class WeatherWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const WeatherWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          10.verticalSpace,
          Text(
            label,
            style: textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
