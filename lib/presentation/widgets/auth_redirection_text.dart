import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRedirectionText extends StatefulWidget {
  final String text;
  final String buttonText;
  final void Function() action;
  const AuthRedirectionText({
    super.key,
    required this.text,
    required this.buttonText,
    required this.action,
  });

  @override
  State<AuthRedirectionText> createState() => _AuthRedirectionTextState();
}

class _AuthRedirectionTextState extends State<AuthRedirectionText> {
  late TapGestureRecognizer _recognizer;

  @override
  void initState() {
    super.initState();
    _recognizer = TapGestureRecognizer()..onTap = widget.action;
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final style = textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: style,
        children: [
          TextSpan(text: widget.text),
          TextSpan(
            recognizer: _recognizer,
            text: widget.buttonText,
            style: style?.copyWith(
              color: colorScheme.primary,
              decoration: TextDecoration.underline,
              decorationThickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
