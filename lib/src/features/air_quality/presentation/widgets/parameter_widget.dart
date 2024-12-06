import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ParameterWidget extends StatelessWidget {
  const ParameterWidget({
    required this.icon,
    super.key,
    this.label,
    this.loading = false,
  });

  final IconData icon;
  final String? label;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Skeletonizer(enabled: loading, child: Icon(icon)),
          const SizedBox(height: 10),
          Skeletonizer(
            enabled: loading,
            child: Text(
              label ?? BoneMock.name,
              style: PureAirTextTheme.of(context)?.captionBold,
            ),
          ),
        ],
      ),
    );
  }
}
