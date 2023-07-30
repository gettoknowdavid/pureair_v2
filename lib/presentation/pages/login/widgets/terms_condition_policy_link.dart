import 'package:flutter/material.dart';
import 'package:pureair_v2/constants/constants.dart';

class TermsConditionPolicyLink extends StatelessWidget {
  const TermsConditionPolicyLink({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: kHorizontalPadding18,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            const TextSpan(text: 'by Continuing, you accept our '),
            TextSpan(
              text: 'Terms and Conditions, ',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
