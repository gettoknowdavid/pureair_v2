import 'package:flutter/material.dart';
import 'package:pureair_v2/src/shared/widgets/loading_indicator.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    this.onPressed,
    this.disabled = false,
    this.loading = false,
    super.key,
    this.height,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool disabled;
  final bool loading;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: FilledButton(
        onPressed: loading || disabled ? null : onPressed,
        child: loading ? const LoadingIndicator() : Text(title),
      ),
    );
  }
}
