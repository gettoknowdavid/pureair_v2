import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:pureair_v2/src/core/core.dart';

const kSearchBarHeight = 50.0;

class PSearchBar extends StatelessWidget {
  const PSearchBar({super.key, this.hintText, this.onChanged});
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding24,
      child: SizedBox(
        height: kSearchBarHeight,
        child: SearchBar(
          hintText: hintText ?? 'Search city',
          leading: const Icon(PhosphorIconsRegular.magnifyingGlass),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
