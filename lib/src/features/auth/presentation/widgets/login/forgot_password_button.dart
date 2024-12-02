import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pureair_v2/src/core/core.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => context.push(R.forgotPassword),
        child: Text(
          'Forgot Password?',
          style: textTheme.captionBold?.copyWith(
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
