import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';
import 'package:pureair_v2/src/router/router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () => const ForgotPasswordRoute().push(context),
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
