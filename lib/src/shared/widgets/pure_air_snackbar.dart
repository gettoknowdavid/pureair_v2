import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';

typedef PMessenger = ScaffoldFeatureController<SnackBar, SnackBarClosedReason>;

extension PureAirSnackbarX on BuildContext {
  PMessenger showErrorSnackBar(String message) {
    final colors = Theme.of(this).colorScheme;
    final textTheme = PureAirTextTheme.of(this)!;
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: colors.error,
        content: Text(
          message,
          style: textTheme.caption?.copyWith(color: colors.onError),
        ),
      ),
    );
  }

  PMessenger showSuccessSnackBar(String message) {
    final colors = Theme.of(this).colorScheme;
    final textTheme = PureAirTextTheme.of(this)!;
    return ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: colors.primary,
        content: Text(
          message,
          style: textTheme.caption?.copyWith(color: colors.onPrimary),
        ),
      ),
    );
  }

  PMessenger showAuthExceptionMessageOrElse(AuthException exception) {
    return showErrorSnackBar(
      exception.maybeWhen(
        orElse: () => ErMsg.unknown,
        message: (error) => error,
      ),
    );
  }
}
