import 'package:flutter/material.dart';

class MailAppDialog extends StatelessWidget {
  final Widget content;
  const MailAppDialog({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Your mail apps', textAlign: TextAlign.center),
      content: Column(
        children: [
          const Text(
            'Please select your preferred mail application',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
      actions: [
        OutlinedButton(
          onPressed: () {},
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
