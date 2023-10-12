import 'package:flutter/material.dart';

class NoMailAppDialog extends StatelessWidget {
  const NoMailAppDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Oops!', textAlign: TextAlign.center),
      content: const Text('No mail apps found', textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Okay'),
        ),
      ],
    );
  }
}
