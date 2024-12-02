import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';

typedef PMessenger = ScaffoldFeatureController<SnackBar, SnackBarClosedReason>;

extension PureAirSnackbarX on BuildContext {
  PMessenger showErrorSnackBar(String message) {
    final colors = Theme.of(this).colorScheme;
    final textTheme = PureAirTextTheme.of(this)!;
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: colors.error,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: colors.onSurface),
        ),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: textTheme.caption?.copyWith(color: colors.onError),
        ),
      ),
    );
  }
}
