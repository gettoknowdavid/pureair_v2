import 'package:flutter/material.dart';
import 'package:pureair_v2/src/shared/shared.dart';

class ExploreSearchBarWidget extends StatelessWidget {
  const ExploreSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: PSearchBar(onChanged: (value) {}),
    );
  }
}
