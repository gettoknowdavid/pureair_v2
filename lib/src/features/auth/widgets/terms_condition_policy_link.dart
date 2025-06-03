import 'package:flutter/material.dart';
import 'package:pureair_v2/src/core/core.dart';

class TermsConditionPolicyLink extends StatelessWidget {
  const TermsConditionPolicyLink({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;
    final style = textTheme.captionBold?.copyWith(height: 1.6);
    final underlined = style!.copyWith(decoration: TextDecoration.underline);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(text: 'by Continuing, you accept our '),
            TextSpan(text: 'Terms and Conditions, ', style: underlined),
            TextSpan(text: 'Privacy Policy', style: underlined),
          ],
          style: style,
        ),
      ),
    );
  }
}
