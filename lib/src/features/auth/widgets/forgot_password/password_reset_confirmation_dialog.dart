import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/router/routing.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class PasswordResetConfirmationDialog extends StatelessWidget {
  const PasswordResetConfirmationDialog({
    required this.emailAddress,
    super.key,
  });

  final EmailAddress emailAddress;

  @override
  Widget build(BuildContext context) {
    final emailStyle = PureAirTextTheme.of(context)!.bodyBold;
    return AlertDialog(
      title: const Text('Password Reset Mail Sent'),
      content: Text.rich(
        TextSpan(
          children: [
            const TextSpan(text: "We've sent a password reset mail to "),
            TextSpan(
              text: emailAddress.getOrCrash,
              style: emailStyle?.copyWith(decoration: TextDecoration.underline),
            ),
            const TextSpan(text: '. Follow the instructions, then come '),
            const TextSpan(text: 'back and use your new password to sign in.'),
          ],
        ),
      ),
      actions: [
        PrimaryButton(
          title: 'Go back to Sign In',
          height: 42,
          onPressed: () => const SignInRoute().push(context),
        ),
      ],
    );
  }
}
