import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/features/auth/auth.dart';
import 'package:pureair_v2/src/shared/widgets/loading_indicator.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final loading = context.select(
      (SignInCubit b) =>
          b.state.status == SignInStatus.inProgress && b.state.isGoogleSignIn,
    );

    return FilledButton.icon(
      onPressed: context.read<SignInCubit>().signInWithGoogle,
      label: loading
          ? const LoadingIndicator()
          : const Text('Continue with Google'),
      icon: loading ? null : const Icon(PhosphorIconsBold.googleLogo),
      style: FilledButton.styleFrom(
        backgroundColor: colorScheme.secondary,
        foregroundColor: colorScheme.onSecondary,
        iconSize: 20,
      ),
    );
  }
}
