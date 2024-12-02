import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pureair_v2/src/core/core.dart';

class SignUpRedirectionButton extends ConsumerWidget {
  const SignUpRedirectionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = PureAirTextTheme.of(context)!;
    return Align(
      child: Wrap(
        children: [
          Text("Don't have an account?", style: textTheme.captionBold),
          const SizedBox(width: 4),
          InkWell(
            onTap: () => context.push(R.register),
            child: Text(
              'Sign Up now',
              style: textTheme.captionBold?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInRedirectionButton extends StatelessWidget {
  const SignInRedirectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = PureAirTextTheme.of(context)!;
    return Align(
      child: Wrap(
        children: [
          Text('Already got an account?', style: textTheme.captionBold),
          const SizedBox(width: 4),
          InkWell(
            onTap: context.pop,
            child: Text(
              'Sign In now',
              style: textTheme.captionBold?.copyWith(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
