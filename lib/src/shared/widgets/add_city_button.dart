import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';

class AddCityButton extends StatelessWidget {
  const AddCityButton({
    required this.onPressed,
    this.label = 'Add',
    this.disabled = false,
    this.loading = false,
    this.height = 30,
    this.width = 70,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool disabled;
  final bool loading;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton.icon(
        onPressed: disabled || loading ? null : onPressed,
        icon: const PhosphorIcon(PhosphorIconsBold.plus, size: 14),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.tertiary,
          foregroundColor: colors.onTertiary,
          iconColor: colors.onTertiary,
          textStyle: PureAirTextTheme.of(context)?.caption,
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}
