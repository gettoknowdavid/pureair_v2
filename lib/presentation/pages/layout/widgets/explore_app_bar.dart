import 'package:flutter/material.dart';

class ExploreAppBar extends StatelessWidget {
  const ExploreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Air Quality in the World',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
